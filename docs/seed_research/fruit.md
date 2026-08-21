# fruit 調査ログ

調査ルール・記入形式は `_template.md` を参照。

アンカー相対比較の主要基準:
- ローズマリー 0.25（band 2 乾燥好み）
- バジル 0.50（band 3 中央）
- アジサイ 0.72（band 4 中〜上端、乾燥に極めて弱い）

初期 seed 対象: 親 8件（子分類は現時点で作成しない方針）
※ 人間レビュー対応（2026-08-21）で温州みかん・ユズ・ウメ・リンゴ・カキをDROP、イチゴをADD（12→8件）。
　件数目安（10〜15件）は必達条件ではなく、niwa.logでの水やり支援価値を優先した結果。

---

## ブルーベリー

| フィールド | 値 |
|---|---|
| name | ブルーベリー |
| plant_category | fruit |
| growth_form | shrub |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.75** |
| moisture_band | 4 |
| is_moisture_anchor | false |
| watering_amount | heavy |
| watering_pace | 4〜7月: 1日1回／8〜9月: 1日2回／10〜3月: 表面が乾いたら |
| watering_notes | 根が非常に浅く乾燥に極めて弱い。夏の水切れは落葉・収穫量激減の原因。酸性土（pH 4.5程度）を好むためブルーベリー専用土推奨。受粉樹として異なる2品種以上を近くで育てる必要あり。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/4771/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/4771/ （KINCHO園芸 鉢植え）
2. https://www.hyponex.co.jp/plantia/plantia-7289/ （ハイポネックス Plantia）

### 採用理由
2ソース共に「根が乾燥に極めて弱い」「夏は1日2回水やり」「10月以降は表面が乾いたら」で一致。酸性土壌要求と2品種栽培の必要性も両ソースで一致。

### moisture_level 数値化理由
「乾燥に極めて弱い」「夏は1日2回」というアジサイ（0.72）と同等の記述。ただしブルーベリーはさらに「根が浅い」「水切れで落葉」というリスクが強調されるため、アジサイより若干上の 0.75 を採用。band 4 上端。

---

## レモン

| フィールド | 値 |
|---|---|
| name | レモン |
| plant_category | fruit |
| growth_form | tree |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 表面が乾いたら底から流れるまで／夏: 1日2回／冬: 控えめ |
| watering_notes | 柑橘の中でも水切れに敏感（一度切らすと落葉しやすい）。寒さにやや弱く、寒冷地では鉢植えで屋内越冬が安心。1〜2年に1回植え替え推奨。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15698/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15698/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-7424/ （ハイポネックス Plantia 柑橘まとめ）

### 採用理由
2ソース共に「表面が乾いたらたっぷり」「夏は1日2回」「水切れで落葉」「寒さに弱い」で一致。柑橘の中では特に水切れリスクが強調されている。

### moisture_level 数値化理由
標準的な「表面が乾いたらたっぷり」= band 3 中央（0.50）に、「水切れで落葉」を加味してやや湿潤寄りの 0.55 を採用。他の柑橘（0.48〜0.50）よりわずかに水を好む。

---

## 温州みかん（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 地植えでは活着後の水やりがほぼ不要で、成熟した個体では日常的な水やり判断が発生しにくい。柑橘の中でもキンカン・レモンと役割が重複するため、人間レビューによりMVP初期seedから除外された。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | 温州みかん |
| plant_category | fruit |
| growth_form | tree |
| parent_id | null |
| aliases | ウンシュウミカン, みかん |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 4〜9月 1日1回／それ以外 表面が乾いたら／地植えは基本不要 |
| watering_notes | 耐暑性・耐寒性ともに優れる。花芽〜結実期は水切れ厳禁。地植えは日当たり・水はけ良好で風の当たらない場所。夏の日照りが続いたら地植えでも補水。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-120/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-120/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4757/ （KINCHO園芸 鉢植え）

### 採用理由
2ソース共に「鉢植え4〜9月は1日1回」「地植えは基本水やり不要」「花芽〜結実期は水切れ注意」で一致。標準的な柑橘管理。

### moisture_level 数値化理由
柑橘の基本管理。レモンほど水切れリスクが強調されず、標準的な band 3 中央の 0.50 を採用。バジル（0.50）と同水準。

---

## キンカン

| フィールド | 値 |
|---|---|
| name | キンカン |
| plant_category | fruit |
| growth_form | shrub |
| parent_id | null |
| aliases | 金柑 |
| preferred_moisture_level | **0.48** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 4〜9月 1日1回／10〜12月は乾かし気味／地植えは基本不要 |
| watering_notes | 柑橘の中では小柄で鉢栽培に向く。10〜12月の成熟期は乾かし気味の方が果実の色づき・甘みが良い。春〜夏の水切れは落果・落葉の原因。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/4626/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/4626/ （KINCHO園芸 地植え）
2. https://www.hyponex.co.jp/plantia/plantia-15753/ （ハイポネックス Plantia）

### 採用理由
2ソース共に「4〜9月は1日1回」「10〜12月は乾かし気味で果実が甘くなる」「地植えは基本不要」で一致。特に成熟期の乾燥管理が明示的に記載されている点で温州みかんとやや異なる。

### moisture_level 数値化理由
温州みかん（0.50）とほぼ同じ管理だが、成熟期の「乾かし気味」が明示的なため、年間通算でやや乾燥寄りの 0.48 を採用。band 3 中央〜下寄り。

---

## ユズ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 地植えは基本不要、結実まで庭植え7〜8年と長い成木依存の管理で、日常の水やり判断がほぼ発生しない。キンカン・レモンと機能重複しており、人間レビューによりMVP初期seedから除外された。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | ユズ |
| plant_category | fruit |
| growth_form | tree |
| parent_id | null |
| aliases | 柚子 |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 表面が乾いたら底から溢れるまで／地植えは基本不要／収穫前は乾かし気味 |
| watering_notes | 他の柑橘より樹勢が強く深根性で枝葉がよく茂る。花・結実まで庭植え7〜8年、鉢植え3〜4年と時間がかかる。カラタチ台木が一般的。収穫前（9月下旬〜）は乾かし気味で果実充実。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-7424/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-7424/ （ハイポネックス Plantia 柑橘まとめ）
2. https://www.hyponex.co.jp/yasai_daijiten/column/column-2416 （ハイポネックス みなとの野菜大辞典）

### 採用理由
2ソース共に「鉢は表面が乾いたら」「地植えは基本不要」「収穫前は乾かし気味」で一致。深根性で樹勢が強いという特性も両ソースで一致。

### moisture_level 数値化理由
温州みかん（0.50）と同じ標準柑橘管理。深根性のため地植えでは特に乾燥に強い（水切れ耐性は柑橘中最強クラス）が、鉢管理は他柑橘と同等なので 0.50 を採用。

---

## イチジク

| フィールド | 値 |
|---|---|
| name | イチジク |
| plant_category | fruit |
| growth_form | tree |
| parent_id | null |
| aliases | 無花果, フィグ |
| preferred_moisture_level | **0.58** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 基本1日1回／夏: 1日2回／冬: 頻度減 |
| watering_notes | 果樹の中では水を好む方。夏の直射日光が強すぎると弱るため半日陰か日よけ推奨。早ければ1年目から収穫可能。10号（30cm）以上の鉢が目安。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9271/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9271/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4777/ （KINCHO園芸 鉢植え）

### 採用理由
2ソース共に「鉢は基本1日1回」「夏は1日2回」「冬は頻度減」で一致。柑橘より水やり頻度が高く、標準果樹よりやや湿潤志向。

### moisture_level 数値化理由
「基本1日1回」は柑橘標準（0.50）より頻度高く、band 3 中〜上寄り。ただし「乾燥に極めて弱い」ではないため、ブルーベリー（0.75）・カキ（0.72）ほどではない。0.58 を採用。

---

## カキ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 文化的な認知度は高いが、地植え成木は活着後基本的に水やり不要で日常の支援価値が低い。人間レビューによりMVP初期seedから除外された。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | カキ |
| plant_category | fruit |
| growth_form | tree |
| parent_id | null |
| aliases | 柿 |
| preferred_moisture_level | **0.72** |
| moisture_band | 4 |
| is_moisture_anchor | false |
| watering_amount | heavy |
| watering_pace | 鉢: 5〜9月 朝夕2回／冬: 表面が乾いたら／地植えは活着後は基本不要 |
| watering_notes | 鉢栽培では乾燥に極めて弱い。真夏の日中の水やりは水温上昇で根を傷めるため朝夕に。冬でも土が乾燥したら補水。地植えは活着すれば基本不要だが日照りが続いたら補水。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/4781/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/4781/ （KINCHO園芸 鉢植え）
2. https://www.hyponex.co.jp/plantia/plantia-17830/ （ハイポネックス Plantia）

### 採用理由
2ソース共に「鉢は5〜9月は朝夕2回」「冬でも乾いたら補水」「地植えは活着後は基本不要」で一致。「乾燥に極めて弱い」記述は鉢栽培で明示的。

### moisture_level 数値化理由
「乾燥に極めて弱い」「朝夕2回」はアジサイ（0.72）と同等の記述。地植えでは乾燥耐性があるが、moisture_level は鉢栽培基準で判断（保守的採用）。0.72 を採用。

---

## ウメ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 「庭木の代表格」的な存在で成熟後は水やり判断がほぼ発生せず、niwa.logの支援価値が低い。人間レビューによりMVP初期seedから除外された。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | ウメ |
| plant_category | fruit |
| growth_form | tree |
| parent_id | null |
| aliases | 梅 |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 表面が乾いたらたっぷり／冬に室内取り込み時は霧吹きで補湿 |
| watering_notes | 花梅と実梅がある。実を収穫したい場合は2品種以上を同時栽培推奨。冬に暖房中の室内に入れる場合は霧吹きで枝・幹に補湿。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/4762/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/4762/ （KINCHO園芸 鉢植え）
2. https://www.hyponex.co.jp/plantia/study/10998 （ハイポネックス Plantia）

### 採用理由
2ソース共に「鉢は表面が乾いたらたっぷり」「花梅／実梅の使い分け」「実梅は2品種同時栽培」で一致。標準的な果樹管理。

### moisture_level 数値化理由
「表面が乾いたらたっぷり」= band 3 中央（0.50）。特に乾燥・湿潤志向が強調されていないため標準採用。

---

## リンゴ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 栽培適地が気候的に限られ全国的な家庭園芸の定番とは言いにくく、成熟後の水やり判断も希薄。人間レビューによりMVP初期seedから除外された。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | リンゴ |
| plant_category | fruit |
| growth_form | tree |
| parent_id | null |
| aliases | 林檎 |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 表面が乾き始めたら／夏: 表面が乾いたら鉢底から流れるまで |
| watering_notes | 家庭向けは早生品種（さんさ・祝・つがる等）が豊産性でおすすめ。直射日光・西日は葉焼け・実焼けを起こすためやわらかい日差しの場所へ。受粉樹として異なる品種の混植が必要。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-19997/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-19997/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4719/ （KINCHO園芸 地植え）

### 採用理由
2ソース共に「表面が乾き始めたら」「夏は鉢底から流れるまで」「品種混植による受粉」で一致。標準的な果樹管理。

### moisture_level 数値化理由
「表面が乾き始めたら」は「乾いたら」よりやや早めのタイミングだが、標準果樹管理の範疇。band 3 中央の 0.50 を採用。

---

## ラズベリー

| フィールド | 値 |
|---|---|
| name | ラズベリー |
| plant_category | fruit |
| growth_form | shrub |
| parent_id | null |
| aliases | フランボワーズ, キイチゴ |
| preferred_moisture_level | **0.60** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 4〜7月 1日1回／8〜9月 1日2回／10〜3月 表面が乾いたら |
| watering_notes | 半日陰でも育つ。ベランダ栽培では夏の乾燥に注意。鉢栽培は2年ごとの植え替えが必要（3年超で根詰まり）。水はけの良い土を選ぶ。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/4666/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/4666/ （KINCHO園芸）
2. https://www.hyponex.co.jp/plantia/plantia-7321/ （ハイポネックス Plantia）

### 採用理由
2ソース共に「4〜7月は1日1回」「8〜9月は1日2回」「地植えは自然降雨中心」で一致。ブルーベリーと同じベリー類だがブルーベリーほど乾燥に弱くない。

### moisture_level 数値化理由
夏（8〜9月）は1日2回でブルーベリー相当だが、春〜初夏は1日1回で標準寄り。ブルーベリー（0.75）ほどではない band 3 上端の 0.60 を採用。

---

## ブラックベリー

| フィールド | 値 |
|---|---|
| name | ブラックベリー |
| plant_category | fruit |
| growth_form | shrub |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 表面が乾いたら鉢底から流れるまで／庭植えは日照時に補水 |
| watering_notes | 木イチゴの仲間で病害虫に強く育てやすい。直立性・つる性がある。つる性はフェンス誘引推奨。旺盛に伸びるため冬の剪定必須（前年枝を1/2〜1/3残す）。夏に実がついた枝は枯死するので収穫後根元から剪定。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-164/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-164/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4666/ （KINCHO園芸 ラズベリー：同属で管理準拠）

### 採用理由
ハイポネックスは「鉢は表面が乾いたら鉢底から流れるまで」「庭植えは日照時に補水」を明記。ラズベリーと同属で管理も準拠。ラズベリーより水管理の頻度指定は控えめ（1日2回等の記述なし）。

### moisture_level 数値化理由
「表面が乾いたら」の標準管理はラズベリー（0.60）より若干控えめ。夏の頻度2回等の強調がないため 0.55 を採用。band 3 中央〜やや上。

---

## オリーブ

| フィールド | 値 |
|---|---|
| name | オリーブ |
| plant_category | fruit |
| growth_form | tree |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.35** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 表面が乾いたらたっぷり／夏: 毎日／冬: 控えめ／夏の水やりは午前中に |
| watering_notes | 地中海原産で乾燥に強い。水はけと水もちのバランスが重要。開花期（5〜6月）が梅雨と重なるため受粉不良になりやすく、鉢は軒下推奨。実をつけるには2品種以上混植。夏の午後の水やりは水温上昇で根傷めの原因。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15832/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15832/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4780/ （KINCHO園芸 鉢植え）

### 採用理由
2ソース共に「乾燥に強い」「水はけ重視」「梅雨の受粉不良」「夏は午前中の水やり」で一致。地中海性ハーブ（ローズマリー・ラベンダー）と近い管理志向。

### moisture_level 数値化理由
ローズマリー（0.25）・ラバンジン等の地中海性より若干湿潤側（夏は毎日水やりが必要な点で差）。ただしバジル（0.50）よりは明確に乾燥寄り。band 2 上端の 0.35 を採用。

---

## イチゴ

> 人間レビュー対応（2026-08-21）でADD_CANDIDATE→採用。Issue #6本文がgrowth_form例として使用していたにもかかわらず未収録だった。プランター栽培が標準で根が浅く水切れに敏感、家庭園芸で最も定番の果物の一つ。

| フィールド | 値 |
|---|---|
| name | イチゴ |
| plant_category | fruit |
| growth_form | herbaceous |
| parent_id | null |
| aliases | いちご |
| preferred_moisture_level | **0.58** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 表面が乾いたらたっぷり株元へ（午前中）／目安は秋〜春2〜5日に1回、夏は乾きやすくこまめに |
| watering_notes | 多年草。プランター栽培が一般的で根が浅く水切れに注意。乾燥を嫌うが過湿は根腐れの原因。葉・花に水をかけず株元へ与える。ランナーで子株を増やす。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-267/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-267/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4252/ （KINCHO園芸 鉢植え）

### 採用理由
2ソース共に「土の表面が乾いたらたっぷり株元へ」「花・葉に水をかけない」で一致。KINCHOは季節別の目安（10月中旬: 2日に1回／11〜3月: 3〜5日に1回／4〜6月: 2日に1回）を明記しており、鉢植え・プランター栽培中心で日常的な水やり判断が発生することを裏付ける。

### moisture_level 数値化理由
根が浅く水切れに弱い点はブルーベリー（0.75）と同傾向だが、水やり間隔は2〜5日と幅がありブルーベリーほど極端ではない。ラズベリー（0.60）よりやや乾燥寄りの band 3 上端 0.58 を採用。
