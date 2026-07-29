# DB理解用ミニチュートリアル

## 目的

このメモは、niwa.log MVP本体のDBをいきなり読む前に、DBの基本構造を小さく理解するための練習用メモ。

MVP本体には、users、gardens、plants、user_plants、watering_logs、weather_cache など複数のテーブルがある。いきなり全部見ると情報量が多いので、まずは niwa.log の中心に近い3テーブルだけで考える。

対象にするのは以下。

```text
plants
user_plants
watering_logs
```

この3つで、「植物マスタ」「自分の庭の植物」「水やり記録」の関係を掴む。

## ざっくりイメージ

```text
plants
→ 植物そのもののマスタ
例：ローズマリー、ラベンダー、ミニトマト

user_plants
→ 自分の庭にいる植物個体
例：辺境伯、若君、ミニトマト1号

watering_logs
→ user_plants に対する水やり記録
例：辺境伯に今日水やりした
```

重要なのは、ローズマリーという植物そのものと、自分の庭にいる「辺境伯」は別の情報だということ。

ローズマリーは植物マスタ。  
辺境伯は、自分の庭にいるローズマリー個体。  
水やりログは、辺境伯に対して残す記録。

## フォルダ構成例

ポートフォリオ用プロジェクトの中に、練習用フォルダを作る想定。

```text
portfolio/
  docs/
  db-practice/
    001_create_tables.sql
    002_insert_sample_data.sql
    README.md
```

`001_create_tables.sql` はテーブルを作る設計図。  
`002_insert_sample_data.sql` は練習用の初期データ。  
`README.md` は自分用メモ。

## 001_create_tables.sql

まずは最小構成で3テーブルだけ作る。

```sql
create table plants (
  id serial primary key,
  name text not null
);

create table user_plants (
  id serial primary key,
  plant_id integer not null references plants(id),
  nickname text
);

create table watering_logs (
  id serial primary key,
  user_plant_id integer not null references user_plants(id),
  watered_at timestamp not null,
  memo text
);
```

## 各テーブルの意味

### plants

```sql
create table plants (
  id serial primary key,
  name text not null
);
```

`plants` は植物マスタ。

ここには、植物そのものの名前を入れる。

例：

```text
ローズマリー
ラベンダー
ミニトマト
```

ここには、ニックネームや水やり履歴は入れない。  
「植物そのもの」の情報だけを入れる。

### user_plants

```sql
create table user_plants (
  id serial primary key,
  plant_id integer not null references plants(id),
  nickname text
);
```

`user_plants` は、自分の庭にいる植物個体。

`plant_id` で `plants.id` を参照する。

たとえば、`plants` にある「ローズマリー」を選んで、自分の庭に「辺境伯」として登録する。

```text
plants
id: 1
name: ローズマリー

user_plants
id: 1
plant_id: 1
nickname: 辺境伯
```

この状態は、「辺境伯はローズマリーの個体」という意味になる。

### watering_logs

```sql
create table watering_logs (
  id serial primary key,
  user_plant_id integer not null references user_plants(id),
  watered_at timestamp not null,
  memo text
);
```

`watering_logs` は水やり記録。

`user_plant_id` で `user_plants.id` を参照する。

つまり、「ローズマリーに水やりした」ではなく、「自分の庭にいる辺境伯に水やりした」という記録になる。

```text
watering_logs
id: 1
user_plant_id: 1
watered_at: 今日
memo: 鉢土乾き気味、水やり
```

## 002_insert_sample_data.sql

次に、練習用データを入れる。

```sql
insert into plants (name)
values
  ('ローズマリー'),
  ('ラベンダー'),
  ('ミニトマト');

insert into user_plants (plant_id, nickname)
values
  (1, '辺境伯'),
  (2, '若君'),
  (3, 'ミニトマト1号');

insert into watering_logs (user_plant_id, watered_at, memo)
values
  (1, now(), '鉢土乾き気味、水やり'),
  (2, now(), '表土確認のみ'),
  (3, now(), 'しっかり水やり');
```

## データのつながり

このデータを入れると、関係はこうなる。

```text
plants
1 ローズマリー
2 ラベンダー
3 ミニトマト

user_plants
1 plant_id=1 辺境伯
2 plant_id=2 若君
3 plant_id=3 ミニトマト1号

watering_logs
1 user_plant_id=1 鉢土乾き気味、水やり
2 user_plant_id=2 表土確認のみ
3 user_plant_id=3 しっかり水やり
```

つまり、

```text
辺境伯
→ user_plants.id = 1
→ plant_id = 1
→ plants.id = 1
→ ローズマリー

辺境伯への水やり
→ watering_logs.user_plant_id = 1
→ user_plants.id = 1
→ 辺境伯
```

というつながり。

## よく見るSQL

テーブル一覧を見る。

```sql
\dt
```

植物マスタを見る。

```sql
select * from plants;
```

自分の庭の植物を見る。

```sql
select * from user_plants;
```

水やりログを見る。

```sql
select * from watering_logs;
```

## JOINでつなげて見る

DBでは、別々のテーブルに分けた情報を `JOIN` でつなげて見る。

たとえば、「ニックネーム」と「植物名」を一緒に見る。

```sql
select
  user_plants.nickname,
  plants.name as plant_name
from user_plants
join plants
  on user_plants.plant_id = plants.id;
```

結果イメージ。

```text
nickname      plant_name
辺境伯         ローズマリー
若君           ラベンダー
ミニトマト1号   ミニトマト
```

水やりログまでつなげるならこう。

```sql
select
  user_plants.nickname,
  plants.name as plant_name,
  watering_logs.watered_at,
  watering_logs.memo
from watering_logs
join user_plants
  on watering_logs.user_plant_id = user_plants.id
join plants
  on user_plants.plant_id = plants.id
order by watering_logs.watered_at desc;
```

結果イメージ。

```text
nickname      plant_name     watered_at     memo
辺境伯         ローズマリー     今日           鉢土乾き気味、水やり
若君           ラベンダー       今日           表土確認のみ
ミニトマト1号   ミニトマト       今日           しっかり水やり
```

## MVP本体との対応

このミニDBは、MVP本体の超簡略版。

MVP本体では、ここにいろいろ増えている。

```text
users
→ ログインユーザー

gardens
→ 庭

garden_zones
→ 庭の中の置き場所

plants
→ 植物マスタ

user_plants
→ 自分の庭にいる植物個体

watering_logs
→ 水やり記録

weather_cache
→ 天気情報

plant_master_requests
→ 植物マスタ追加申請
```

でも中心の考え方は同じ。

```text
plants
→ 植物そのもの

user_plants
→ 自分の庭にいるその植物

watering_logs
→ その個体への水やり記録
```

## 理解のポイント

DBは、1個の巨大なJSONではなく、役割ごとに分けた複数の表。

```js
const plant = {
  name: "ローズマリー",
  nickname: "辺境伯",
  wateringLogs: [...]
}
```

みたいに1個に詰めるのではなく、

```text
plants
→ ローズマリー

user_plants
→ 辺境伯

watering_logs
→ 辺境伯への水やり記録
```

として分ける。

分けたうえで、`id` と `plant_id`、`user_plant_id` でつなぐ。

## ばぶ理解

```text
plants
→ 植物図鑑

user_plants
→ うちの子名簿

watering_logs
→ お世話日記
```

ローズマリーは植物図鑑にいる。  
辺境伯はうちの子名簿にいる。  
水やりログは辺境伯のお世話日記に残る。

## 注意

MVP本体のDBを直接いじると、動いているアプリのデータが変わる。

理解用に好き勝手試すなら、MVP本体ではなく、別フォルダの練習用DBでやるほうが安全。

特に以下はMVP本体で意味がわからないまま実行しない。

```bash
docker compose down -v
```

`-v` は Docker volume も削除する指定。  
PostgreSQLの保存領域ごと消えるので、DBが初期化される。
