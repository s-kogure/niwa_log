# niwa.log DB設計メモ 清書版

対象: plants / user_plants / watering_logs / weather_cache

## 0. このメモの目的

このメモは、niwa.log v1 のDB設計のうち、植物情報と水やり判断に関係する主要テーブルの設計方針を整理したもの。

対象テーブルは以下。

- plants
- user_plants
- user_plant_tags
- watering_logs
- weather_cache

水やりスコア算出ロジックそのものはDB設計とは分け、後続タスクとして扱う。  
DB側では、スコア計算に使える材料を保存する。

---

## 1. 全体方針

niwa.logでは、植物情報を以下の役割に分ける。

### plants

アプリ全体で共有する植物マスタ。  
植物そのものの共通情報を持つ。

例:

- ラベンダー
- イングリッシュラベンダー
- ローズマリー
- ミニトマト

plantsには、ユーザー個別の情報は入れない。

### user_plants

ユーザーの庭に登録された植物個体。  
「このユーザーの、この庭にいる、この植物」の情報を持つ。

例:

- 若君
- 卿
- 辺境伯
- アルディッシュ

ニックネーム、植え方、鉢素材、土の乾きやすさ、健康状態などは user_plants 側に持つ。

### watering_logs

水やりした事実を記録する。  
植物マスタや個体情報とは分ける。

### weather_cache

天気APIから取得した気象情報を保存するキャッシュ。  
水やりスコア算出時の補正材料として使う。

---

## 2. 水やり係数の方針

当初は plants に `water_coefficient` や `watering_interval_days` のような固定値を持たせる案があった。

ただし、実際の水やり間隔は以下の条件で大きく変わる。

- 季節
- 気温
- 湿度
- 雨
- 鉢植え / 地植え
- 鉢素材
- 土の乾きやすさ
- 置き場所
- 過去の水やりログ

例として、同じラベンダー系の鉢でも、梅雨・25℃前後では5日程度でよかった一方、急に夏化した条件では中1日程度まで水やり間隔が短くなることがある。

このため、v1では固定の水やり係数や固定日数をDBに保存しない。

代わりに、plantsには植物特性パラメータを持たせる。

- preferred_moisture_level
- watering_amount
- watering_pace
- watering_notes
- avoid_overwatering
- watch_dry_out

実際の水やりスコアや推奨水やり間隔は、JS側で表示時に計算する。

---

## 3. plants設計

### 3.1 役割

plants は、アプリ全体で共有する植物マスタ。

植物そのものの性質、水分嗜好、参考URL、承認状態などを持つ。

plants にユーザー個別情報は入れない。

入れない例:

- ニックネーム
- 庭の置き場所
- 植え方
- 鉢素材
- 土の状態
- 健康状態
- 水やり履歴
- 個体メモ
- 管理タグ

### 3.2 初期データ方針

plants は初期データを持つ。

初期データは、大分類ごとに20件前後を目安に作成する。

想定分類:

- herb
- foliage
- vegetable
- succulent
- flower
- tree
- other

初期データ作成は、ガーデニング関連サイトの調査結果をもとにする。  
収集時は、係数化を急がず、原文・URL・条件・要約を残す。

ユーザー申請による植物追加にも対応する。

申請中の植物は plants に直接入れず、plant_master_requests に保存する。  
承認後に plants に正式登録し、plant_master_requests 側には `approved_plant_id` を持たせる。  
plants 側には `approved_at` と `created_from_request_id` を持たせる。

### 3.3 plant_category

`plant_category` は、ざっくりした園芸上の分類を表す。

候補:

- herb
- foliage
- vegetable
- succulent
- flower
- tree
- other

現行MVPで `plant_type` という名前を使っている場合でも、設計名としては `plant_category` に寄せる。  
`plant_type` は意味が広く、用途が揺れやすいため。

### 3.4 preferred_moisture_level

`preferred_moisture_level` は、植物が好む土壌水分傾向を表す。

0.00〜1.00 の正規化値。

- 0.00 に近いほど乾燥を好む
- 1.00 に近いほど湿り気を好む

ただし通常運用では 0.00 は使わず、0.05〜1.00 程度を使う。  
多肉やサボテンでも水分ゼロではないため、0.00は理論上の最小値として扱う。

目安:

- 0.05: 極乾燥寄り。サボテン、一部多肉
- 0.10: かなり乾燥寄り。多肉、乾燥地性植物
- 0.20〜0.30: 乾燥寄り。ラベンダー、ローズマリー
- 0.50: 標準。表土が乾いたら水やり系
- 0.70: やや湿り気を好む。水切れ注意系
- 0.90〜1.00: 湿潤寄り。水辺・湿地性寄り

この値は水やりスコアそのものではない。  
JS側の水やり判断ロジックで使う計算用パラメータ。

### 3.5 plants 想定カラム

| Field                    | Description           | Notes / Examples                                               |
| ------------------------ | --------------------- | -------------------------------------------------------------- |
| id                       | 植物マスタID          | 主キー                                                         |
| parent_id                | 親植物ID              | 例: ラベンダー > イングリッシュラベンダー                      |
| name                     | 植物名                | 例: ローズマリー、ミニトマト                                   |
| plant_category           | 植物カテゴリ          | herb / foliage / vegetable / succulent / flower / tree / other |
| preferred_moisture_level | 好む土壌水分傾向      | 0.05〜1.00程度。ラベンダーは0.20〜0.30候補                     |
| watering_amount          | 1回あたりの水量目安   | light / moderate / heavy                                       |
| watering_pace            | 短い水やり文言        | 例: 土がしっかり乾いてから                                     |
| watering_notes           | 条件つきメモ          | 例: 定着後は乾燥気味に管理。鉢植え・夏・小鉢では乾きやすい     |
| avoid_overwatering       | 過湿注意フラグ        | true / false                                                   |
| watch_dry_out            | 水切れ注意フラグ      | true / false / conditional                                     |
| reference_url            | 代表的な育て方参考URL | 複数ソースは調査メモ側に残す                                   |
| approval_status          | 承認状態              | approved / pending / rejected                                  |
| approved_at              | 承認日時              | 承認済み植物のみ                                               |
| created_from_request_id  | 申請ID参照            | plant_master_requests.id                                       |
| created_at               | 作成日時              |                                                                |
| updated_at               | 更新日時              |                                                                |

### 3.6 plants の設計判断

plants に固定の水やり係数や固定の水やり間隔は持たせない。

持つ:

- preferred_moisture_level
- watering_amount
- watering_pace
- watering_notes
- avoid_overwatering
- watch_dry_out

主役にしない:

- water_coefficient
- watering_interval_days

水やりスコアや目安日数は、植物特性・個体環境・天気・季節・水やりログをもとにJS側で計算する。

---

## 4. user_plants設計

### 4.1 役割

user_plants は、ユーザーの庭にいる植物個体を管理するテーブル。

plants が共有植物マスタであるのに対し、user_plants は「このユーザーの庭にいる、この植物」を表す。

plants から参照する情報:

- 植物名
- 植物カテゴリ
- 水分嗜好
- 水やり文言
- 過湿注意 / 水切れ注意

user_plants に持つ情報:

- ニックネーム
- 所属する庭
- ゾーン
- 植え方
- 鉢素材
- 土の乾きやすさ
- 生育段階
- 健康状態
- 個体メモ
- タグ

### 4.2 user_plants 想定カラム

| Field           | Description    | Notes / Examples                                            |
| --------------- | -------------- | ----------------------------------------------------------- |
| id              | ユーザー植物ID | 主キー                                                      |
| user_id         | 所有ユーザーID | garden_id から辿れるが、一覧取得・権限・RLSを考えて持たせる |
| garden_id       | 所属する庭ID   | gardens.id                                                  |
| plant_id        | 植物マスタID   | plants.id                                                   |
| zone_id         | ゾーンID       | garden_zones.id。v1で未採用なら zone_label も候補           |
| nickname        | 個体名         | 例: 若君、卿、辺境伯、アルディッシュ                        |
| planting_method | 植え方         | ground / pot                                                |
| pot_material    | 鉢素材         | terracotta / plastic / ceramic / unknown など               |
| soil_profile    | 土の乾きやすさ | well_draining / normal / moisture_retentive / unknown など  |
| growth_stage    | 生育段階       | seedling / growing / flowering / mature / dormant など      |
| health_status   | 健康状態       | healthy / weak / recovering / critical / dead など          |
| memo            | 個体メモ       | 追加フォームでは出さず、詳細・編集で扱う想定                |
| created_at      | 作成日時       | 登録日表示にも使う                                          |
| updated_at      | 更新日時       |                                                             |
| deleted_at      | 論理削除日時   | 削除導線で使用                                              |

### 4.3 水やり計算に効く候補

水やり計算に効くため、カラム化候補として残す。

- pot_material
- soil_profile
- planting_method
- zone_id / zone_label

例:

- 素焼き鉢は乾きやすい
- 乾きやすい土は水やり間隔が短くなりやすい
- 鉢植えは地植えより乾きやすい
- 軒下や室外機近くなど、ゾーン環境で乾き方が変わる

ただし、最終的にどこまでカラム化するかは、水やりスコア算出ロジック設計時に調整する。

### 4.4 location_type について

室内 / 屋外 / 半屋外の違いは、水やり計算に大きく影響する。

候補:

- outdoor
- semi_outdoor
- indoor

ただし、室内対応は計算モデルが別になりやすいため、v1では後続候補として扱う。  
v1初期スコープは、屋外・半屋外の庭や鉢植えを主対象にする。

---

## 5. user_plant_tags設計

### 5.1 役割

user_plant_tags は、user_plants に紐づく自由度の高い補足情報を管理する。

頻繁に計算に使う情報は user_plants のカラムにする。  
自由入力・管理ラベル・補足情報は user_plant_tags に寄せる。

### 5.2 想定カラム

| Field         | Description    | Notes / Examples                                      |
| ------------- | -------------- | ----------------------------------------------------- |
| id            | タグID         | 主キー                                                |
| user_plant_id | ユーザー植物ID | user_plants.id                                        |
| name          | タグ名         | 例: 軒下、療養中、寄せ植え                            |
| tag_type      | タグ種別       | environment / management など。v1ではnullableでもよい |
| created_at    | 作成日時       |                                                       |

### 5.3 タグ例

環境系:

- 軒下
- 半地植え
- 寄せ植え
- 乾きやすい土
- 室外機近く

管理系:

- 療養中
- 要観察
- 挿し木
- 収穫用
- 実験中

---

## 6. watering_logs設計

### 6.1 役割

watering_logs は、水やりした事実を記録するテーブル。

植物マスタや個体情報には水やり履歴を直接保存しない。

水やりログは、ユーザーが気軽に記録できることを優先する。  
開発者都合の分析用入力は増やさない。

### 6.2 想定カラム

| Field         | Description          | Notes / Examples                     |
| ------------- | -------------------- | ------------------------------------ |
| id            | 水やりログID         | 主キー                               |
| user_id       | 実行ユーザーID       | users.id                             |
| user_plant_id | 対象のユーザー植物ID | user_plants.id                       |
| watered_at    | 水やり日時           | 実際に水やりした日時                 |
| amount        | 水量                 | light / moderate / heavy             |
| memo          | 自由記述メモ         | 土の状態、植物の様子、水やり理由など |
| created_at    | 作成日時             |                                      |
| updated_at    | 更新日時             |                                      |

### 6.3 採用しない項目

v1では `moisture_observation` / `soil_condition` のような構造化された土の湿り具合項目は持たない。

理由:

- 入力負荷が上がる
- 開発者都合の分析用入力になりやすい
- niwa.logでは気軽に記録できることを優先する
- 土の状態や植物の様子は memo に自然文で残せる
- 後続の精度分析では、AI集計やmemo解析で対応できる

---

## 7. weather_cache設計

### 7.1 役割

weather_cache は、天気APIの取得結果を保存するキャッシュテーブル。

ユーザー入力ではなく、cron等の定期処理で自動更新する。

画面表示や水やりスコア算出時は、外部APIを直接叩かず、weather_cache を参照する。

### 7.2 想定カラム

| Field                     | Description           | Notes / Examples                                     |
| ------------------------- | --------------------- | ---------------------------------------------------- |
| id                        | 天気キャッシュID      | 主キー                                               |
| region_id                 | 地域ID                | regions.id                                           |
| target_date               | 予報対象日            | その天気が対象とする日付                             |
| fetched_at                | API取得日時           | いつ取得した予報か                                   |
| condition                 | 天気概要              | 晴れ、曇り、雨など                                   |
| temperature               | 気温                  | v1では単一値。後続で最高/最低/平均を分ける可能性あり |
| humidity                  | 湿度                  |                                                      |
| rainfall_mm               | 降水量                | 水やり計算で重要                                     |
| precipitation_probability | 降水確率              |                                                      |
| source                    | API名                 | openweathermap など                                  |
| raw_json                  | APIレスポンス生データ | 後から必要項目を追加するための保険                   |
| created_at                | 作成日時              |                                                      |
| updated_at                | 更新日時              |                                                      |

同一 `region_id / target_date / source` のデータは重複させず、再取得時に更新する。

### 7.3 取得方針

天気情報はcronで1日4回取得する。

取得時刻:

- 05:00
- 11:00
- 17:00
- 23:00

役割:

- 05:00: 朝イチの水やり目安・当日予報用。必須扱い。
- 11:00: 午前〜昼の気温上昇・雨予報変化の補正。
- 17:00: 夕方以降の確認・翌朝に向けた変化確認。
- 23:00: 翌日予報の事前キャッシュ。

特に05:00取得分は、朝の水やり判断に直接使う基準データとして重要。

---

## 8. 水やり判断での役割分担

水やり判断では、各テーブルを以下のように使う。

| Source          | Role                                                       |
| --------------- | ---------------------------------------------------------- |
| plants          | 植物としての性質。乾燥寄りか、水量はどの程度か、過湿注意か |
| user_plants     | その庭の個体条件。鉢素材、土、植え方、ゾーン、健康状態     |
| user_plant_tags | 補足環境・管理ラベル                                       |
| watering_logs   | 前回の水やり日時、実際の記録、メモ                         |
| weather_cache   | 気温、雨、湿度、天気                                       |
| JS計算ロジック  | 上記を統合し、今回の水やりスコアや目安を算出する           |

---

## 9. 後続タスク

このメモでは、DBに保存する情報の役割を整理した。

後続タスクとして、以下を別途設計する。

- 水やりスコア算出ロジック
- preferred_moisture_level の初期値ルール
- 季節補正
- 地域補正
- 天気補正
- 室内植物対応
- 現行MVP DBとの差分レビュー
- レビュー用SQL作成
- migration方針
