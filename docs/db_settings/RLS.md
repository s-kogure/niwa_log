# RLS設計ガイドライン

## 1. 目的

本書は、niwa.log の `public` スキーマに作成する10テーブルについて、Row Level Security（RLS）の基本方針、所有者判定、操作別の許可条件、業務仕様との境界、テスト観点を整理するものである。

実際の `CREATE POLICY` 文は `003_create_policies.sql` に記述する。本書では、Policyを実装できる粒度まで `USING` / `WITH CHECK` の条件を示す。

---

## 2. 基本方針

- 未ログインユーザーは全テーブルへアクセス不可とする
- Policyは `authenticated` ロール向けに作成する
- `anon` ロールには許可Policyを作成しない
- `public` の全10テーブルでRLSを有効化する
- 許可Policyが存在しない操作は拒否する
- 一般ユーザーには必要な行・操作だけを許可する
- 運営処理、定期処理、退会処理はサーバー側の管理権限で実行する
- サーバー専用の管理権限情報は、ブラウザや公開リポジトリに置かない

```text
RLSは全テーブルON
↓
一般ユーザーは必要な行・操作だけ許可
↓
それ以外は拒否
↓
運営処理はサーバー側
```

---

## 3. 所有者判定の基本経路

ログイン中のSupabase Authユーザーは `auth.uid()` で識別する。

niwa.log内部では、`users.auth_user_id` を介して `users.id` に対応付け、各データの所有者を判定する。

```text
auth.uid()
→ users.auth_user_id
→ users.id
→ gardens.owner_id
→ user_plants
→ user_plant_tags / watering_logs / observation_logs
```

基本となる対応関係は次のとおり。

```text
users.auth_user_id = auth.uid()
gardens.owner_id = users.id
user_plants.garden_id = gardens.id
```

---

## 4. Policy命名規則

Policy名は、原則として次の形式に統一する。

```text
テーブル名_操作_許可範囲
```

すべて小文字の `snake_case` とする。

例：

```text
users_select_own
regions_select_authenticated
gardens_select_owner_or_public
gardens_insert_own
gardens_update_own
```

許可範囲には、主に次の語を使用する。

- `own`：所有者本人だけ
- `owner_or_public`：所有者本人、または公開対象
- `authenticated`：ログイン済みユーザー全員
- `visible_parent`：親データを閲覧できる場合のみ

---

## 5. USING / WITH CHECK の使い分け

RLS Policyは、操作ごとに確認する対象が異なる。

| 操作 | 使用する句 | 確認対象 |
|---|---|---|
| SELECT | `USING` | 既存行を閲覧してよいか |
| INSERT | `WITH CHECK` | 新しく追加する行を受け入れてよいか |
| UPDATE | `USING` | 変更前の行を更新してよいか |
| UPDATE | `WITH CHECK` | 変更後の行が許可条件を満たすか |
| DELETE | `USING` | 既存行を削除してよいか |

UPDATEでは、所有者判定に使用する外部キーを他人のデータへ付け替えられないよう、`USING` と `WITH CHECK` の両方を明記する。

---

## 6. RLSと業務仕様の区分

### RLSで制御するもの

- 誰がどの行を閲覧できるか
- 誰がどの行を追加できるか
- 誰がどの行を更新できるか
- 誰がどの行を削除できるか
- INSERT後、UPDATE後の所有関係が正しいか

### アプリ・サーバー側の業務仕様として扱うもの

- 物理削除と論理削除の使い分け
- `deleted_at` を設定する処理手順
- 退会処理の実行順序
- 植物マスタ申請の承認・却下フロー
- 天気予報キャッシュの更新・削除タイミング
- 運営による例外対応

以下の各テーブルでは、「Policy」と「業務仕様」を分けて記載する。

---

# 7. テーブル別設計

## 7.1 users

### Policy

#### SELECT：本人の行だけ

Policy名：

```text
users_select_own
```

条件：

```sql
USING (
  auth_user_id = (SELECT auth.uid())
)
```

#### INSERT / UPDATE / DELETE

一般ユーザー向けPolicyは作成しない。

### 業務仕様

- `auth.users` 作成時のDB triggerが `public.users` を作成する
- 一般ユーザーは `public.users` を直接追加・更新・削除しない
- 退会処理はサーバー側で実行する
- `public.users` の行は物理削除せず、`deleted_at` と `auth_user_id` で退会状態を管理する
- 人間の管理者による手作業は例外時のみとする

---

## 7.2 regions

### Policy

#### SELECT：ログイン済みユーザー全員

Policy名：

```text
regions_select_authenticated
```

条件：

```sql
USING (true)
```

#### INSERT / UPDATE / DELETE

一般ユーザー向けPolicyは作成しない。

### 業務仕様

- 初期データは運営側で一括登録する
- 市区町村再編、名称変更、コード修正などの例外時のみサーバー側で更新する
- 通常運用では参照専用マスタとして扱う

---

## 7.3 gardens

### Policyで使用する条件

#### 所有者条件

```sql
EXISTS (
  SELECT 1
  FROM public.users
  WHERE users.id = gardens.owner_id
    AND users.auth_user_id = (SELECT auth.uid())
)
```

#### 公開閲覧条件

```sql
gardens.is_public = true
AND gardens.deleted_at IS NULL
```

### Policy

#### SELECT：所有者本人、または公開中の庭

Policy名：

```text
gardens_select_owner_or_public
```

```sql
USING (
  所有者条件
  OR 公開閲覧条件
)
```

#### INSERT：本人を所有者とする庭だけ

Policy名：

```text
gardens_insert_own
```

```sql
WITH CHECK (
  所有者条件
)
```

#### UPDATE：所有者本人だけ

Policy名：

```text
gardens_update_own
```

```sql
USING (
  所有者条件
)
WITH CHECK (
  所有者条件
)
```

#### DELETE

一般ユーザー向けPolicyは作成しない。

### 業務仕様

- 所有者本人は庭の名称、地域、環境情報、`is_public`、`deleted_at` を更新できる
- 庭の終了は物理削除ではなく、`deleted_at` を設定して扱う
- 公開庭を閲覧できるのはログイン済みユーザーだけとする
- 管理処理はサーバー側で実行する

---

## 7.4 plants

### Policy

#### SELECT：ログイン済みユーザー全員

Policy名：

```text
plants_select_authenticated
```

条件：

```sql
USING (true)
```

#### INSERT / UPDATE / DELETE

一般ユーザー向けPolicyは作成しない。

### 業務仕様

- 植物マスタの登録・修正はサーバー側の管理処理で行う
- 一般ユーザーによる植物追加希望は `plant_master_requests` から受け付ける
- マスタ行は通常運用では物理削除しない

---

## 7.5 user_plants

### Policyで使用する条件

#### 所有者条件

```sql
EXISTS (
  SELECT 1
  FROM public.gardens
  JOIN public.users
    ON users.id = gardens.owner_id
  WHERE gardens.id = user_plants.garden_id
    AND users.auth_user_id = (SELECT auth.uid())
)
```

#### 公開閲覧条件

```sql
EXISTS (
  SELECT 1
  FROM public.gardens
  WHERE gardens.id = user_plants.garden_id
    AND gardens.is_public = true
    AND gardens.deleted_at IS NULL
)
```

### Policy

#### SELECT：所有者本人、または公開中の庭に属する植物

Policy名：

```text
user_plants_select_owner_or_public
```

```sql
USING (
  所有者条件
  OR 公開閲覧条件
)
```

#### INSERT：本人が所有する庭へだけ追加可能

Policy名：

```text
user_plants_insert_own
```

```sql
WITH CHECK (
  所有者条件
)
```

#### UPDATE：本人が所有する庭の植物だけ

Policy名：

```text
user_plants_update_own
```

```sql
USING (
  所有者条件
)
WITH CHECK (
  所有者条件
)
```

#### DELETE

一般ユーザー向けPolicyは作成しない。

### 業務仕様

- 栽培終了は物理削除ではなく、所有者本人が `deleted_at` を更新して扱う
- 公開設定は `user_plants` 側に持たず、親の `gardens.is_public` に従う
- UPDATE後も本人の庭に属することを確認し、`garden_id` を他人の庭へ付け替えられないようにする

### 未決定事項

- 公開閲覧時に `user_plants.deleted_at IS NULL` を条件へ含め、栽培終了済み植物を非表示にするか
- 所有者本人には栽培終了済み植物を履歴として表示する方針を維持する

---

## 7.6 user_plant_tags

### Policyで使用する条件

#### 親植物の閲覧可能条件

```sql
EXISTS (
  SELECT 1
  FROM public.user_plants
  WHERE user_plants.id = user_plant_tags.user_plant_id
)
```

この条件は `user_plants` のSELECT Policyに依存する。親の植物を閲覧できる場合だけ、タグも閲覧できる。

#### 所有者条件

```sql
EXISTS (
  SELECT 1
  FROM public.user_plants
  JOIN public.gardens
    ON gardens.id = user_plants.garden_id
  JOIN public.users
    ON users.id = gardens.owner_id
  WHERE user_plants.id = user_plant_tags.user_plant_id
    AND users.auth_user_id = (SELECT auth.uid())
)
```

### Policy

#### SELECT：親植物を閲覧できる場合

Policy名：

```text
user_plant_tags_select_visible_parent
```

```sql
USING (
  親植物の閲覧可能条件
)
```

#### INSERT：所有者本人だけ

Policy名：

```text
user_plant_tags_insert_own
```

```sql
WITH CHECK (
  所有者条件
)
```

#### UPDATE：所有者本人だけ

Policy名：

```text
user_plant_tags_update_own
```

```sql
USING (
  所有者条件
)
WITH CHECK (
  所有者条件
)
```

#### DELETE：所有者本人だけ

Policy名：

```text
user_plant_tags_delete_own
```

```sql
USING (
  所有者条件
)
```

### 業務仕様

- タグは論理削除せず、不要になった場合は物理削除する
- タグ個別の公開設定は持たず、親の庭の公開設定に従う
- 公開庭の閲覧者はタグを閲覧できるが、追加・更新・削除はできない

---

## 7.7 watering_logs

### Policyで使用する所有者条件

```sql
EXISTS (
  SELECT 1
  FROM public.user_plants
  JOIN public.gardens
    ON gardens.id = user_plants.garden_id
  JOIN public.users
    ON users.id = gardens.owner_id
  WHERE user_plants.id = watering_logs.user_plant_id
    AND users.auth_user_id = (SELECT auth.uid())
)
```

### Policy

#### SELECT：所有者本人だけ

Policy名：

```text
watering_logs_select_own
```

```sql
USING (
  所有者条件
)
```

#### INSERT：所有者本人だけ

Policy名：

```text
watering_logs_insert_own
```

```sql
WITH CHECK (
  所有者条件
)
```

#### UPDATE：所有者本人だけ

Policy名：

```text
watering_logs_update_own
```

```sql
USING (
  所有者条件
)
WITH CHECK (
  所有者条件
)
```

#### DELETE：所有者本人だけ

Policy名：

```text
watering_logs_delete_own
```

```sql
USING (
  所有者条件
)
```

### 業務仕様

- 公開庭の閲覧者には水やり履歴を公開しない
- 入力時刻の訂正はUPDATEで行う
- 誤入力した水やり記録は物理削除できる
- 管理者による操作は例外時のみサーバー側で行う
- viewer専用の「直近の水やり日」表示は将来検討とする

---

## 7.8 observation_logs

### Policyで使用する条件

#### 親植物の閲覧可能条件

```sql
EXISTS (
  SELECT 1
  FROM public.user_plants
  WHERE user_plants.id = observation_logs.user_plant_id
)
```

この条件は `user_plants` のSELECT Policyに依存する。

#### 所有者条件

```sql
EXISTS (
  SELECT 1
  FROM public.user_plants
  JOIN public.gardens
    ON gardens.id = user_plants.garden_id
  JOIN public.users
    ON users.id = gardens.owner_id
  WHERE user_plants.id = observation_logs.user_plant_id
    AND users.auth_user_id = (SELECT auth.uid())
)
```

### Policy

#### SELECT：所有者本人、または公開中の庭の閲覧者

Policy名：

```text
observation_logs_select_visible_parent
```

```sql
USING (
  親植物の閲覧可能条件
)
```

#### INSERT：所有者本人だけ

Policy名：

```text
observation_logs_insert_own
```

```sql
WITH CHECK (
  所有者条件
)
```

#### UPDATE：所有者本人だけ

Policy名：

```text
observation_logs_update_own
```

```sql
USING (
  所有者条件
)
WITH CHECK (
  所有者条件
)
```

#### DELETE：所有者本人だけ

Policy名：

```text
observation_logs_delete_own
```

```sql
USING (
  所有者条件
)
```

### 業務仕様

- 公開庭では観察記録をログイン済み閲覧者へ表示する
- 誤入力や訂正時は物理削除できる
- 観察記録の公開設定は個別に持たず、親の庭の公開設定に従う
- 管理者による操作は例外時のみサーバー側で行う

---

## 7.9 weather_cache

### Policy

#### SELECT：ログイン済みユーザー全員

Policy名：

```text
weather_cache_select_authenticated
```

条件：

```sql
USING (true)
```

#### INSERT / UPDATE / DELETE

一般ユーザー向けPolicyは作成しない。

### 業務仕様

- 天気取得処理がサーバー側からINSERT・UPDATEを行う
- 予報データのupsertはサーバー側で行う
- 期限切れforecastの削除はサーバー側で行う
- 天気情報は個人情報ではないため、ログイン済みユーザー全員が全地域を閲覧できる

---

## 7.10 plant_master_requests

### Policyで使用する本人条件

```sql
EXISTS (
  SELECT 1
  FROM public.users
  WHERE users.id = plant_master_requests.submitted_by
    AND users.auth_user_id = (SELECT auth.uid())
)
```

### Policy

#### SELECT

一般ユーザー向けPolicyは作成しない。

#### INSERT：本人の `users.id` を指定した申請だけ

Policy名：

```text
plant_master_requests_insert_own
```

```sql
WITH CHECK (
  本人条件
)
```

#### UPDATE / DELETE

一般ユーザー向けPolicyは作成しない。

### 業務仕様

- v1では申請履歴・審査状況を一般ユーザーへ表示しない
- 一般ユーザーはpending申請を取り消さない
- 運営処理はサーバー側で行う
- 承認時は `plants` へ登録した後、申請行を削除する
- 却下時は申請行を削除する
- `plant_master_requests` は履歴テーブルではなく、未処理申請の作業キューとして扱う

---

# 8. RLSテストケース

SELECTで許可されない行は原則として取得結果が0件となる。INSERT・UPDATE・DELETEで許可されない操作は拒否される、または対象行を操作できないことを確認する。

テストでは最低2ユーザーを用意する。

```text
ユーザーA：庭Aの所有者
ユーザーB：庭Bの所有者
```

| No. | 操作 | 実行者 | 対象 | 期待結果 |
|---|---|---|---|---|
| 1 | SELECT | 未ログイン | 任意のpublicテーブル | アクセス不可 |
| 2 | SELECT | A | Aのusers行 | 1件取得 |
| 3 | SELECT | A | Bのusers行 | 0件 |
| 4 | SELECT | A | Aの庭 | 取得可能 |
| 5 | SELECT | A | Bの非公開庭 | 0件 |
| 6 | SELECT | A | Bの公開庭 | 取得可能 |
| 7 | INSERT | A | owner_idがAの庭 | 成功 |
| 8 | INSERT | A | owner_idがBの庭 | 拒否 |
| 9 | UPDATE | A | Aの庭のowner_idをBへ変更 | 拒否 |
| 10 | INSERT | A | Aの庭へuser_plants追加 | 成功 |
| 11 | INSERT | A | Bの庭へuser_plants追加 | 拒否 |
| 12 | SELECT | A | Bの公開庭に属するuser_plants | 取得可能 |
| 13 | SELECT | A | Bの公開庭に属するタグ | 取得可能 |
| 14 | INSERT | A | Bの公開庭に属する植物へタグ追加 | 拒否 |
| 15 | SELECT | A | Bの公開庭のwatering_logs | 0件 |
| 16 | INSERT | A | Aの植物へwatering_logs追加 | 成功 |
| 17 | INSERT | A | Bの植物へwatering_logs追加 | 拒否 |
| 18 | SELECT | A | Bの公開庭のobservation_logs | 取得可能 |
| 19 | SELECT | A | regions / plants / weather_cache | 取得可能 |
| 20 | INSERT / UPDATE / DELETE | A | regions / plants / weather_cache | 拒否 |
| 21 | INSERT | A | submitted_byがAの申請 | 成功 |
| 22 | INSERT | A | submitted_byがBの申請 | 拒否 |
| 23 | SELECT | A | plant_master_requests | 0件 |
| 24 | 管理処理 | サーバー側 | マスタ更新・申請処理・天気更新 | 成功 |

---

# 9. 実装時の確認事項

- `public` の全10テーブルでRLSが有効になっていること
- Policyの対象ロールが `authenticated` であること
- `anon` 向けPolicyが存在しないこと
- UPDATE Policyに `USING` と `WITH CHECK` の両方があること
- 所有者判定に `auth.uid()` から `users.auth_user_id` を経由していること
- 外部キーを書き換えて他人のデータへ移動できないこと
- 公開庭の閲覧者がINSERT・UPDATE・DELETEできないこと
- サーバー専用の管理権限情報がフロントエンドや公開リポジトリに含まれていないこと
- 2ユーザーと未ログイン状態でRLSテストを実施すること
