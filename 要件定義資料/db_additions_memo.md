# niwa.log DB設計 追加項目メモ

> 2026.06.18 の壁打ちで確定した内容。DB設計メモ v0.2 への反映用。

---

## 1. plants（植物マスタ）への追加カラム

v0.2 からの追加分。既存の id / name / parent_id / water_coefficient / approval_status / submitted_by に加える。

| カラム          | 型              | 内容                     | 備考                                       |
| --------------- | --------------- | ------------------------ | ------------------------------------------ |
| watering_pace   | VARCHAR or TEXT | 基本的な水やりペース     | 「週2〜3回」等の表示用テキスト。係数の根拠 |
| watering_amount | ENUM            | 水やり量目安             | 3段階（light / moderate / heavy）          |
| plant_type      | ENUM            | 一年草/多年草/低木の区分 | annual / perennial / shrub                 |
| reference_url   | TEXT            | 植物詳細リンク           | 大手園芸店・肥料メーカー等への外部リンク   |

### v2以降の候補（v1では植物詳細リンクで代替）

- 施肥タイミング
- 日照条件（日なた/半日陰/日陰）
- 耐暑性/耐寒性
- 食用可否

---

## 2. user_plants（ユーザー個体）への追加カラム

v0.2 からの追加分。既存の id / plant_id / garden_id / zone_id / nickname / memo / created_at に加える。

| カラム          | 型   | 内容             | 備考                                  |
| --------------- | ---- | ---------------- | ------------------------------------- |
| growth_stage    | ENUM | 生育ステータス   | seedling / growing / mature / dormant |
| planting_method | ENUM | 植え方           | ground / pot（水耕栽培はv2以降）      |
| health_status   | ENUM | 元気度ステータス | healthy / wilting / critical / dead   |

### 設計上の注意

- health_status が dead の場合、水やりスコアリングの対象外にする制御が必要
- growth_stage は将来的にスコアリング補正係数として使える余地あり（v1では表示用）
- planting_method も鉢と地植えで乾き方が違うため、スコア補正の候補（v1では表示用）
- 植え付け日は created_at で代用（引き算の方針。必要になったら後から追加）
- 写真機能はv2以降

---

_niwa.log DB設計 追加項目メモ — 2026.06.18_
