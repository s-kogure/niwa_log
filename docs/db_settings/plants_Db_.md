# \# 植物マスタ情報の設計

## \#\# plants 初期データ方針

- \- 初期データあり
- \- 大分類ごとに20件前後を目安に作成
- \- 想定分類：ハーブ / 観葉植物 / 野菜 / 多肉植物 / 必要に応じて草花・樹木・その他
- \- データ収集ルールは後続で決定
- \- 初期データ作成はエージェント利用想定
- \- ユーザー申請による追加にも対応する

\> ※申請中は plants に入れず、plant\_master\_requests に置く。  
plant\_master\_requestsテーブルも別途に作る。v1では plant\_master\_requests は削除しない。承認後は status=approved にして、approved\_plant\_id で plants と紐づける。plants 側にも approved\_at / created\_from\_request\_id を持たせる。通常利用では plants だけを見る。plant\_master\_requests は申請履歴・管理確認用として残す。

## \#\# 基本構造

- \- 植物名
- \- plant\_type（大分類）
- \- 親カテゴリ / 親植物
- \- 水やり係数
- \- 水やりペース
- \- 水やり量
- \- reference\_url
- \- approval\_status

## \#\# plant\_type内の分類

plant\_typeは、ざっくりとした植物の分類（園芸用土を基準にした目安）。

- \- herb \= ハーブ
- \- foliage \= 観葉植物
- \- vegetable \= 野菜
- \- succulent \= 多肉植物
- \- flower \= 草花
- \- tree \= 樹木
- \- other \= その他

## \#\# plants テーブル定義

| | Field | | Description | | Notes/Examples | |
| :---- | :---- | :---- |
| |---| | \---| | \---| |
| | id | | 植物マスタID | | \- | |
| | parent\_id | | 親カテゴリID | | 例: ラベンダー \> イングリッシュラベンダー | |
| | name | | 植物名 | | 例: ローズマリー、ミニトマト | |
| | plant\_category | | 植物カテゴリ | | herb, vegetable, flower, succulent, foliage, tree, other | |
| | preferred\_moisture\_level | | 好む土壌水分傾向 | | 0.00(乾燥)〜1.00(湿潤)。ラベンダー: 0.25 | |
| | watering\_amount | | 1回あたりの水量目安 | | light / moderate / heavy | |
| | watering\_pace | | 短い水やり文言 | | 例: 土がしっかり乾いてから。 | |
| | watering\_notes | | 条件つきメモ | | 例: 定着後は乾燥気味に管理。 | |
| | avoid\_overwatering | | 過湿注意フラグ | | true / false | |
| | watch\_dry\_out | | 水切れ注意フラグ | | true / false / conditional | |
| | reference\_url | | 育て方参考URL | | \- | |
| | evidence\_confidence | | 調査根拠の信頼度 | | high / medium / low | |
| | approval\_status | | 承認状態 | | approved / pending / rejected | |
| | approved\_at | | 承認日時 | | \- | |
| | created\_from\_request\_id | | 申請ID参照 | | plant\_master\_requests のID | |
| | created\_at / updated\_at | | 作成・更新日時 | | \- | |

## \#\# plantsで持つ・持たないデータ

\#\#\# 持つ項目  
\- preferred\_moisture\_level  
\- avoid\_overwatering  
\- watch\_dry\_out  
\- watering\_amount  
\- watering\_pace  
\- watering\_notes  
\#\#\# いったん主役にしない項目  
\- water\_coefficient  
\- watering\_interval\_days

## \#\# user\_plants情報

ユーザーの庭にいる植物個体。plantsを参照しつつ、そのユーザー・その庭での個別条件を持つ。  
plantsを参照しつつ、そのユーザー・その庭での個別条件を持つ。  
\#\#\# 基本構成  
\- \*\*id\*\*: ユーザー植物ID  
\- \*\*user\_id\*\*: 所有ユーザーID（一覧取得・権限・RLS用）  
→ 所有ユーザーID  
※ garden\_id から辿れるが、一覧取得・権限・RLSを考えると持たせる価値あり。  
\- \*\*garden\_id\*\*: 所属する庭ID  
→ 所属する庭ID  
\- \*\*plant\_id\*\*: plants.id への参照（例: この個体はイングリッシュラベンダー）  
→ plants.id  
例: この個体はイングリッシュラベンダー  
\- \*\*zone\_id\*\*: garden\_zones.id への参照（例: 西側、軒下、花壇など）  
→ garden\_zones.id  
例: 西側、軒下、花壇など  
※ v1で garden\_zones を使わないなら zone\_label でも可。  
\- \*\*nickname\*\*: 個体名（例: アルディッシュ）  
→ 個体名。  
例: 若君、卿、辺境伯、アルディッシュ  
\- \*\*planting\_method\*\*: 植え方（ground / pot）  
→ 植え方。  
例: ground / pot  
画面上では 直植え / 鉢植え  
\- \*\*pot\_material\*\*: 鉢素材（terracotta, plastic, ceramic, unknown）  
→ 鉢素材。必要なら追加候補。  
例: terracotta, plastic, ceramic, unknown  
素焼き鉢の乾きやすさを計算に使うならかなり有用。  
\- \*\*soil\_profile\*\*: 土の乾きやすさ（well\_draining, normal, moisture\_retentive, unknown）  
→ 土の乾きやすさ。必要なら追加候補。  
例: well\_draining, normal, moisture\_retentive, unknown  
サボテン土・多肉土・乾きやすい土などを扱うなら欲しい。  
\- \*\*growth\_stage\*\*: 生育段階（seedling, growing, flowering, mature, dormant）  
→ 生育段階。  
例: seedling, growing, flowering, mature, dormant  
\- \*\*health\_status\*\*: 健康状態（healthy, weak, recovering, critical, dead）  
→ 健康状態。  
例: healthy, weak, recovering, critical, dead  
\- \*\*memo\*\*: 個体メモ  
→ 個体メモ。  
追加フォームでは出さず、詳細/編集で扱う想定。  
\- \*\*created\_at / updated\_at / deleted\_at\*\*: 作成・更新・論理削除  
→ 登録日表示にも使う  
updated\_at  
deleted\_at  
→ 論理削除  
\#\#\# 補足情報の管理方針  
pot\_material  
→ 素焼き鉢なら乾きやすい  
soil\_profile  
→ 乾きやすい土なら水やり間隔が短くなる  
zone\_id / zone\_label  
→ 軒下、日向、室外機近く、西側などの環境差  
planting\_method  
→ 鉢植え / 地植え  
頻繁に計算に使うものはカラムとして保持し、自由度の高いものは \`user\_plant\_tags\` で管理する。  
\#\#\#\# user\_plant\_tags  
\- user\_plant\_id / name / tag\_type  
name  
tag\_type  
\- タグ例: 素焼き鉢, 乾きやすい土, 軒下, 半地植え, 寄せ植え, 療養中, 要観察  
乾きやすい土  
軒下  
半地植え  
寄せ植え  
療養中  
要観察

## \#\# 水やり判断での役割分担

\- \*\*plants\*\*: 植物としての性質（乾燥寄りか、水量はどの程度かなど）  
\- \*\*user\_plants\*\*: 庭の個体条件（鉢の種類、土の質、日当たり環境など）  
\- \*\*watering\_logs\*\*: 水やりの履歴（前回のタイミング、実際の乾き具合など）  
\- \*\*weather\_cache\*\*: 気象状況（気温、雨、湿度、天気）  
\- \*\*JS計算ロジック\*\*: 上記情報を統合し、今回の水やりスコアや目安を算出する  
\#\#\# 結論  
\- \`plants\` には「植物としての共通の性質」を定義する。  
\- \`user\_plants\` には「特定の庭の特定の個体条件」を定義する。  
\- 係数や間隔は固定値としてDBに持たず、実行時に動的に計算する。

### user_plants情報

user_plants設計:  
※水やり係数にかかわる項目は太字

- ニックネーム
- ゾーン
- メモ
- タグ
- growth_stage
- planting_method
- health_status
- **pot_material**
- **soil_profile**
- location_type ※後続候補、室内対応は今は保留

基本責務は確定。  
v1最低限の項目も確定。  
水やり計算に使う環境系カラムは後続の計算ロジック設計で最終判断。

### watering_logs設計:

- user_plant_id
- watered_at
- amount
- memo
- created_at
- updated_at

水やりログは、ユーザーが気軽に記録できることを優先する。  
開発者都合の分析用入力は増やさない。  
土の状態・植物の様子・水やり理由などは memo に自由記述で残す。  
構造化された moisture_observation は v1 では持たない。

### weather_cache設計:

- region_id
- target_date
- fetched_at
- condition
- temperature
- humidity
- rainfall_mm
- precipitation_probability
- source
- raw_json

weather_cache は天気APIの取得結果を保存するキャッシュテーブル。  
ユーザー入力ではなく、cron等の定期処理で自動更新する。

v1では1日4回程度の取得を想定する。  
画面表示や水やりスコア算出時は、外部APIを直接叩かず weather_cache を参照する。

同一 region_id / target_date / source のデータは重複させず、再取得時に更新する。  
raw_json は後から必要項目を追加したくなった場合の保険として保持する。

例）

05:00 → 朝イチの水やり目安・当日予報用。必須扱い。

11:00 → 午前〜昼の気温上昇・雨予報変化の補正。

17:00 → 夕方以降の確認・翌朝に向けた変化確認。

23:00 → 翌日予報の事前キャッシュ。

### その他

水やりスコア算出ロジックは、DB設計の一部というより、後続のアプリの心臓部として別タスクに切る

### plant_master_requestsの補足

履歴テーブルではなく、未処理申請のみを保持する作業キューとする。

- 行の存在自体が pending を表す
- 承認時は plants へ登録後、申請行を削除する
- 却下時は申請行を削除する
- status / updated_at は持たない
- サーバー側処理でも status を前提にしない
