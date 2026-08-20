# flower 調査ログ

調査ルール・記入形式は `_template.md` を参照。

花もの category は band 2〜band 4 に幅広く分布。
アンカー相対比較の主要基準:
- ローズマリー 0.25（band 2 乾燥好み）
- ゼラニウム 0.42（band 3 下端）
- バジル 0.50（band 3 中央）
- アジサイ 0.72（band 4 乾燥に極めて弱い）

初期 seed 対象: 親 26件（子分類は現時点で作成しない方針）
※ アジサイ・ゼラニウムは Session 0（anchor）で登録済み。

---

## 千日紅

| フィールド | 値 |
|---|---|
| name | 千日紅 |
| plant_category | flower |
| growth_form | herbaceous |
| aliases | センニチコウ, ゴンフレナ |
| preferred_moisture_level | **0.28** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 鉢: 表面乾いたらたっぷり／地植え: 降雨任せ／夏は朝夕1回 |
| watering_notes | 暑さ・乾燥に強く長期間楽しめる。過湿に弱く肥料も与えすぎ注意。 |
| reference_url | https://www.hyponex.co.jp/plantia/6024/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/6024/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-8885/ （ハイポネックス Plantia 夏の花20選）

### moisture_level 数値化理由
「乾燥を好む」で band 2 中央。マジョラム（0.27）と同水準。

---

## カーネーション

| フィールド | 値 |
|---|---|
| name | カーネーション |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.30** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 表面乾燥してさらさらしてから鉢底から流れるまで／冬: 完全乾燥から2〜3日後 |
| watering_notes | 水やりすぎで根腐れ。花蕾に水がかかると病気やカビ。朝夕の涼しい時間帯に。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14782/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14782/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/gardeningbeginner/column/2023/05/5-1.html （KINCHO園芸）

### moisture_level 数値化理由
「表面が乾いてさらさらしてから」は「表面乾いたら」より明確に乾燥待ちが長い。ドラセナ（0.30）と同水準の band 2 中央。

---

## ラナンキュラス

| フィールド | 値 |
|---|---|
| name | ラナンキュラス |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.30** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 乾燥気味／表面乾いたら／植えつけ直後は4〜5日水やらない |
| watering_notes | 球根植物。加湿は球根腐りの原因。花びらは繊細で水がかかると傷む。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-7234/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-7234/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5011/ （KINCHO園芸）

### moisture_level 数値化理由
「乾燥気味」「加湿NG」でカーネーションと同水準。0.30。

---

## コスモス

| フィールド | 値 |
|---|---|
| name | コスモス |
| plant_category | flower |
| growth_form | herbaceous |
| aliases | 秋桜 |
| preferred_moisture_level | **0.32** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 鉢: 表面乾燥後たっぷり／地植え: 降雨任せ |
| watering_notes | 湿度高く暗い場所は苦手。肥料水与えすぎで倒れやすくなる。日当たり風通し良好が必須。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15193/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15193/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4888/ （KINCHO園芸）

### moisture_level 数値化理由
「乾燥気味」「地植え不要」でカーネーション（0.30）よりやや湿潤側。band 2 中央〜上寄りの 0.32。

---

## ベゴニア

| フィールド | 値 |
|---|---|
| name | ベゴニア |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.35** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 表面乾いてからたっぷり／冬: 乾いてから数日後 |
| watering_notes | 多湿苦手で水やりすぎで根腐れ。葉に水かけると傷み・病気。株元にそっと。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-7354/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-7354/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/garden_support/garden_support-111/ （ハイポネックス 園芸サポート リーガース）

### moisture_level 数値化理由
「表面乾いてから」で標準管理、ただし「多湿苦手」が明示的。band 2 上端の 0.35。オリーブ（0.35）と同水準。

---

## ガーベラ

| フィールド | 値 |
|---|---|
| name | ガーベラ |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.35** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 鉢: 表面乾いてから鉢底から流れるまで／地植え: 基本不要 |
| watering_notes | 過湿苦手で根腐れリスク。葉間に水たまると蒸れ・病気。株元へ与える。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-7245/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-7245/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-15092/ （ハイポネックス Plantia 秋のガーベラ）

### moisture_level 数値化理由
ベゴニアと同じ「過湿苦手・乾燥待ち」管理で 0.35。

---

## パンジー

| フィールド | 値 |
|---|---|
| name | パンジー |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 表面乾いたらたっぷり／冬は午前中に |
| watering_notes | 多湿嫌い。冬は午後の水やりで凍結リスク。日当たり風通し重要。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9630/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9630/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/gardeningbeginner/column/2025/11/vol76.html （KINCHO園芸）

### moisture_level 数値化理由
「表面乾いたらたっぷり」「多湿嫌い」でゼラニウム（0.42）と同水準の band 3 下端。

---

## ビオラ

| フィールド | 値 |
|---|---|
| name | ビオラ |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 表面乾いたらたっぷり／冬は午前中に |
| watering_notes | パンジーとほぼ同管理。株が小型で開花期はより長い。日当たり重要。冬季戸外可。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/5185/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/5185/ （KINCHO園芸）
2. https://www.hyponex.co.jp/plantia/plantia-9630/ （ハイポネックス Plantia）

### moisture_level 数値化理由
パンジーとほぼ同一管理。0.42。

---

## マリーゴールド

| フィールド | 値 |
|---|---|
| name | マリーゴールド |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 表面乾いたらたっぷり／地植え: 降雨任せ／夏は朝たっぷり |
| watering_notes | 水はけの良い土を好む。日照不足で徒長・花つき悪化。よく根が張り丈夫。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-8206/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-8206/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4998/ （KINCHO園芸）

### moisture_level 数値化理由
「表面乾いたらたっぷり」の標準管理でパンジー相当。0.42。

---

## ジニア

| フィールド | 値 |
|---|---|
| name | ジニア |
| plant_category | flower |
| growth_form | herbaceous |
| aliases | 百日草, ヒャクニチソウ |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢: 表面乾いてから／地植え: 降雨任せ／夏は朝夕2回も |
| watering_notes | 過湿嫌い、常時湿った土は避ける。水切れは花色悪化。日光重要。 |
| reference_url | https://www.hyponex.co.jp/plantia/study/3525 |

### 参照URL
1. https://www.hyponex.co.jp/plantia/study/3525 （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4963/ （KINCHO園芸 リネアリス）

### moisture_level 数値化理由
「表面乾いてから」で band 3 下端。夏の水切れリスクもあるが基本乾燥待ちの管理。0.42。

---

## クリスマスローズ

| フィールド | 値 |
|---|---|
| name | クリスマスローズ |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 10〜5月: 表面乾いてからたっぷり／6〜9月: 乾かし気味／地植えは基本不要 |
| watering_notes | 過湿嫌う。夏は休眠期で完全に乾かし気味に。冬は午前中の水やりで霜対策。多年草で耐寒性強い。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-6789/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-6789/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4879/ （KINCHO園芸）

### moisture_level 数値化理由
「表面乾いてから」で標準管理、夏は明確に乾かし気味。年間通算で band 3 下端の 0.42。

---

## ペチュニア

| フィールド | 値 |
|---|---|
| name | ペチュニア |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.48** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢: 表面乾いたら鉢底から流れるまで／地植え: 乾燥時のみ／夏は朝夕に |
| watering_notes | 乾燥嫌う。花に水かけない。雨で花傷むため軒下推奨。日当たり必須。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-8181/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-8181/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4981/ （KINCHO園芸）

### moisture_level 数値化理由
「乾燥嫌う、表面乾いたらたっぷり」でパンジー（0.42）より若干湿潤。0.48。

---

## サフィニア

| フィールド | 値 |
|---|---|
| name | サフィニア |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.48** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢: 表面乾いたらたっぷり／夏は朝夕に |
| watering_notes | ペチュニアの改良品種。管理はペチュニア準拠。肥料食い（大食いと呼ばれる）。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14310/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14310/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-8181/ （ハイポネックス Plantia ペチュニア）

### moisture_level 数値化理由
ペチュニアと同一管理。0.48。

---

## サザンカ

| フィールド | 値 |
|---|---|
| name | サザンカ |
| plant_category | flower |
| growth_form | shrub |
| aliases | 山茶花 |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 植えつけから2年: たっぷり／根付き後鉢: 表面乾いたら／地植え: 降雨任せ |
| watering_notes | 開花期は水切らさない。水はけ良く有機物多い土を好む。剪定は3〜4月。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-7434/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-7434/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5033/ （KINCHO園芸）

### moisture_level 数値化理由
「表面乾いたら」の標準管理で band 3 中央。バジル（0.50）と同水準。

---

## キンモクセイ

| フィールド | 値 |
|---|---|
| name | キンモクセイ |
| plant_category | flower |
| growth_form | tree |
| aliases | 金木犀 |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 地植え: 基本不要／鉢: 土乾いたら／夏は水切れ注意（花芽形成期） |
| watering_notes | 夏の水切れは秋の開花不良の原因。水はけ良く栄養ある土を好む。剪定は早春（2〜4月）。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13813/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13813/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5233/ （KINCHO園芸）

### moisture_level 数値化理由
標準的な花木管理。サザンカと同水準の 0.50。

---

## バラ

| フィールド | 値 |
|---|---|
| name | バラ |
| plant_category | flower |
| growth_form | shrub |
| aliases | ローズ |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢: 春秋1日1回、真夏朝夕2回／冬: 土乾いたら朝に |
| watering_notes | 生育旺盛な春〜初夏は水切れ注意。水やりすぎで根腐れも。適切な鉢サイズ（6〜7号から）で徐々に大きく。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14290/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14290/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5438/ （KINCHO園芸 つるバラ）

### moisture_level 数値化理由
「1日1回、真夏朝夕2回」で band 3 中〜上。0.55。

---

## ダリア

| フィールド | 値 |
|---|---|
| name | ダリア |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢: 表面乾いたら鉢底から流れるまで／地植え: 極度乾燥時のみ／夏は朝夕 |
| watering_notes | 球根植物。常時湿状態は球根腐りの原因。植えつけ後は発芽まで水やらない。次々開花で追肥重要。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15355/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15355/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4925/ （KINCHO園芸）

### moisture_level 数値化理由
夏の水切れリスクと球根腐りリスクのバランス。band 3 中〜上の 0.55。バラと同水準。

---

## サルビア

| フィールド | 値 |
|---|---|
| name | サルビア |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 表面が乾き始めたらたっぷり／早朝に |
| watering_notes | 水枯れに弱く水足りないと下葉が枯れる。過湿も根腐れ原因。夏の強日光・西日は苦手。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-8527/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-8527/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4895/ （KINCHO園芸 スプレンデンス）

### moisture_level 数値化理由
「乾き始めたらたっぷり」「水枯れに弱い」でクロトン（0.55）と同水準。0.55。

---

## ケイトウ

| フィールド | 値 |
|---|---|
| name | ケイトウ |
| plant_category | flower |
| growth_form | herbaceous |
| aliases | 鶏頭 |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 毎日たっぷり／夏は朝夕2回／苗育成期は乾燥させない |
| watering_notes | 苗育成期は乾燥厳禁。過湿による根腐れも注意。日光要求性高い。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13856/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13856/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/gardeningbeginner/column/2025/08/vol67.html （KINCHO園芸）

### moisture_level 数値化理由
「毎日たっぷり」「夏朝夕2回」で band 3 中〜上。バラ・サルビアと同水準の 0.55。

---

## シクラメン

| フィールド | 値 |
|---|---|
| name | シクラメン |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 底面給水: 鉢皿の水切らさない／通常鉢: 土に静かに注ぐ／花や球根に直接NG |
| watering_notes | 底面給水鉢が主流。2週に1度は上から給水し老廃物流す。花・球根上部への水は病気の原因。9〜5月開花期は肥料週1。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-7363/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-7363/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4900/ （KINCHO園芸）

### moisture_level 数値化理由
底面給水で水切らさない管理から band 3 中〜上。0.55。

---

## ツバキ

| フィールド | 値 |
|---|---|
| name | ツバキ |
| plant_category | flower |
| growth_form | tree |
| aliases | 椿 |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢夏: 朝夕毎日／春秋: 1〜2日に1回／冬: 土乾いたら／地植え: 猛暑時のみ |
| watering_notes | 乾燥・強い西日で葉焼け。水はけ良く有機物多い酸性土を好む。冬は蕾・枝を寒風から守る。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13816/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13816/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5339/ （KINCHO園芸）

### moisture_level 数値化理由
夏朝夕・春秋1〜2日に1回で band 3 中〜上。0.55。

---

## チューリップ

| フィールド | 値 |
|---|---|
| name | チューリップ |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 植えつけ時: たっぷり／発芽後: 土乾いたら十分に／花後: 葉が枯れるまで継続 |
| watering_notes | 秋植え春咲きの球根。過湿嫌うが水も好む。植えつけ時に球根の向きを揃える（平らな面を外向き）。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9072/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9072/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4928/ （KINCHO園芸）

### moisture_level 数値化理由
「過湿嫌うが水も好む」「発芽後は水欲しがる」で band 3 中央〜上。0.55。

---

## ヒマワリ

| フィールド | 値 |
|---|---|
| name | ヒマワリ |
| plant_category | flower |
| growth_form | herbaceous |
| aliases | 向日葵 |
| preferred_moisture_level | **0.60** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 発芽〜生育初期: 乾燥させない／開花期は朝晩2回たっぷり |
| watering_notes | 根が浅く乾燥がすぐ影響する。株元に敷きワラ推奨。日当たり必須で日照不足だと徒長。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13403/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13403/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4960/ （KINCHO園芸）

### moisture_level 数値化理由
「たっぷりの水」「朝晩2回」で band 3 上端。ラズベリー（0.60）と同水準。

---

## インパチェンス

| フィールド | 値 |
|---|---|
| name | インパチェンス |
| plant_category | flower |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.60** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢: 表面乾き始めたらたっぷり／夏は朝夕1回ずつ／地植えは乾燥時のみ |
| watering_notes | 乾燥苦手で水切れ注意。花に水かけると病気の原因。半日陰でも育つ。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-265/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-265/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4849/ （KINCHO園芸）

### moisture_level 数値化理由
「乾燥苦手」「夏は朝夕1回ずつ」でヒマワリ（0.60）と同水準の band 3 上端。

---

## サツキ

| フィールド | 値 |
|---|---|
| name | サツキ |
| plant_category | flower |
| growth_form | shrub |
| aliases | 皐月 |
| preferred_moisture_level | **0.60** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢夏: 朝夕2回鉢底から流れるまで／それ以外: 土乾く前に／地植え: 降雨任せ |
| watering_notes | 乾燥に弱く川辺自生の湿潤好み。水もち＋水はけの土を好む。真夏の直射日光は避ける。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15471/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15471/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5031/ （KINCHO園芸）

### moisture_level 数値化理由
「川辺のように湿った場所」「乾燥に弱い」で band 3 上端。0.60。

---

## 朝顔

| フィールド | 値 |
|---|---|
| name | 朝顔 |
| plant_category | flower |
| growth_form | vine |
| aliases | アサガオ |
| preferred_moisture_level | **0.65** |
| moisture_band | 4 |
| watering_amount | moderate |
| watering_pace | 開花期: 毎日朝晩たっぷり／発芽期: 乾燥させない |
| watering_notes | 乾燥で花つき悪化、水切れ厳禁。ただし過湿も根腐れ。朝夕の涼しい時間帯に。日照必須（不足でつるばかり伸びる）。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-6374/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-6374/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4833/ （KINCHO園芸）

### moisture_level 数値化理由
「開花期は毎日朝晩」「乾燥で花つき悪化」でヒマワリ（0.60）より湿潤志向。ミント（0.65）と同水準の band 4 下端。
