# vegetable 調査ログ

調査ルール・記入形式は `_template.md` を参照。

野菜は栽培期間が限定的（一年生中心）で、生育ステージにより水管理が変わる。
アンカー相対比較の主要基準:
- ローズマリー 0.25（band 2 乾燥好み）
- ゼラニウム 0.42（band 3 下端）
- バジル 0.50（band 3 中央）
- アジサイ 0.72（band 4 乾燥に極めて弱い）

初期 seed 対象: 親 18件（子分類は現時点で作成しない方針）
※ 人間レビュー対応（2026-08-21）でゴーヤをADD（17→18件）。

---

## ジャガイモ

| フィールド | 値 |
|---|---|
| name | ジャガイモ |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases | じゃがいも, 馬鈴薯 |
| preferred_moisture_level | **0.28** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 地植え: 基本不要／プランター: 前期は乾いたら、後期は乾き気味／芽出しまで水やり不要 |
| watering_notes | 乾き気味の土を好む。水与えすぎで腐りやすい。芽が出た後は表土白っぽく乾いたら水やり。芽かき・土寄せが成功のポイント。 |
| reference_url | https://www.hyponex.co.jp/plantia/7303/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/7303/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4574/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
「乾き気味の土を好む」「地植えは基本不要」で野菜の中で最も乾燥志向。千日紅（0.28）と同水準の band 2 中央。

---

## サツマイモ

| フィールド | 値 |
|---|---|
| name | サツマイモ |
| plant_category | vegetable |
| growth_form | vine |
| aliases | さつまいも, かんしょ |
| preferred_moisture_level | **0.28** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 植えつけ直後1週間: たっぷり／以降: 基本不要（乾燥時のみ） |
| watering_notes | 過湿嫌う。植えつけ後は基本水やり不要。葉がしおれたらたっぷり。つる返し（地上のつるから根が生えないように）が管理のコツ。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-10115/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-10115/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4569/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
「過湿嫌う」「基本水やり不要」でジャガイモと同水準。0.28。

---

## ネギ

| フィールド | 値 |
|---|---|
| name | ネギ |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases | 長ネギ, 葉ネギ |
| preferred_moisture_level | **0.30** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 発芽まで: 乾かさない／発芽後: 基本水やり不要（極端な乾燥時のみ） |
| watering_notes | 発芽後は極端に乾燥するとき以外水やり不要。葉がぐったりしおれない限り水やり不要。土寄せが植えつけ後2〜3週から複数回必要。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13738/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13738/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4062/ （KINCHO園芸 長ネギ）

### moisture_level 数値化理由
「発芽後は基本不要」でサツマイモ（0.28）に近いが、葉ネギはやや水を求める傾向あり。band 2 中央の 0.30。

---

## タマネギ

| フィールド | 値 |
|---|---|
| name | タマネギ |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases | 玉ねぎ |
| preferred_moisture_level | **0.35** |
| moisture_band | 2 |
| watering_amount | light |
| watering_pace | 植えつけ後たっぷり／少々乾燥気味に／冬越し後: 土が乾き過ぎないよう毎日 |
| watering_notes | 多湿に弱い。冬に長晴天時は昼間の水やりで凍結防止。「浅植え」が基本。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-5665/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-5665/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4035/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
「少々乾燥気味」「多湿に弱い」でネギ（0.30）より若干湿潤側。ガーベラ（0.35）と同水準の band 2 上端。

---

## トマト

| フィールド | 値 |
|---|---|
| name | トマト |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 実がなるまで: 控えめ／実がなり始め: 十分に／色づいたら: 控えめ／朝に |
| watering_notes | 「肥料過多より水分過多に注意」。露地は基本降雨任せ、毎日たっぷりは根が浅くなり弱い株に。プランターは底から流れるまで。梅雨は軒下推奨。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-8231/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-8231/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/yasai_daijiten/column/column-11590 （ハイポネックス みなとの野菜大辞典）

### moisture_level 数値化理由
「控えめが基本」「水分過多に注意」でゼラニウム（0.42）と同水準の band 3 下端。

---

## ミニトマト

| フィールド | 値 |
|---|---|
| name | ミニトマト |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 実がなるまで: 控えめ／実がなり始め: 十分に／色づいたら: やや控えめ／朝に |
| watering_notes | 通常のトマトと同管理。梅雨は軒下推奨。色づき始めたら水控えめで甘さアップ。プランター栽培に向く。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14423/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14423/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4423/ （KINCHO園芸 鉢植え）

### moisture_level 数値化理由
トマトと同一管理。0.42。

---

## ホウレンソウ

| フィールド | 値 |
|---|---|
| name | ホウレンソウ |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases | 法蓮草 |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 発芽まで: 乾燥させない／以降: 表面乾いたら／冬: 控えめ午前中に |
| watering_notes | 冷涼な気候好み、暑さ苦手で秋まき冬採りが基本。酸性土に弱く苦土石灰で中和。生長早く1〜2ヶ月で収穫。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9258/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9258/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4089/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
「表面乾いたら」の標準管理、冬は控えめ。トマト（0.42）と同水準。

---

## レタス

| フィールド | 値 |
|---|---|
| name | レタス |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases | リーフレタス |
| preferred_moisture_level | **0.45** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 土乾いたら／水切れ注意／過湿は根腐れ |
| watering_notes | 十分な水必要だが多湿に弱い。梅雨時は雨よけ推奨。植えつけ時期は春秋。約2〜3ヶ月で収穫。外葉から順次収穫可。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-10064/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-10064/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/gardeningbeginner/column/2025/09/vol70.html （KINCHO園芸）

### moisture_level 数値化理由
「十分な水必要だが多湿NG」でホウレンソウ（0.42）より若干湿潤。ポトス（0.45）と同水準。

---

## キャベツ

| フィールド | 値 |
|---|---|
| name | キャベツ |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.45** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 発芽まで: たっぷり／以降: 表面乾いたらたっぷり／結球期: 加湿に注意 |
| watering_notes | 過湿嫌い、水はけの良い土を好む。結球期に加湿すると球が中心から割れやすい。深く根を張る。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-6594/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-6594/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/3958/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
「表面乾いたら」で標準管理、結球期は加湿NG。レタスと同水準の 0.45。

---

## ブロッコリー

| フィールド | 値 |
|---|---|
| name | ブロッコリー |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.45** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 植えつけ後1週間: 乾燥させすぎない／以降: 表面乾いたら株元にたっぷり |
| watering_notes | 過湿・湿害に弱い。水はけ良い状態が必須。地植えは畝を高く。冷涼気候（15〜20℃）が生育適温。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9102/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9102/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4087/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
キャベツと同じアブラナ科で管理準拠。0.45。

---

## ダイコン

| フィールド | 値 |
|---|---|
| name | ダイコン |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases | 大根 |
| preferred_moisture_level | **0.48** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 発芽まで: 乾かさない／以降: 表面乾いたらたっぷり／根肥大期: 水切れ厳禁 |
| watering_notes | 根肥大時に水不足だと根が破裂する。冷涼気候好み。通気性・保水性・排水性のバランスが良い土が理想。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13174/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13174/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4033/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
「根肥大期は水切れ厳禁」「表面乾いたら」でキャベツ（0.45）より若干湿潤。キンカン（0.48）と同水準。

---

## ニンジン

| フィールド | 値 |
|---|---|
| name | ニンジン |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases | 人参 |
| preferred_moisture_level | **0.48** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 発芽まで: 乾燥厳禁でこまめに／発芽後: 表面乾いたら |
| watering_notes | 種は極小で発芽まで水分管理が最重要。ジョウロで優しく散水（勢いよいと種流れる）。土をかけすぎ厳禁（日光不足で発芽しない）。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13544/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13544/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4059/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
発芽期の水分要求は高いが以降は標準管理。ダイコンと同水準の 0.48。

---

## コマツナ

| フィールド | 値 |
|---|---|
| name | コマツナ |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases | 小松菜 |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 発芽まで: 乾かさない／以降: 1日1回、夏は朝夕2回 |
| watering_notes | 種まきから1ヶ月で収穫可能な速成野菜。関東以西は3〜10月が種まき適期。虫よけに不織布かぶせ推奨。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13794/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13794/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4178/ （KINCHO園芸）

### moisture_level 数値化理由
「1日1回、夏は朝夕2回」でダイコン（0.48）より若干湿潤側。バジル（0.50）と同水準の band 3 中央。

---

## ピーマン

| フィールド | 値 |
|---|---|
| name | ピーマン |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 植えつけ後1週間: 毎日たっぷり／以降: 表面乾いたらたっぷり／夏: 朝夕2回も |
| watering_notes | 過湿にも弱く根腐れ注意。4〜6月は1〜3日に1回、7〜8月中旬は1〜4日に1〜2回。高温乾燥期の水切れ注意。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-11292/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-11292/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4079/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
「表面乾いたらたっぷり」の標準管理、過湿にも注意。band 3 中央の 0.50。

---

## パプリカ

| フィールド | 値 |
|---|---|
| name | パプリカ |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases |  |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| watering_amount | moderate |
| watering_pace | 植えつけ直後: 控えめ／株生長後: 表面乾いたらたっぷり／夏は朝夕 |
| watering_notes | 水分をたくさん必要とする。水不足で株勢弱まり実つき悪化。ピーマンより繊細で栽培難易度高い。着色まで長期間必要。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15007/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15007/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/gardeningbeginner/column/2025/04/vol55.html （KINCHO園芸）

### moisture_level 数値化理由
「水分をたくさん必要」でピーマン（0.50）より若干湿潤。レモン（0.55）と同水準。

---

## キュウリ

| フィールド | 値 |
|---|---|
| name | キュウリ |
| plant_category | vegetable |
| growth_form | vine |
| aliases |  |
| preferred_moisture_level | **0.68** |
| moisture_band | 4 |
| watering_amount | moderate |
| watering_pace | 5〜6月: 1日1回／7〜9月中旬: 1日1〜2回／夏場は朝夕2回も |
| watering_notes | 根が浅く広く張り過湿・乾燥ともに弱い。水分と肥料多く必要。不足で実が曲がり大きくならない。排水性・通気性重視。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-10303/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-10303/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4284/ （KINCHO園芸 鉢植え）

### moisture_level 数値化理由
「1日1〜2回」「夏朝夕2回」でカラテア（0.68）と同水準の band 4 中央。

---

## ナス

| フィールド | 値 |
|---|---|
| name | ナス |
| plant_category | vegetable |
| growth_form | herbaceous |
| aliases | 茄子 |
| preferred_moisture_level | **0.72** |
| moisture_band | 4 |
| watering_amount | heavy |
| watering_pace | 5〜6月: 1日1回／7〜9月中旬: 1日1〜2回／夏朝夕2回／梅雨明け以降は水多いほど良い |
| watering_notes | 「ナスは水で作る」と言われるほど水好み。水不足で株弱り花・実つき悪化。株元にワラ・マルチで乾燥対策。高温多湿に強く育てやすい。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13026/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13026/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4053/ （KINCHO園芸 地植え）

### moisture_level 数値化理由
「ナスは水で作る」「梅雨明け以降は水多いほど良い」で野菜の中で最も湿潤志向。アジサイ（0.72）と同水準の band 4 中〜上。

---

## ゴーヤ

> 人間レビュー対応（2026-08-21）でADD_CANDIDATE→採用。緑のカーテン文化で夏の代表野菜。水分要求が高くベランダ・プランター需要も高い。

| フィールド | 値 |
|---|---|
| name | ゴーヤ |
| plant_category | vegetable |
| growth_form | vine |
| parent_id | null |
| aliases | ニガウリ |
| preferred_moisture_level | **0.68** |
| moisture_band | 4 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたらたっぷり（朝の涼しい時間帯に）／真夏は朝夕2回も |
| watering_notes | つる性でグリーンカーテンにも利用される夏野菜。生育旺盛で水切れに弱く、実つきが悪くなる。水は株元へ与え葉にはかけない。プランターは地植えより乾きやすくこまめに確認。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-8656/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-8656/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4056/ （KINCHO園芸 地植え）

### 採用理由
2ソース共に「表面が乾いたらたっぷり」「朝の涼しい時間帯」「真夏は朝夕2回も」で一致。つる性でグリーンカーテン利用が一般的な点も両ソースで確認。

### moisture_level 数値化理由
キュウリ（0.68）と同じウリ科つる性野菜で水分要求・管理パターンがほぼ同一のため同水準の0.68を採用。
