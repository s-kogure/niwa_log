# 開発フロー

## 全体の進め方

機能ごとに **DB → repository（SQL） → service（ロジック） → route（エンドポイント）** の順で縦に積む。
横断的に作るより、1機能ずつ動作確認しながら進めやすい。

---

## バックエンド実装順（v1）

### Step 1: DB接続の共通化
- `backend/src/db/pool.js`（pg.Pool のシングルトン）
- 全 repository から参照する共通モジュール

### Step 2: 認証（Auth）
- ユーザー登録 / ログイン
- JWT 発行・検証ミドルウェア
- ここが整わないと他機能のテストがしにくい

エンドポイント例：
```
POST /auth/register
POST /auth/login
```

### Step 3: 植物マスタ（plants）
- 親カテゴリ・子カテゴリの CRUD
- 名前の前方一致サジェスト
- 承認ステータス管理（モデレーター権限チェック）
- 2階層制約はサービス層で担保（parent_id の parent_id が NULL かチェック）

### Step 4: ユーザー個体（user_plants）
- 個体の登録・編集・削除
- ゾーン・タグの紐付け
- 地域サジェスト → regions への upsert（HeartRails Geo API）

### Step 5: 水やりログ（watering_logs）
- 水やり記録の追加・一覧取得
- 個体ごとの最終水やり日時を効率よく引く

### Step 6: 水やりスコアリング
- スコア計算ロジック（経過時間 × 種別係数 − 降雨補正）
- `GET /gardens/:id/scores` 等でまとめて返す設計

### Step 7: 天気取得・キャッシュ（weather_cache）
- OpenWeatherMap API 連携
- cron による定期取得（アクティブ期: 1〜2時間 / 休眠期: 1日1回）
- 地域単位でキャッシュ共有

---

## フロントエンド（React）

- **API が固まってから着手**すると手戻りが少ない
- `design_comp/` に置く静的 HTML カンプが出来たタイミングで並行可

---

## ブランチ・コミット運用

- メイン作業ブランチ：`dev`
- 作業前：`git pull --rebase origin dev`
- 作業後：`dev` への PR を作成
- コミットは Claude がやった場合わかるようにする

---

## API 動作確認ツール

curl または [Bruno](https://www.usebruno.com/)（無料・オフラインで使えるAPIクライアント）が手軽。
