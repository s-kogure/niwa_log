# niwa.log

家庭で育てている植物の個体管理、水やり履歴、天気情報を組み合わせて、水やり判断を支援する個人開発Webアプリケーションです。

自宅のハーブガーデン管理を出発点としていますが、MVPではハーブに限定せず、家庭園芸で実際に栽培・管理される植物を対象とします。

## 現在の開発状況

2026年9月時点では、Phase 4「データベース設計」まで完了し、Phase 5「バックエンド基盤」に着手しています。

Phase 4では以下を完了しています。

- 主要10テーブルのDB設計
- テーブル間リレーション設計
- Row Level Security（RLS）設計
- migration SQL `001`〜`010`
- `regions` 初期seed 1,747件
- `plants` 初期seed 107件
- seed調査ログ
- plants seedのAIレビュー・人間レビュー
- PostgreSQL 17でのmigration `001`〜`010` 通し実行試験
- DB制約、parent参照、RLS拒否・許可動作の確認

現在は、Docker / Compose、環境変数、DB接続、migration実行経路、Express、認証・認可ミドルウェア等のバックエンド基盤を整備しています。

> Phase 4のmigration実行試験は、Supabase依存部分を最小スタブで再現した使い捨てPostgreSQL 17環境で実施しています。実際のSupabase環境でのAuth / RLS検証と正式なmigration実行経路の確定はPhase 5で行います。

## 目的

niwa.logは実用アプリであると同時に、以下を実践的に学ぶための個人開発プロジェクトです。

- PostgreSQL / RDB設計
- 正規化・リレーション設計
- マルチユーザー設計
- Supabase Auth
- 認証・認可
- Row Level Security
- Node.js / Express
- React
- Docker / Compose
- migration管理
- 外部API連携
- キャッシュ設計
- プライバシーを考慮した情報設計

最短距離で動かすことだけではなく、各レイヤーの責務や設計理由、トレードオフを理解しながら開発することを目的としています。

## MVPの主要フロー

```text
ユーザー
  ↓
庭・地域設定
  ↓
育てている植物個体を登録
  ↓
植物一覧
  ↓
水やり記録
  ↓
植物特性・履歴・季節・天候等を使った水やり判断支援
```

主な機能は以下を想定しています。

| 機能 | 概要 |
| --- | --- |
| ユーザー認証 | Supabase Authを利用した認証 |
| 庭・地域設定 | 庭の環境条件と市区町村単位の地域を管理 |
| 植物マスタ | 家庭園芸向け植物マスタの検索・参照 |
| 植物個体管理 | ユーザーが実際に育てている植物を個体単位で管理 |
| 水やりログ | 植物個体ごとの水やり日時を記録 |
| 観察ログ | 植物個体の状態や観察メモを記録 |
| 水やり判断支援 | 植物特性・履歴・季節・天候等から必要度を計算 |
| 天気連携 | 地域単位で気象データを取得・キャッシュ |
| 植物マスタ追加申請 | 未登録植物をマスタへ追加するための申請キュー |

## 技術構成

| レイヤー | 技術 |
| --- | --- |
| フロントエンド | React |
| バックエンド | Node.js / Express |
| 認証 | Supabase Auth |
| データベース | PostgreSQL / Supabase |
| DB認可 | PostgreSQL Row Level Security |
| 開発環境 | Docker / Compose |
| 外部API | 天気API（実装予定） |

バックエンド基盤と正式なローカル開発・migration実行経路はPhase 5で整備中です。

## データモデル

Phase 4完了時点の主要テーブルは10テーブルです。

| テーブル | 役割 |
| --- | --- |
| `users` | Supabase Authのユーザーとアプリ内ユーザーを紐付ける |
| `regions` | 市区町村単位の地域マスタ |
| `gardens` | ユーザーの庭と栽培環境を管理 |
| `plants` | 承認済み植物マスタ |
| `user_plants` | ユーザーが実際に育てている植物個体 |
| `user_plant_tags` | 植物個体につける自由タグ |
| `watering_logs` | 水やりした事実・日時を記録 |
| `observation_logs` | 植物の観察日時とメモを記録 |
| `weather_cache` | 地域単位の気象データを保持 |
| `plant_master_requests` | 未登録植物の追加申請を保持する作業キュー |

### `plants` と `user_plants`

`plants` は植物そのもののマスタ、`user_plants` はユーザーが実際に育てている個体です。

```text
plants
└─ ラベンダー

user_plants
└─ うちのラベンダー3号
```

植物マスタは最大2階層です。親子関係は厳密な植物分類学の再現ではなく、水やり・用土・耐暑性・耐寒性・日照・栽培環境等に継続的かつ実用上意味のある管理差がある場合に使用します。

`plant_category` は一般ユーザーが園芸上どの用途・売り場・名称で認識するかを表し、以下の値を使用します。

```text
foliage
flower
orchid
herb
vegetable
fruit
succulent
other
```

植物の生育形態は別軸の `growth_form` で管理します。

```text
herbaceous
shrub
tree
vine
other
unknown
```

## 認証・認可

### 認証

認証にはSupabase Authを使用します。

アプリ内の `public.users.auth_user_id` が `auth.users.id` を参照し、RLSでは `auth.uid()` を利用してログインユーザーを識別する設計です。

### DB認可

主要なユーザーデータにはRow Level Securityを適用しています。

基本方針は以下です。

- ユーザー本人が所有するデータのみ更新可能
- 公開設定された庭は、許可された範囲のみ閲覧可能
- `regions` / `plants` / `weather_cache` 等の共有マスタ・共有データは一般ユーザーから更新不可
- `plant_master_requests` の管理処理やマスタ更新等はサーバー側管理処理として分離
- 未ログインの `anon` ロールにはMVPでデータアクセスを許可しない

Express側の認証・認可ミドルウェアとの責務分担はPhase 5で実装します。

## プライバシー設計

天気情報との連携には地域情報が必要ですが、niwa.logではユーザーの正確な緯度経度を直接保存しません。

庭は `regions` を参照し、市区町村単位で地域を管理します。

```text
ユーザーの庭
  ↓
regions（市区町村）
  ↓
天気情報取得・地域単位キャッシュ
```

これにより、天気連携に必要な地域情報を保持しながら、正確な居住位置をDBへ保存しない構造にしています。

## `regions` 初期データ

`regions` には総務省「全国地方公共団体コード」を基に、現行市区町村1,747件を登録しています。

- 公式データ基準日: 2024-01-01
- `municipality_code`: 6桁・チェックディジット込み
- 先頭0を保持するため `text` 型
- `is_active`: 現行自治体を `true` として管理

自治体の将来的な廃止・統合時にも既存データからの参照を維持できるよう、物理削除ではなく `is_active` で新規利用可否を管理する設計です。

## `plants` 初期データ

Phase 4完了時点のplants seedは以下です。

- 親レコード: 99件
- 子レコード: 8件
- 合計: 107件

カテゴリ別件数:

| category | 件数 |
| --- | ---: |
| herb | 23 |
| orchid | 5 |
| succulent | 9 |
| fruit | 8 |
| foliage | 16 |
| flower | 28 |
| vegetable | 18 |

初期seedでは植物図鑑としての網羅性よりも、家庭園芸で実際に登録・管理され、水やり判断支援に利用する価値があることを優先しています。

植物情報は原則として複数の信頼できる園芸情報源を確認し、production DBには代表URLを保存しています。実際に確認した情報源と判断理由は `docs/seed_research/` に記録しています。

## 水やりデータの考え方

`preferred_moisture_level` は「何日に1回水をやるか」という固定周期ではなく、植物側の基礎的な水分要求傾向を表す0.05〜1.00の連続値です。

`watering_amount` は以下の3段階で、植物の基本的な給水特性を表します。

```text
light
moderate
heavy
```

最終的な水やり必要度では、以下のような情報を組み合わせる想定です。

- 最後の水やりからの経過時間
- 植物特性
- 栽培環境
- 季節
- 地域
- 気温
- 降雨
- 天気予報
- 水やり履歴

固定的な水やり周期をそのまま通知するのではなく、条件に応じた判断支援を目標としています。

## migration / seed

Phase 4で作成したSQLは現在 `db_test/` にあります。

```text
db_test/
├─ 001_create_table.sql
├─ 002_enable_rls.sql
├─ 003_create_policies.sql
├─ 004_create_auth_user_trigger.sql
├─ 005_grant_table_privileges.sql
├─ 006_revoke_default_privileges.sql
├─ 007_revoke_trigger_function_privileges.sql
├─ 008_update_seed_master_schema.sql
├─ 009_seed_regions.sql
└─ 010_seed_plants.sql
```

`009` / `010` はproduction初期データを投入する一回限りのmigrationとして扱い、将来のマスタ変更では既存ファイルを書き換えず、新しいmigrationを追加する方針です。

現在のSQLはPostgreSQL 17の使い捨て検証環境で `001`〜`010` の通し実行を確認済みです。ただし、Supabase実環境への正式な適用経路、transaction管理、ゼロからのDB再現手順はPhase 5で確定します。

## リポジトリ内の主な資料

```text
db_test/              DB migration / seed SQL
docs/                 設計・調査資料
docs/seed_research/   plants seed調査ログ
要件定義資料/          要件定義・設計資料
docker-compose.yml     Docker Compose基本構成
docker-compose.dev.yml 開発用Compose override
```

Docker / Composeおよびバックエンド実行環境はPhase 5で再確認・整備中のため、現時点のCompose構成を最終的なセットアップ手順とはしていません。

## 開発方針

- 現在のrepo実物と確定済み設計を優先する
- 認証と認可を分離して考える
- PostgreSQL / Supabase / Expressの責務を整理する
- RLSとアプリケーション側認可を併用し、責務を混同しない
- secretsをrepositoryへcommitしない
- 新規環境からDBを再現可能にする
- 実行していない試験を「確認済み」としない
- SQL上の妥当性とプロダクト利用上の妥当性を区別する
- 必要以上に複雑化せず、MVPで必要な範囲を優先する

## 今後の開発

現在のPhase 5では、以下のバックエンド基盤を整備します。

1. Docker / Compose確認
2. 環境変数設定
3. DB接続共通化
4. migration実行機構
5. Express基本構成
6. エラーハンドリング
7. 認証ミドルウェア
8. 認可ミドルウェア

その後は、ユーザー・庭・地域、plants検索、user_plants登録、植物一覧、watering_logs、水やり必要度スコアリング、天気連携の順にバックエンド機能を実装していく予定です。
