# succulent 調査ログ

調査ルール・記入形式は `_template.md` を参照。

アンカー: サボテン 0.10 / エケベリア 0.15（`anchor_plants.md` 参照）

初期 seed 対象: 親 9件（子分類は作成しない方針）
※ 人間レビュー対応（2026-08-21）で金のなる木をADD（8→9件）。縁起物として家庭保有率が
　非常に高い定番多肉種であり、既存succulentのラインナップから抜けていたため追加。
　件数目安（5〜10件）は必達条件ではない。

---

## サボテン
※ `anchor_plants.md` と兼用（band 1 の中核アンカー）

anchor_plants.md 参照。010_seed_plants.sql には Session 0 で登録済み。

---

## エケベリア
※ `anchor_plants.md` と兼用（band 1 上端アンカー）

anchor_plants.md 参照。010_seed_plants.sql には Session 0 で登録済み。

---

## ハオルチア

| フィールド | 値 |
|---|---|
| name | ハオルチア |
| plant_category | succulent |
| growth_form | other |
| parent_id | null |
| aliases | ハウォルチア |
| preferred_moisture_level | **0.18** |
| moisture_band | 1 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 春秋: 土の表面が乾いたらたっぷり／夏: 10日に1回夕方軽く／冬: 2〜4週に1回 |
| watering_notes | 春秋型多肉。他の多肉と異なり直射日光を嫌う（1年を通して明るい日陰）。夏は蒸れ・根腐れ防止で控えめに。冬も休眠期のため控えめ。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-10556/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-10556/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5692/ （KINCHO園芸 植物栽培ナビ）

### 採用理由
2ソース共に「春秋は表面が乾いたらたっぷり」「夏は蒸れ・根腐れ防止で控えめ」「冬は2〜4週に1回」で一致。エケベリアとほぼ同じ管理サイクルだが、光要求は明確に異なる（強い光を必要としない）。

### moisture_level 数値化理由
生育期の水やり頻度・冬期断水管理はエケベリア（0.15）とほぼ同等。ただし夏の管理はエケベリアと同じ「10日に1回」で、サボテン（0.10）ほど断水寄りではない。年間通算で 0.18 を採用。

---

## セダム

| フィールド | 値 |
|---|---|
| name | セダム |
| plant_category | succulent |
| growth_form | other |
| parent_id | null |
| aliases | マンネングサ |
| preferred_moisture_level | **0.17** |
| moisture_band | 1 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 春秋: 2〜3日に1回たっぷり／梅雨〜夏: 雨避け＋回数減／冬: 月1〜4回霧吹き程度 |
| watering_notes | 過湿に非常に弱い。梅雨期は特に雨避け必須（特に洋種）。品種によりグラウンドカバーとしても利用可。多肉用の水はけの良い土が必須。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9176/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9176/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5688/ （KINCHO園芸 植物栽培ナビ）

### 採用理由
2ソース共に「過湿に弱い」「梅雨・夏は雨避け」「春秋は2〜3日に1回」「冬は霧吹き程度」で一致。エケベリアより「雨に当てない」志向が強く、生育期の水やり間隔もやや長い。

### moisture_level 数値化理由
エケベリア（0.15）に近いが、生育期の水やり間隔（2〜3日1回 vs 「乾いたらすぐ」）はセダムの方が乾燥寄り。一方で冬の断水はエケベリアより緩い（霧吹きで補水）。相殺して 0.17 を採用。

---

## カランコエ

| フィールド | 値 |
|---|---|
| name | カランコエ |
| plant_category | succulent |
| growth_form | other |
| parent_id | null |
| aliases | ベニベンケイ |
| preferred_moisture_level | **0.22** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 5〜9月: 土が乾いたら／冬: 表面が乾いてから2〜3日待って／10℃以下は4〜5日後 |
| watering_notes | 多肉だが根が細く過湿による根腐れが起きやすい。花もの多肉のため生育期の水管理は他多肉より若干多め。短日植物で開花には日照時間管理が必要。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9110/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9110/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4865/ （KINCHO園芸 植物栽培ナビ）

### 採用理由
2ソース共に「生育期は乾いたら水やり」「冬は乾いてから2〜3日待つ」「根が細く根腐れしやすい」で一致。他の多肉と異なり「乾いてから待つ」の待ち時間が短めで、生育期は「乾いたらすぐ」寄り。

### moisture_level 数値化理由
生育期に「乾いたら水やり」（他多肉のように「乾いてから何日後」ではない）ため、エケベリア（0.15）より湿潤寄り。ただし多肉分類なので band 2 下端の 0.22 を採用。ラベンダー（0.20）と近い水準。

---

## アロエ

| フィールド | 値 |
|---|---|
| name | アロエ |
| plant_category | succulent |
| growth_form | other |
| parent_id | null |
| aliases | キダチアロエ, アロエベラ |
| preferred_moisture_level | **0.13** |
| moisture_band | 1 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 表面が乾いてから2〜3日後／冬は月2回程度／通常は月1回目安 |
| watering_notes | 葉に大量の水分を蓄えるため乾燥に極めて強い。水のやり過ぎが最大のリスク。日光を好むが半日陰でも育つ。耐寒性は品種による（キダチアロエは屋外越冬可、アロエベラは霜に弱い）。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-7775/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-7775/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5679/ （KINCHO園芸 植物栽培ナビ）

### 採用理由
2ソース共に「水やりは控えめ」「表面が乾いてから2〜3日後」「月1〜2回目安」で一致。多肉の中でも特に断水寄り管理。

### moisture_level 数値化理由
サボテン（0.10）とエケベリア（0.15）の中間。「乾いてから2〜3日後」はサボテンと近い管理だが、月1回という頻度目安はエケベリア並み。バランスを取り 0.13 を採用。

---

## グラプトペタルム（朧月）

| フィールド | 値 |
|---|---|
| name | グラプトペタルム |
| plant_category | succulent |
| growth_form | other |
| parent_id | null |
| aliases | 朧月, オボロヅキ |
| preferred_moisture_level | **0.18** |
| moisture_band | 1 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 春秋: 表面が乾いたらたっぷり／夏: 10日に1回夕方軽く／冬: 2〜4週に1回 |
| watering_notes | 屋外で放置気味に育てても増える強健種。極寒の凍結と夏場の蒸れさえ避ければ育てやすい。落ちた葉から容易に増える。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/5685/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/5685/ （KINCHO園芸 植物栽培ナビ）
2. https://www.hyponex.co.jp/plantia/plantia-8377/ （ハイポネックス Plantia 多肉植物おすすめ10選）

### 採用理由
2ソース共に「屋外で放置気味に育つ」「春秋は表面が乾いたらたっぷり」「夏は10日に1回」「冬は2〜4週」で一致。ハオルチアとほぼ同じ水やりサイクル。

### moisture_level 数値化理由
ハオルチア（0.18）と同水準。生育期・夏・冬の水やりパターンがほぼ同一。異なるのは光要求（朧月は直射日光OK）だが moisture_level には反映しない。0.18 を採用。

---

## リプサリス

| フィールド | 値 |
|---|---|
| name | リプサリス |
| plant_category | succulent |
| growth_form | other |
| parent_id | null |
| aliases | ヒモサボテン |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 表面が乾いて数日後たっぷり／夏は頻度減／冬は月1〜2回＋葉水中心 |
| watering_notes | 森林性サボテン。熱帯雨林原産で樹木に着生。空中湿度を好み、乾燥した室内では葉水推奨（ハダニ予防にも有効）。直射日光を嫌い明るい日陰で管理。他の多肉と全く異なる水分管理が必要な点に注意。 |
| reference_url | https://andplants.jp/blogs/magazine/rhipsalis |

### 参照URL
1. https://andplants.jp/blogs/magazine/rhipsalis （AND PLANTS）
2. https://lovegreen.net/library/cactus/rhypsalis/p92459/ （LOVEGREEN）
3. https://greensnap.jp/category1/succulent/botany/27/growth （GreenSnap）

### 採用理由
3ソース共に「森林性サボテン」「空中湿度を好む」「土の乾燥から数日後にたっぷり」「葉水推奨」で一致。ハイポネックス／KINCHOには専用ページがなかったため園芸専門メディア3ソースで確認。

### moisture_level 数値化理由
「多肉」カテゴリに属するが管理は観葉植物寄り。ゼラニウム（0.42、band 3 下端）とほぼ同水準の湿潤志向。他の succulent（band 1）とは大きく離れるため、カテゴリ内での例外として明示コメントを付与する必要あり。

---

## 金のなる木（クラッスラ）

> 人間レビュー対応（2026-08-21）でADD_CANDIDATE→採用。縁起物として家庭保有率が非常に高い定番多肉。現行succulentで最もポピュラーな一種が抜けていた。

| フィールド | 値 |
|---|---|
| name | 金のなる木 |
| plant_category | succulent |
| growth_form | other |
| parent_id | null |
| aliases | クラッスラ, カネノナルキ |
| preferred_moisture_level | **0.17** |
| moisture_band | 1 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 春秋: 鉢土の表面が乾いたらたっぷり（夏は10日に1回夕方軽く）／冬: 2〜4週に1回程度 |
| watering_notes | ベンケイソウ科の丈夫な多肉植物。枯れる原因のほとんどは水のやりすぎで、乾かし気味の管理が基本。過湿による根腐れに注意。日当たりを好む。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-238/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-238/ （ハイポネックス 園芸サポート 金のなる木）
2. https://www.kincho-engei.co.jp/cultivation/detail/5684/ （KINCHO園芸 クラッスラの育て方）

### 採用理由
2ソース共に「春秋は表面が乾いたらたっぷり」「冬は2〜4週に1回程度に減らす」「枯れる原因のほとんどは水のやりすぎ」で一致。KINCHOはクラッスラ属内の生育型差（春秋型/夏型/冬型）に触れているが、金のなる木（Crassula ovata）はハイポネックスの「金のなる木」専用記述に準拠。

### moisture_level 数値化理由
セダム（0.17）・ハオルチア（0.18）と同水準の乾燥志向。「乾かし気味が基本」「水のやりすぎが枯死の主因」という記述が他の乾燥系succulentと一致するため同帯に設定。
