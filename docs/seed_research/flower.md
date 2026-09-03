# flower 調査ログ

調査ルール・記入形式は `_template.md` を参照。

花もの category は band 2〜band 4 に幅広く分布。
アンカー相対比較の主要基準:
- ローズマリー 0.25（band 2 乾燥好み）
- ゼラニウム 0.42（band 3 下端）
- バジル 0.50（band 3 中央）
- アジサイ 0.72（band 4 乾燥に極めて弱い）

初期 seed 対象: 親 26件（子分類は原則作成しない方針。ただしバラは家庭園芸上のジャンルとして大きく、
単一レコードでは過少代表になるため例外的に子分類2件（ミニバラ・つるバラ）を追加）
※ 人間レビュー対応（2026-08-21）でサザンカ・キンモクセイ・ツバキ・サツキをDROP、
　ハイビスカス・カレンデュラをADD（27→25件）。件数目安（25〜30件）は必達条件ではない。
※ 追加人間レビュー対応（2026-09-03）でチェリーセージをADD（25→26件）。
　開発者本人が栽培しており独立登録を希望。herbの「コモンセージ」（旧セージ）とは
　耐寒性・耐暑性が逆方向のため独立レコード、既存の「サルビア」（S. splendens、一年草）
　とも種が異なるため独立レコードとした。詳細な経緯は `herb.md` のセージ節も参照。
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
| aliases | サフィニア |
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

## サフィニア（→ ペチュニアへ統合）

> Issue #7 レビュー対応（2026-08-20）で、独立レコードは削除しペチュニアの `aliases` に統合。
> 管理方法が実質的に同じ場合は親レコードのみとする Issue #6 の階層ルールに従う。
> 検索性のためペチュニアの aliases に `サフィニア` を追加している。

以下は削除前の調査記録として保持:

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

## サザンカ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 生垣・庭木としての認知度は高いが、成熟個体は地植えで降雨任せとなり日常的な水やり判断がほぼ発生しない。人間レビューによりMVP初期seedから除外された。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

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

## キンモクセイ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 地植えは基本的に水やり不要な庭木の代表で、香り文化としての認知度は高いが実用的な支援価値は低い。人間レビューによりMVP初期seedから除外された。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

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
2. https://shop.takii.co.jp/simages/shop/selection/rose1704.html （タキイネット通販 バラのよくある育て方Q&A）

> Issue #7 再レビュー対応（2026-08-21）で2ソース目を修正。
> 従来の https://www.kincho-engei.co.jp/cultivation/detail/5438/ はつるバラ（鉢植え）専用記事であり、
> 一般的なバラの2ソース目としては不適切だったため、タキイのQ&A記事に差し替えた。
> 「鉢植えなら必ず1日に1回、夕方に乾いていたら2回水やりしてもかまいません」の記述で既存値と一致。
> つるバラ専用記事は下記の子分類「つるバラ」の参照URLとして使用する。

### moisture_level 数値化理由
「1日1回、真夏朝夕2回」で band 3 中〜上。0.55。

---

## ミニバラ（子）

> Issue #7 再レビュー対応（2026-08-21）で追加。バラは家庭園芸上のジャンルとして大きく、
> 単一レコードでは過少代表になるとの指摘を受け、鉢植え中心で管理がシビアなミニバラを子分類として追加。

| フィールド | 値 |
|---|---|
| name | ミニバラ |
| plant_category | flower |
| growth_form | shrub |
| parent_id | バラ |
| aliases |  |
| preferred_moisture_level | **0.58** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢: 土の表面が乾いたら午前中に株元へたっぷり（花に水をかけない） |
| watering_notes | 鉢植え中心で栽培される小型品種。根鉢が小さいため一度乾かすと枯死しやすい一方、過湿は根腐れの原因。乾燥・病害虫の影響を受けやすくこまめな観察が必要。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-129/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-129/ （ハイポネックス 園芸サポート ミニバラ）
2. https://www.kincho-engei.co.jp/cultivation/detail/5183/ （KINCHO園芸 植物栽培ナビ ミニバラ）

### 採用理由
2ソース共に「土の表面が乾いたらたっぷり」「花に水をかけない」が一致。ハイポネックスは「午前中に水やり」を強調、KINCHOは「一度根鉢を乾かすと枯死」「水のやりすぎは根腐れ」「乾燥・病害虫の影響を受けやすい」と管理のシビアさを補強。

### moisture_level 数値化理由
親バラ（0.55）より根鉢が小さく水切れしやすい分、やや湿潤寄りの0.58を採用。band 3上端。

---

## つるバラ（子）

> Issue #7 再レビュー対応（2026-08-21）で追加。つる状に仕立てるためgrowth_formが親バラ（shrub）と異なりvineになる点、
> および地植え定着後の管理が大きく異なる点から子分類として追加。

| フィールド | 値 |
|---|---|
| name | つるバラ |
| plant_category | flower |
| growth_form | vine |
| parent_id | バラ |
| aliases | クライミングローズ |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 鉢: 土の表面が乾いたら午前中にたっぷり（開花期はほぼ毎日、真夏は朝夕2回）／地植え: 根づいた後は降雨中心で乾燥時のみ |
| watering_notes | 木立ちバラ（つる状に仕立てない通常のバラ）とは異なりつる状に伸びる仕立てのためgrowth_formはvine。地植えで根づいた株は乾燥に強く降雨中心で足りるが、鉢植えは開花期（4〜8月）にほぼ毎日の水やりが必要。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-20306/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-20306/ （ハイポネックス Plantia つるばらの育て方）
2. https://www.kincho-engei.co.jp/cultivation/detail/5438/ （KINCHO園芸 植物栽培ナビ つるバラ（鉢植え））

### 採用理由
2ソース共に「鉢植えは土の表面が乾いたら水やり」「地植えは根づけば降雨中心」「開花期は水切れ注意」が一致。KINCHOは開花期（4〜8月）に「ほぼ毎日」「真夏は朝夕2回」と具体的な頻度を明記。

### moisture_level 数値化理由
基本パターンは親バラ（0.55）と同水準。地植え定着後の乾燥耐性がやや高いため親と同値を採用し、growth_form（vine）で管理差を表現する。

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

## チェリーセージ

> 追加人間レビュー対応（2026-09-03）でADD。開発者本人がコモンセージ・チェリーセージを栽培しており、niwa.log上で別々に登録・管理したいとの要望を受け調査。当初「セージ（herb）の子分類」案も検討したが、観賞価値が高く開花期も長いこと、既存flower「サルビア」との分類上の位置づけを踏まえ、人間レビューの結果 flower カテゴリの独立レコードとすることに決定。

| フィールド | 値 |
|---|---|
| name | チェリーセージ |
| plant_category | flower |
| growth_form | shrub |
| parent_id | null |
| aliases | サルビア・ミクロフィラ |
| preferred_moisture_level | **0.32** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 鉢: 表面が乾いたらたっぷり（夏は日中を避け朝夕に）／地植え: 根付き後は基本不要 |
| watering_notes | 中南米原産で耐暑性は強いが耐寒性は弱く、霜で枯死のおそれがある（寒冷地は鉢植えで冬は室内へ）。低木状に木化し、開花期は5〜11月と長い。同じセージ属のherb「コモンセージ」とは耐寒性・耐暑性が逆方向。 |
| reference_url | https://www.hyponex.co.jp/plantia/22445/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/22445/ （ハイポネックス Plantia、チェリーセージ専用記事）
2. https://www.shuminoengei.jp/m-pc/a-page_p_detail/target_plant_code-286/target_tab-2 （NHK趣味の園芸 植物図鑑「サルビア（宿根性）」。コモンセージ・チェリーセージ双方を代表品種として紹介）

### moisture_level 数値化理由
地植えは根付き後不要・鉢植えは乾いたらたっぷりという点でコモンセージ（0.30）と同水準の乾燥志向だが、5〜11月と開花期が長く生育期の水切れリスクがコモンセージよりやや高いため、わずかに高い0.32を採用（同じband 2内）。

### herb「コモンセージ」・既存flower「サルビア」との区別

- **コモンセージ**（herb, S. officinalis）とは耐寒性・耐暑性が逆方向（コモンセージ=耐寒性強／耐暑性弱、チェリーセージ=耐暑性強／耐寒性弱）で、niwa.logの栽培支援上重要な差があるため独立レコード。
- **サルビア**（flower, S. splendens、一年草の花壇苗）とは種・生育形態（一年草の草本 vs 多年草の低木）が異なり、直接の重複はない。

### 独立レコード化の判断根拠

Issue #6の2026-08-21改定基準「独立親レコードは、管理差の大小だけでなく『独立した検索・登録需要があるか』も根拠になる」に基づき、開発者本人による独立登録・管理の希望を主根拠として採用。加えて、コモンセージとの耐寒性・耐暑性の違いも実用上意味のある管理差として確認済み。

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

## ツバキ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 地植えは猛暑時のみ水やりが必要な庭木の代表で、文化的重要性は高いが日常の支援価値は低い。人間レビューによりMVP初期seedから除外された。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

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

## サツキ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 地植えは降雨任せの庭木の代表で、植木としての定番性は高いが日常の支援価値は低い。人間レビューによりMVP初期seedから除外された。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

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

---

## ハイビスカス

> 人間レビュー対応（2026-08-21）でADD_CANDIDATE→採用。夏の鉢花として圧倒的な流通量。水切れで葉が目に見えてしおれる典型植物で「今日水やる/やらない」判断の教科書的存在。

| フィールド | 値 |
|---|---|
| name | ハイビスカス |
| plant_category | flower |
| growth_form | shrub |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.68** |
| moisture_band | 4 |
| is_moisture_anchor | false |
| watering_amount | heavy |
| watering_pace | 生育期(春〜秋): 土の表面が乾いたら鉢底から流れるまで（夏は朝夕2回も）／冬: 乾かし気味に回数を減らす |
| watering_notes | 常緑低木。生育旺盛な夏は水を盛んに吸収し、水切れで葉先枯れ・蕾落ちが起きやすい。鉢植えは特に水切れ注意。冬は休眠気味になり乾燥気味の管理に切り替える。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14499/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14499/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/gardeningbeginner/column/2025/06/vol59.html （KINCHO園芸）

### 採用理由
2ソース共に「生育期(春〜秋)は表面が乾いたらたっぷり」「夏は朝夕2回も」「冬は乾かし気味・回数を減らす」で一致。「水切れで葉先枯れ・蕾落ち」という失敗サインが明確な点もniwa.log向き。

### moisture_level 数値化理由
夏の水切れリスクの強さからアジサイ（0.72）に近い band 4 に設定。「朝夕2回」の記述はアジサイと同水準だが、冬季の断水傾向はアジサイほど極端でないためやや低い0.68を採用。

---

## カレンデュラ（キンセンカ）

> 人間レビュー対応（2026-08-21）でADD_CANDIDATE→採用。人間レビューコメント: 「私が育てているため、開発者に強く需要」。

| フィールド | 値 |
|---|---|
| name | カレンデュラ |
| plant_category | flower |
| growth_form | herbaceous |
| parent_id | null |
| aliases | キンセンカ |
| preferred_moisture_level | **0.40** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢: 表面が乾いたら鉢底から流れるまで／地植え: 降雨任せで基本不要／冬は乾燥気味に管理 |
| watering_notes | 一年草。丈夫で育てやすい秋まき春咲きの定番花壇苗。過湿は根腐れの原因。花に直接水をかけないよう株元へ与える。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15467/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15467/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4876/ （KINCHO園芸）

### 採用理由
2ソース共に「表面が乾いたらたっぷり」「地植えは降雨で基本問題なし」「冬は乾燥気味」で一致。丈夫で初心者向けという評価も両ソースで共通。

### moisture_level 数値化理由
「表面が乾いたらたっぷり」の標準的な鉢花管理で、パンジー・ビオラ（0.42）よりわずかに乾燥寄りのband 2上端〜band 3境界の0.40を採用。地植えでの降雨依存度がパンジーよりやや高い記述のため。
