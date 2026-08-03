⏺ 全部読み終えました。設計書と照らし合わせながらレビューします。

---

001_create_table.sql コードレビュー

Critical（このままでは実行できない・データが壊れる）

1. regions テーブルにシンタックスエラー（カンマ漏れ）

-- 現状 (line 116-117)
municipality_name text not null -- ← カンマがない
prefecture_name text not null,

このまま実行するとパースエラーで止まります。

---

2. users.id が auth.users(id) を参照している

id uuid primary key references auth.users(id) on delete cascade

Supabase 前提の構成になっています。Docker + PostgreSQL 単体環境では auth
スキーマが存在しないのでマイグレーションがエラーになります。README.md や設計書
は「自前JWT認証」前提で書かれているので、方針を確認する必要があります。

- 自前JWT認証（Node.js側で管理）なら → auth.users 参照を外して id uuid primary
  key default gen_random_uuid() に変更
- Supabaseを使う方向に変えた → 設計書・READMEへの記載が必要

---

3. weather_cache のUNIQUE制約が設計書の意図と逆

unique (region_id, fetched_at, target_at, data_type) -- ← fetched_at
が入っている

設計書（niwa_log_plants_db_clean.md）には「同一 region_id / target_date /
source のデータは重複させず、再取得時に更新する」とあります。ところが
fetched_at（取得日時）をUNIQUEに含めると、取得するたびに別レコードとして追加さ
れてしまいます。設計書の方針に沿うなら：

unique (region_id, target_at, data_type)

---

Major（設計書に記載があるのにSQLにないカラム）

4. plants テーブルの欠落カラム

設計書（niwa_log_plants_db_clean.md /
plants_Db_.md）に記載がある以下が存在しません：

┌─────────────────┬────────────────────────────────────────────────────────┐
│ 欠落カラム │ 内容 │
├─────────────────┼────────────────────────────────────────────────────────┤
│ approval_status │ approved / pending / │
│ │ rejected。申請フロー全体がこれに依存 │
├─────────────────┼────────────────────────────────────────────────────────┤
│ approved_at │ 承認日時 │
└─────────────────┴────────────────────────────────────────────────────────┘

created_from_request_id はあるのに、肝心の approval_status
がないので申請ワークフローが機能しません。

---

5. regions テーブルの欠落カラム

設計書（log_260601.md）では「HeartRails から { name, lat, lng, postal }
を取得、postal を external_id として保存、lat/lng を OWM
に投げる」フローが確定しています。以下が全部ありません：

┌─────────────┬──────────────────────────────────┐
│ 欠落カラム │ 内容 │
├─────────────┼──────────────────────────────────┤
│ lat / lng │ OpenWeatherMap に渡す座標 │
├─────────────┼──────────────────────────────────┤
│ external_id │ HeartRails の postal（郵便番号） │
├─────────────┼──────────────────────────────────┤
│ created_at │ 他テーブルとの一貫性でも必要 │
└─────────────┴──────────────────────────────────┘

---

6. watering_logs テーブルの欠落カラム

設計書（niwa_log_plants_db_clean.md）の想定カラムと比較：

┌────────────┬─────────────────────────────────────────┐
│ 欠落カラム │ 内容 │
├────────────┼─────────────────────────────────────────┤
│ user_id │ 誰が水やりしたか（RLS・権限管理に必要） │
├────────────┼─────────────────────────────────────────┤
│ amount │ 水量（light / moderate / heavy） │
├────────────┼─────────────────────────────────────────┤
│ memo │ 土の状態・植物の様子の自由記述 │
├────────────┼─────────────────────────────────────────┤
│ updated_at │ 更新日時 │
└────────────┴─────────────────────────────────────────┘

---

7. weather_cache テーブルの欠落カラム

┌───────────────────────┬─────────────────────────────────────────────────┐
│ 欠落カラム │ 内容 │
├───────────────────────┼─────────────────────────────────────────────────┤
│ precipitation_probabi │ 降水確率（スコア算出に使用予定） │
│ lity │ │
├───────────────────────┼─────────────────────────────────────────────────┤
│ source │ API名（openweathermap │
│ │ 等）、UNIQUE制約の構成要素にもなる │
├───────────────────────┼─────────────────────────────────────────────────┤
│ raw_json │ 後から必要項目を追加するための保険として設計書 │
│ │ に明記あり │
└───────────────────────┴─────────────────────────────────────────────────┘

---

8. user_plants に FK 制約がない

user_id uuid not null, -- references users(id) がない
garden_id uuid not null, -- references gardens(id) がない

plant_id には references plants(id) があるのに、user_id と garden_id
にはない状態です。

---

Minor（整合性・品質の問題）

9. timestamp / timestamptz の不統一

CLAUDE.mdに「タイムゾーンはJST基準」とあります。以下が
timestamp（タイムゾーンなし）になっています：

watered_at timestamp not null -- watering_logs
observed_at timestamp not null -- observation_logs
deleted_at timestamp -- user_plants（他テーブルは
timestamptz）

timestamptz に統一すべきです。

---

10. avoid_overwatering と watch_dry_out の型の不一致

avoid_overwatering boolean not null default false,
watch_dry_out text not null default 'false' check (
watch_dry_out in ('true', 'false', 'conditional')
)

conditional という3値が必要なので text にしている意図はわかりますが、同じ「注
意フラグ」系なのに型が違うのは混乱のもとです。設計書でも true / false /
conditional と明記されているので、コメントか型名（watch_dry_out_level
等）で意図を明示すると良いです。

---

11. gardens テーブルに created_at / updated_at がない

他の全テーブルには付いているのに gardens だけありません（deleted_at
だけある状態）。

---

12. user_plant_tags に tag_type がない・重複制約がない

設計書（niwa_log_plants_db_clean.md）には tag_type カラム（environment /
management 等）が記載されています。またタグの重複を防ぐ unique (user_plant_id,
name) 制約もあった方が良いです。

---

13. observation_logs テーブルについて

設計書には存在しないテーブルです。v0.2
レビューメモには「観察記録を時系列で積む仕様にするなら plant_notes
が必要、v1では user_plants.memo
で十分」と書かれています。意図的に追加したなら設計書への反映が必要です。

---

14.  watch_dry_out のインデントが2スペース余分（line 24）

    avoid_overwatering boolean not null default false,

      watch_dry_out text not null default 'false' check (  -- ←

4スペース（他は2スペース）

---

まとめ

┌──────────┬──────┬────────────────────────────────────────────────────────┐
│ 優先度 │ 件数 │ 主な内容 │
├──────────┼──────┼────────────────────────────────────────────────────────┤
│ Critical │ 3 │ regionsカンマ漏れ、auth.users参照、weather_cache │
│ │ │ UNIQUE設計ミス │
├──────────┼──────┼────────────────────────────────────────────────────────┤
│ Major │ 5 │ plants/regions/watering_logs/weather_cache │
│ │ │ の欠落カラム、user_plants の FK 欠落 │
├──────────┼──────┼────────────────────────────────────────────────────────┤
│ │ │ timestamptz 不統一、型不一致、gardens │
│ Minor │ 6 │ タイムスタンプなし、タグ設計、observation_logs │
│ │ │ の扱い、インデント │
└──────────┴──────┴────────────────────────────────────────────────────────┘

特に Critical の3点 と approval_status
の欠落（申請フロー全体に関わる）は早めに直したほうが良いです。修正SQL作ろうか
、それとも設計の確認を先にしたいところがある感じ？
