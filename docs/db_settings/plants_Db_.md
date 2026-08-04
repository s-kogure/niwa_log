# 植物マスタ情報の設計

本書は `plants` を中心に、`user_plants` / `user_plant_tags` / `watering_logs` / `observation_logs` / `weather_cache` / `plant_master_requests` の設計方針をまとめる。

現行のテーブル定義は `db_test/001_create_table.sql` を正とする。本書では、001に実装済みの項目と、検討はしたが v1 では実装しない項目を区別して記載する。RLS・権限まわりは `docs/db_settings/RLS.md` を参照。

各項目には次の区分を付ける。

| 区分 | 意味 |
|---|---|
| 実装済み | `001_create_table.sql` に存在する |
| v1では持たない | 検討のうえ v1 では実装しないと決定済み |
| 未確定 | 実装するか未決定。001には未実装 |

---

## plants 初期データ方針

- 初期データあり
- 大分類ごとに20件前後を目安に作成
- 想定分類：ハーブ / 観葉植物 / 野菜 / 多肉植物 / 必要に応じて草花・樹木・その他
- データ収集ルールは後続で決定
- 初期データ作成はエージェント利用想定
- ユーザー申請による追加にも対応する

> ※申請中の植物は `plants` に入れず、`plant_master_requests` に置く。
> `plant_master_requests` は未処理申請のみを保持する作業キューであり、承認時は `plants` へ登録したうえで申請行を削除する。
> 詳細は「plant_master_requests設計」を参照。
> 通常利用では `plants` だけを見る。

---

## 基本構造

- 植物名
- plant_category（大分類）
- 親カテゴリ / 親植物
- preferred_moisture_level（好む土壌水分傾向）
- watering_pace（水やりペース）
- watering_amount（水やり量）
- reference_url

## plant_category内の分類

`plant_category` は、ざっくりとした植物の分類（園芸用土を基準にした目安）。

- herb = ハーブ
- foliage = 観葉植物
- vegetable = 野菜
- succulent = 多肉植物
- flower = 草花
- tree = 樹木
- other = その他

## plants テーブル定義

| Field | 説明 | 区分 | 備考 |
|---|---|---|---|
| id | 植物マスタID | 実装済み | uuid |
| parent_id | 親カテゴリID | 実装済み | 例: ラベンダー > イングリッシュラベンダー |
| name | 植物名 | 実装済み | 一意。例: ローズマリー、ミニトマト |
| plant_category | 植物カテゴリ | 実装済み | herb / foliage / vegetable / succulent / flower / tree / other |
| preferred_moisture_level | 好む土壌水分傾向 | 実装済み | 0.05〜1.00。ラベンダー: 0.25 |
| watering_amount | 1回あたりの水量目安 | 実装済み | light / moderate / heavy |
| watering_pace | 短い水やり文言 | 実装済み | 例: 土がしっかり乾いてから。 |
| watering_notes | 条件つきメモ | 実装済み | 例: 定着後は乾燥気味に管理。 |
| reference_url | 育て方参考URL | 実装済み | — |
| created_at / updated_at | 作成・更新日時 | 実装済み | updated_at はトリガーで自動更新 |
| watch_dry_out | 水切れ注意フラグ | v1では持たない | true / false / conditional |
| created_from_request_id | 申請ID参照 | v1では持たない | 作業キュー方式のため使用しない |
| avoid_overwatering | 過湿注意フラグ | 未確定 | true / false |
| evidence_confidence | 調査根拠の信頼度 | 未確定 | high / medium / low |
| approval_status | 承認状態 | 未確定 | approved / pending / rejected |
| approved_at | 承認日時 | 未確定 | — |

`approval_status` / `approved_at` については、作業キュー方式では「`plants` に行が存在すること＝承認済み」と解釈できるため、列として必要かどうかを別途判断する。

## plantsで持つ・持たないデータ

### 持つ項目

- preferred_moisture_level
- watering_amount
- watering_pace
- watering_notes

### v1では持たない項目

- watch_dry_out
- water_coefficient
- watering_interval_days

係数や間隔は固定値としてDBに持たず、実行時に動的に計算する。

### 未確定の項目

- avoid_overwatering

---

## user_plants設計

ユーザーの庭にいる植物個体。`plants` を参照しつつ、そのユーザー・その庭での個別条件を持つ。

水やり係数にかかわる項目は「水やり計算」列に○を付ける。

| Field | 説明 | 区分 | 水やり計算 | 備考 |
|---|---|---|---|---|
| id | ユーザー植物ID | 実装済み | | uuid |
| garden_id | 所属する庭ID | 実装済み | | `gardens.id` |
| plant_id | 植物マスタID | 実装済み | | `plants.id`。例: この個体はイングリッシュラベンダー |
| nickname | 個体名 | 実装済み | | 例: 若君、卿、辺境伯、アルディッシュ |
| planting_method | 植え方 | 実装済み | ○ | pot / ground（既定値 pot）。画面上では 鉢植え / 直植え |
| pot_material | 鉢素材 | 実装済み | ○ | terracotta / plastic / ceramic / unknown |
| soil_profile | 土の乾きやすさ | 実装済み | ○ | well_draining / normal / moisture_retentive / unknown |
| growth_stage | 生育段階 | 実装済み | | seedling / growing / flowering / fruiting / mature / dormant / unknown |
| health_status | 健康状態 | 実装済み | | healthy / weak / recovering / critical / dead / unknown |
| memo | 個体メモ | 実装済み | | 追加フォームでは出さず、詳細/編集で扱う |
| created_at / updated_at / deleted_at | 作成・更新・論理削除 | 実装済み | | created_at は登録日表示にも使う |
| user_id | 所有ユーザーID | v1では持たない | | `garden_id` → `gardens.owner_id` で判定する |
| zone_id / zone_label | ゾーン | 未確定 | ○ | 例: 西側、軒下、花壇など |
| location_type | 室内外の区分 | 未確定 | | 室内対応は保留 |

### 所有者判定

`user_plants` は `user_id` を持たない。所有者は `garden_id` → `gardens.owner_id` を経由して判定する。RLSの所有者条件も同じ経路を使う（`RLS.md` 3章・7.5参照）。

### 栽培終了の扱い

栽培終了は物理削除ではなく `deleted_at` を設定して扱う。

- 公開庭の閲覧者には、`deleted_at` が設定された個体を表示しない
- 所有者本人は栽培終了済みの個体を履歴として閲覧できる

### 補足情報の管理方針

- pot_material → 素焼き鉢なら乾きやすい
- soil_profile → 乾きやすい土なら水やり間隔が短くなる
- zone_id / zone_label → 軒下、日向、室外機近く、西側などの環境差
- planting_method → 鉢植え / 地植え

頻繁に計算に使うものはカラムとして保持し、自由度の高いものは `user_plant_tags` で管理する。

基本責務は確定。v1最低限の項目も確定。水やり計算に使う環境系カラムは後続の計算ロジック設計で最終判断。

## user_plant_tags設計

| Field | 説明 | 区分 |
|---|---|---|
| id | タグID | 実装済み |
| user_plant_id | 対象の個体ID | 実装済み |
| name | タグ名 | 実装済み |
| created_at | 作成日時 | 実装済み |
| tag_type | タグ種別 | 未確定 |

同一個体に同じ名前のタグは登録できない（`unique (user_plant_id, name)`）。

タグ例: 素焼き鉢, 乾きやすい土, 軒下, 半地植え, 寄せ植え, 療養中, 要観察

---

## 水やり判断での役割分担

- **plants**: 植物としての性質（乾燥寄りか、水量はどの程度かなど）
- **user_plants**: 庭の個体条件（鉢の種類、土の質、日当たり環境など）
- **watering_logs**: 水やりの履歴（前回のタイミング）
- **weather_cache**: 気象状況（気温、雨、湿度、天気）
- **JS計算ロジック**: 上記情報を統合し、今回の水やりスコアや目安を算出する

### 結論

- `plants` には「植物としての共通の性質」を定義する
- `user_plants` には「特定の庭の特定の個体条件」を定義する
- 係数や間隔は固定値としてDBに持たず、実行時に動的に計算する

---

## watering_logs設計

| Field | 説明 | 区分 |
|---|---|---|
| id | ログID | 実装済み |
| user_plant_id | 対象の個体ID | 実装済み |
| watered_at | 水やり日時 | 実装済み |
| created_at | 作成日時 | 実装済み |
| amount | 水やり量 | v1では持たない |
| memo | 自由記述メモ | v1では持たない |
| updated_at | 更新日時 | v1では持たない |

水やりログは、ユーザーが気軽に記録できることを優先する。開発者都合の分析用入力は増やさない。

構造化された moisture_observation は v1 では持たない。

> ※土の状態・植物の様子・水やり理由などの自由記述をどこに残すかは未確定。
> v1の `watering_logs` は `memo` を持たないため、`observation_logs` との役割分担を別途整理する。

## observation_logs設計

| Field | 説明 | 区分 |
|---|---|---|
| id | ログID | 実装済み |
| user_plant_id | 対象の個体ID | 実装済み |
| observed_at | 観察日時 | 実装済み |
| memo | 観察メモ（必須） | 実装済み |
| created_at | 作成日時 | 実装済み |

公開庭では、観察記録をログイン済み閲覧者へ表示する（`RLS.md` 7.8参照）。水やり履歴は公開しない点と扱いが異なる。

---

## weather_cache設計

| Field | 説明 | 区分 |
|---|---|---|
| id | キャッシュID | 実装済み |
| region_id | 地域ID | 実装済み |
| source | 取得元 | 実装済み |
| weather_condition | 天気 | 実装済み |
| temperature_c | 気温 | 実装済み |
| humidity_percent | 湿度 | 実装済み |
| precipitation_probability | 降水確率 | 実装済み |
| precipitation_mm | 降水量 | 実装済み |
| target_at | 対象日時 | 実装済み |
| fetched_at | 取得日時 | 実装済み |
| data_type | 種別（current / forecast） | 実装済み |
| raw_json | APIレスポンス原文 | v1では持たない |

`weather_cache` は天気APIの取得結果を保存するキャッシュテーブル。ユーザー入力ではなく、cron等の定期処理で自動更新する。

v1では1日4回程度の取得を想定する。画面表示や水やりスコア算出時は、外部APIを直接叩かず `weather_cache` を参照する。

### 一意制約

一意制約は `(region_id, target_at, data_type)` とする。同一地域・同一対象日時・同一種別のデータは重複させず、再取得時に更新する。

`source` は列としては保持するが、一意制約には含めない。複数の取得元を併用する場合の扱いは未確定。

### 取得タイミング（例）

- 05:00 → 朝イチの水やり目安・当日予報用。必須扱い。
- 11:00 → 午前〜昼の気温上昇・雨予報変化の補正。
- 17:00 → 夕方以降の確認・翌朝に向けた変化確認。
- 23:00 → 翌日予報の事前キャッシュ。

---

## plant_master_requests設計

履歴テーブルではなく、未処理申請のみを保持する作業キューとする。

- 行の存在自体が pending を表す
- 承認時は `plants` へ登録後、申請行を削除する
- 却下時は申請行を削除する
- `status` / `updated_at` / `approved_plant_id` / `created_from_request_id` は使用しない
- サーバー側処理でも `status` を前提にしない

| Field | 説明 | 区分 |
|---|---|---|
| id | 申請ID | 実装済み |
| requested_name | 申請された植物名 | 実装済み |
| submitted_by | 申請者（`users.id`） | 実装済み |
| created_at | 申請日時 | 実装済み |
| status | 申請状態 | 使用しない |
| updated_at | 更新日時 | 使用しない |
| approved_plant_id | 承認後の `plants.id` | 使用しない |

一般ユーザーにはINSERT権限のみを付与する。SELECT権限は付与しないため、一般ユーザーによる申請一覧の取得は `permission denied` となる（`RLS.md` 7.10参照）。

---

## その他

水やりスコア算出ロジックは、DB設計の一部というより、後続のアプリの心臓部として別タスクに切る。

## 未確定項目の一覧

実装するか未決定で、001に未実装のもの。

| テーブル | 項目 | 論点 |
|---|---|---|
| plants | avoid_overwatering | 過湿注意フラグを列として持つか、`watering_notes` の文言で足りるか |
| plants | evidence_confidence | 初期データの調査根拠を管理するか |
| plants | approval_status / approved_at | 作業キュー方式で「存在＝承認済み」とするなら不要か |
| user_plants | zone_id / zone_label | ゾーンをテーブル化するか、ラベル文字列で持つか、v1では持たないか |
| user_plants | location_type | 室内対応の扱い |
| user_plant_tags | tag_type | タグに種別を持たせるか |
| watering_logs / observation_logs | 自由記述の置き場所 | 水やり理由などを `observation_logs` に寄せるか、`watering_logs.memo` を復活させるか |
| weather_cache | source の扱い | 複数の取得元を併用する場合、一意制約に `source` を含めるか |
