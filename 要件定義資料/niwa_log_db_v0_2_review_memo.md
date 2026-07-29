# niwa.log DB設計 v0.2 確認メモ

作成日：2026-07-02  
対象：niwa.log DB設計 v0.2  
目的：主要スマホワイヤーから逆算して、DB設計の漏れ・責務分離・v1範囲を確認する

---

## 1. 前提

niwa.log は、植物の水やり判断・水やりログを中心にしたWebアプリ。

v1では「1ユーザー1庭」想定。  
主要スマホワイヤーは一通り作成済み。

対象画面は以下。

- TOP
- Login
- registration_01
- registration_02
- Dashboard
- Plant_detail
- Garden_detail
- Plant_master_request

今回の確認対象は UI/UX ではなく、ワイヤーから逆算したDB設計。

---

## 2. 今回確認したこと

今回確認した主な観点は以下。

- DB設計 v0.2に、現在のワイヤーで必要になった項目が足りているか
- gardens に庭環境プロフィール項目を追加するべきか
- plants / user_plants / plant_master_requests の責務分離はどうするべきか
- watering_logs と weather_cache の棲み分けが妥当か
- v1で必要な範囲と、後回しでよい範囲の切り分け

---

## 3. DB設計の基本方針

DBは「全部を1つの大きな表に入れる」のではなく、役割ごとに箱を分ける。

niwa.log では、特に以下の分離が重要。

- 植物図鑑としての情報
- ユーザーの庭にいる植物個体の情報
- 水やりした行動ログ
- 天気API由来の天気情報
- 植物マスタへの追加申請

この分離を守ることで、同じ情報を何度も書かずに済み、後から修正しやすくなる。

---

## 4. テーブルごとの役割

### users

アプリを使うユーザーの情報を持つ。

v1では1ユーザー1庭想定だが、ユーザーと庭は分けておく。

---

### gardens

ユーザーの庭そのものの情報を持つ。

v1では最低限、以下が必要。

- 庭の名前
- 地域
- メモ

庭環境プロフィールは、v1では細かく作り込みすぎなくてよい。  
ただし、水やり判断に将来的に効くため、受け皿を持たせるのはあり。

候補項目。

- sunlight_profile
- exposure_profile
- watering_note
- memo

ただし、登録時に必須にする必要はない。  
v1では nullable、または memo に寄せてもよい。

---

### regions

天気取得に使う地域情報を持つ。

Dashboard で地域名や天気情報を出すため、gardens と紐づく。

想定される役割。

- 地域名
- 天気API用の location key
- 必要なら緯度経度

---

### plants

植物マスタ。  
アプリ全体で共有される「植物図鑑」。

ここには「ラベンダーとは何か」「バジルとは何か」のような、植物種・品種としての基本情報を置く。

入れる情報の例。

- 植物名
- 親カテゴリ
- 水やり係数
- watering_pace
- watering_amount
- plant_type
- reference_url
- approval_status

ここには、ユーザー個別のニックネームやメモは入れない。

---

### user_plants

ユーザーの庭にいる植物個体の情報。

plants が「植物図鑑」なら、user_plants は「君の庭の住民票」。

例。

- ニックネーム：若君
- 元の植物：ラベンダー
- 場所：軒下ゾーン
- 状態：元気
- メモ：切り戻し後に再分岐が速い

想定項目。

- garden_id
- plant_id
- nickname
- zone
- memo
- tag
- growth_stage
- planting_method
- health_status

health_status は重要。  
枯れた植物を「削除」ではなく「記録として残す」ために使える。  
たとえば health_status = dead の植物は水やりスコア対象外にできる。

---

### garden_zones

庭の中の場所・区画を持つ。

ワイヤーにゾーン表示があるなら、v1でも必要。

例。

- 軒下
- 花壇
- プランター棚
- 室外機横
- 地植えエリア

user_plants に文字列で直接書くこともできるが、後で整理しにくくなるため、別テーブルにしたほうがよい。

今回、追加で明示したほうがよいタスクとして確認済み。

---

### user_plant_tags

ユーザーの植物個体につけるタグを持つ。

例。

- 乾燥注意
- 挿し木
- 収穫用
- 観賞用
- 実験中
- 弱ってる

ワイヤーにタグ表示を残すなら、DBにもタグ用の箱が必要。  
タグ機能をv1で後回しにするなら、ワイヤー側でもv1では非表示にするほうが整合する。

今回、追加で明示したほうがよいタスクとして確認済み。

---

### watering_logs

水やりした行動ログ。

ここには「人間が実際に水をあげた事実」を記録する。

例。

- どの植物に
- いつ
- どれくらい
- メモ

天気情報は入れない。  
雨が降った事実も、v1では watering_logs に入れない。

watering_logs はあくまで「水やり行動」の記録。

---

### weather_cache

外部天気APIから取った天気情報のキャッシュ。

ここには、水やり判断に使う外部環境情報を保存する。

例。

- 地域
- 対象日
- 取得日時
- 天気
- 最高気温
- 最低気温
- 降水確率
- 降水量
- 湿度
- API source
- raw_json

watering_logs との違いは明確。

- weather_cache = 天気情報
- watering_logs = 水やりした行動

この2つを混ぜない。

---

### plant_master_requests

植物マスタに存在しない植物を追加してほしい時の申請箱。

plants は「確定済みの植物図鑑」。  
plant_master_requests は「追加申請中の候補」。

たとえば、アプリの植物マスタに「クリーピングレモンタイム」がない場合、ユーザーは Plant_master_request 画面から追加申請する。

ここで受け取る情報の例。

- requested_name
- parent_id または parent_name_text
- water_coefficient 候補
- watering_pace 候補
- watering_amount 候補
- plant_type 候補
- reference_url
- note
- status
- submitted_by
- approved_plant_id

誤字・重複・未確認情報が混ざる可能性があるため、申請内容をいきなり plants に入れない。

今回、追加で明示したほうがよいタスクとして確認済み。

---

## 5. 特に重要な責務分離

### plants と user_plants

plants は植物図鑑。  
user_plants はユーザーの庭にいる植物個体。

例。

plants に入るもの。

- ラベンダー
- 乾燥気味が好き
- 水やり頻度は少なめ

user_plants に入るもの。

- 若君
- 元の植物はラベンダー
- 軒下にいる
- 状態は元気
- 個別メモあり

同じラベンダーでも、若君・卿・挿し木1号は別の user_plants になる。

---

### plants と plant_master_requests

plants は確定済みの植物マスタ。  
plant_master_requests は植物追加の申請箱。

未承認の情報を plants に直接混ぜない。  
承認後に plants へ正式登録する。

---

### watering_logs と weather_cache

watering_logs は人間の水やり行動。  
weather_cache は天気API由来の外部判断材料。

例。

天気予報「今日は雨」  
→ weather_cache

ユーザー「軒下のラベンダーに水をあげた」  
→ watering_logs

雨そのものを v1 で watering_logs に入れる必要はない。

---

## 6. v1で必要な範囲

v1で必要と判断したテーブル。

- users
- regions
- gardens
- plants
- user_plants
- watering_logs
- weather_cache
- plant_master_requests

ワイヤーのゾーン表示を使うなら必要。

- garden_zones

ワイヤーのタグ表示を使うなら必要。

- user_plant_tags

---

## 7. v1では後回しでよい範囲

以下は v1 では後回しでよい。

- plant_photos
- fertilizing_logs
- disease_logs / pest_logs
- notifications
- reminders
- multi_garden support
- admin moderation UI
- FAQ DB
- terms DB
- contact_messages DB
- 履歴型の plant_notes

ただし、Plant_detail のメモを「現在の個体メモ」として扱うなら user_plants.memo で足りる。  
「観察記録を時系列で積む」仕様にするなら plant_notes が必要になる。

v1では user_plants.memo で十分。

---

## 8. 水やりスコアについて

水やりスコアを保存する専用テーブルは、v1では不要。

Dashboard 表示時に以下を組み合わせて計算すればよい。

- user_plants
- plants
- latest watering_logs
- weather_cache

スコアをDBに保存すると、以下の問題が増える。

- いつ計算したスコアか
- 天気キャッシュ更新後に再計算するか
- 古いスコアをどう扱うか

そのため、v1では「保存せず計算値」とする。

---

## 9. 現時点の確認結果

現時点では、DB設計 v0.2の確認粒度としては問題なし。

今やるべき確認は、DBの細部を完成させることではなく、以下の確認。

- ワイヤーに出てくる画面要素を保存する箱があるか
- 植物マスタ・ユーザーの植物・水やりログ・天気情報が混ざっていないか
- 後続タスクに落とせているか

この基準では、現在の設計確認はOK。

---

## 10. このあとDB設計として詰めるタスク

すでにタスク化されているもの。

- regions設計
- users設計
- gardens設計
- plants設計
- 親子カテゴリ
- 水やり係数
- watering_pace
- watering_amount
- plant_type
- reference_url
- approval_status
- user_plants設計
- ニックネーム
- ゾーン
- メモ
- タグ
- growth_stage
- planting_method
- health_status
- watering_logs設計
- weather_cache設計
- マイグレーションSQL作成
- 初期データ・seed作成

追加で明示したほうがよいタスク。

- plant_master_requests設計
- garden_zones設計
- user_plant_tags設計

---

## 11. 今はまだ詰めなくてよいもの

以下は、後続の詳細設計やSQL作成時に詰めればよい。

- カラムの型
- NOT NULL 制約
- 外部キー
- index
- enum の具体値
- seed の具体データ
- SQL文

---

## 12. 初心者向けの判断基準

DB設計で迷ったときは、以下の5分類で考える。

- 図鑑に書くことなのか？
- 君の庭の個体に書くことなのか？
- 水やり行動なのか？
- 天気情報なのか？
- 申請中の情報なのか？

この分類に沿ってテーブルを分ける。

---

## 13. 今回の結論

現時点の確認としてはOK。  
このレベルで次のDB詳細設計タスクへ進んでよい。

追加でタスクに入れるなら以下。

- plant_master_requests設計
- garden_zones設計
- user_plant_tags設計

特に重要な決定は以下。

- 植物図鑑と、ユーザーの庭の植物は別テーブルにする
- 水やり記録と、天気情報は別テーブルにする
- 図鑑にない植物の投稿は、いきなり plants に入れず plant_master_requests に入れる
- gardens には庭環境プロフィールの受け皿を持たせてもよいが、v1では軽めでよい
- ゾーンとタグは、ワイヤーに出すならDB側にも箱が必要
- 水やりスコアは v1 では保存せず、表示時に計算する

