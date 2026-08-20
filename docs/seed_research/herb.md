# herb 調査ログ

調査ルール・記入形式は `_template.md` を参照。

anchor_plants.md を先に確定させてから各植物の数値を記入する。

---

<!-- ここから植物ごとのセクションを追加する -->

進捗メモ：
- [x] アンカー4種（ローズマリー、イングリッシュラベンダー、バジル、ミント）
- [x] タイム、オレガノ、セージ
- [x] コリアンダー、パセリ、フェンネル、ディル
- [x] チャイブ、レモングラス、レモンバーム
- [x] シソ
- [x] カモミール（ジャーマン）
- [ ] ローマンカモミール（要2ソース確認）
- [ ] ラベンダー子分類（フレンチ、ラバンジン、レース）（要調査）
- [ ] マジョラム（要調査）

---

## ローズマリー
※ anchor_plants.md と兼用。

| フィールド | 値 |
|---|---|
| name | ローズマリー |
| plant_category | herb |
| growth_form | shrub |
| parent_id | null |
| aliases | マンネンロウ |
| preferred_moisture_level | 0.25 |
| moisture_band | 2 |
| is_moisture_anchor | true |
| watering_amount | light |
| watering_pace | 土の表面が乾いてから（2〜3日後を目安に） |
| watering_notes | 乾燥ぎみを好む。冬は更に乾かしぎみに。地植えは根付き後水やり不要。過湿・蒸れに注意。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-100/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-100/
2. https://www.kincho-engei.co.jp/cultivation/detail/4233/

---

## ラベンダー（親）
※ 子分類（イングリッシュ・フレンチ・ラバンジン・レース）あり。

| フィールド | 値 |
|---|---|
| name | ラベンダー |
| plant_category | herb |
| growth_form | shrub |
| parent_id | null |
| aliases | |
| preferred_moisture_level | 0.21 |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 土の表面がしっかり乾いてから |
| watering_notes | 高温多湿に弱い。日本の梅雨・夏場は過湿に特に注意。子分類（イングリッシュ・フレンチ・ラバンジン・レース）で管理差があるため、詳しくは子レコードを参照。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15070/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15070/
2. https://www.hyponex.co.jp/plantia/plantia-8858/

---

## イングリッシュラベンダー（子）
※ anchor_plants.md と兼用。

| フィールド | 値 |
|---|---|
| name | イングリッシュラベンダー |
| plant_category | herb |
| growth_form | shrub |
| parent_id | ラベンダー |
| aliases | アングスティフォリア系ラベンダー |
| preferred_moisture_level | 0.20 |
| moisture_band | 2 |
| is_moisture_anchor | true |
| watering_amount | light |
| watering_pace | 土の表面がしっかりと乾いてから |
| watering_notes | 日本の高温多湿に「非常に弱い」。梅雨・台風時は雨の当たらない場所に移動推奨。開花中のみ例外的にやや多め。耐寒性は強い。地植えは根付き後ほぼ降雨任せ。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15070/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15070/
2. https://www.hyponex.co.jp/plantia/plantia-8858/

---

## フレンチラベンダー（子）
※ 要調査（現時点では暫定値）

| フィールド | 値 |
|---|---|
| name | フレンチラベンダー |
| plant_category | herb |
| growth_form | shrub |
| parent_id | ラベンダー |
| aliases | ストエカス系ラベンダー, バタフライラベンダー |
| preferred_moisture_level | 未確定 |
| moisture_band | 2（暫定） |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 未確定 |
| watering_notes | 暑さに比較的強く日本の夏でも育てやすい。耐寒性はイングリッシュより低い。水やり管理はイングリッシュと同程度と推定されるが要確認。 |
| reference_url | 未調査 |

---

## ラバンジン（子）
※ 要調査

| フィールド | 値 |
|---|---|
| name | ラバンジン |
| plant_category | herb |
| growth_form | shrub |
| parent_id | ラベンダー |
| aliases | ラバンダン |
| preferred_moisture_level | 未確定 |
| moisture_band | 2（暫定） |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 未確定 |
| watering_notes | イングリッシュとスパイカのハイブリッド。暑さ・寒さの耐性がバランスよく、日本でも育てやすいとされる。水やり管理は要確認。 |
| reference_url | 未調査 |

---

## レースラベンダー（子）
※ 要調査

| フィールド | 値 |
|---|---|
| name | レースラベンダー |
| plant_category | herb |
| growth_form | shrub |
| parent_id | ラベンダー |
| aliases | ピナータ系ラベンダー |
| preferred_moisture_level | 未確定 |
| moisture_band | 2（暫定） |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 未確定 |
| watering_notes | 暑さに強いが耐寒性が低い（-3℃以下で枯れやすい）。室内管理が冬の基本。水やり管理は要確認。 |
| reference_url | 未調査 |

---

## バジル
※ anchor_plants.md と兼用。

| フィールド | 値 |
|---|---|
| name | バジル |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | スイートバジル |
| preferred_moisture_level | 0.50 |
| moisture_band | 3 |
| is_moisture_anchor | true |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたら |
| watering_notes | 乾燥に弱いため水切れ注意。夏の乾燥期は朝夕の水やりが必要なことも。水のやりすぎは根を傷める。午前中の水やり推奨。1年草（冬に枯れる）。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-186/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-186/
2. https://www.kincho-engei.co.jp/cultivation/detail/4230/

---

## ミント（親）

| フィールド | 値 |
|---|---|
| name | ミント |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | ペパーミント, スペアミント, アップルミント |
| preferred_moisture_level | 0.65 |
| moisture_band | 4 |
| is_moisture_anchor | true |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたら（乾燥しはじめたら早めに） |
| watering_notes | 乾燥に弱い。鉢植えは特に水切れ注意。保水性のある土が向く。地植えは根付き後自立するが、乾燥が始まったら早めに対応。繁殖力が非常に強いため地植えでは根の広がり対策が必要。品種（ペパーミント・スペアミント・アップルミント等）によって管理差は軽微なため、aliases として登録。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-127/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-127/
2. https://www.kincho-engei.co.jp/cultivation/detail/4231/

---

## タイム

| フィールド | 値 |
|---|---|
| name | タイム |
| plant_category | herb |
| growth_form | shrub |
| parent_id | null |
| aliases | タチジャコウソウ |
| preferred_moisture_level | 0.25 |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 土が乾いたら（冬は乾いてから1〜2日後） |
| watering_notes | 乾燥を好む。地植えは根付き後ほぼ水やり不要（乾燥続きのときのみ）。水やりすぎは黄変・根腐れの原因。地表2〜3cmが完全に乾いたら水やりの目安。冬は生育停滞するためやや控えめ。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-18746/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-18746/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/gardeningbeginner/column/2024/03/5-3.html （KINCHO園芸）

### moisture_level 数値化理由
ローズマリー（0.25）と同等の管理。地中海系乾燥ハーブとして同じband 2 に位置。値は 0.25 を採用。

---

## オレガノ

| フィールド | 値 |
|---|---|
| name | オレガノ |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | ハナハッカ |
| preferred_moisture_level | 0.23 |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 土の表面が完全に乾くまで待ってから |
| watering_notes | 「乾燥気味にしたほうが上手に育つ」。地植えは基本水やり不要。ローズマリー・タイムと同様の乾燥系ハーブ。水やりすぎると腐れやすい。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-6577/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-6577/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4226/ （KINCHO園芸）

### moisture_level 数値化理由
「完全に乾くまで待つ」という表現から、ローズマリー（0.25）より若干低い 0.23 を採用。

---

## セージ

| フィールド | 値 |
|---|---|
| name | セージ |
| plant_category | herb |
| growth_form | shrub |
| parent_id | null |
| aliases | コモンセージ, サルビア・オフィキナリス |
| preferred_moisture_level | 0.30 |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 鉢土の表面が乾いたらたっぷり |
| watering_notes | 乾燥を好むが、タイム・ローズマリーより若干湿潤を許容。地植えは根付き後水やりほぼ不要。チェリーセージ等の品種も管理は同様。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-218/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-218/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4228/ （KINCHO園芸）

### moisture_level 数値化理由
「表面が乾いたらたっぷり」とローズマリー・タイムより若干早めのタイミング。ローズマリー（0.25）よりやや湿潤寄りの 0.30 を採用。

---

## コリアンダー

| フィールド | 値 |
|---|---|
| name | コリアンダー |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | パクチー, カメムシソウ |
| preferred_moisture_level | 0.50 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢土の表面が乾いたらたっぷり |
| watering_notes | 水を好む。夏は乾燥しやすいためこまめに。ただし与え過ぎは根腐れの原因。地植えは根付き後も乾かし過ぎないよう管理。直根型で移植を嫌う。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-244/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-244/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4235/ （KINCHO園芸）

### moisture_level 数値化理由
「乾かし過ぎないように」「水を好む」からband 3 中間。バジル（0.50）と同等の 0.50 を採用。

---

## パセリ

| フィールド | 値 |
|---|---|
| name | パセリ |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | オランダゼリ, イタリアンパセリ, カールパセリ |
| preferred_moisture_level | 0.53 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたらたっぷり |
| watering_notes | 乾燥に弱い。夏は水切れに注意し朝夕の涼しい時間に水やり。半日陰を好む（直射日光で葉が固くなる）。イタリアンパセリとカールパセリは管理が同様なため aliases として扱う。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15795/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15795/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4241/ （KINCHO園芸）

### moisture_level 数値化理由
「極端に乾燥させないように」「夏は水切れ注意」からバジル（0.50）よりやや湿潤寄りの 0.53。

---

## フェンネル

| フィールド | 値 |
|---|---|
| name | フェンネル |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | フヌイユ, ウイキョウ |
| preferred_moisture_level | 0.50 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 鉢土の表面が乾いたらたっぷり |
| watering_notes | 夏に乾燥させないよう注意。地植えは根付き後も乾かし過ぎないよう管理。直根性で移植を嫌う（種まき直播き推奨）。草丈が高くなる（1〜2m）。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/4242/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/4242/ （KINCHO園芸）
2. 要2ソース目確認（ハイポネックス）

### moisture_level 数値化理由
コリアンダーと同様の管理。「夏に乾燥させない」「乾かし過ぎないよう」からband 3 中間の 0.50。

---

## ディル

| フィールド | 値 |
|---|---|
| name | ディル |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | イノンド |
| preferred_moisture_level | 0.50 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたらたっぷり |
| watering_notes | フェンネルと同様の管理。直根性で移植を嫌う。乾燥しすぎに注意。草丈が高くなる（60〜100cm）。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-17872/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-17872/ （ハイポネックス Plantia）
2. 要2ソース目確認（KINCHO園芸）

### moisture_level 数値化理由
フェンネルと近い管理。band 3 中間の 0.50 を採用。

---

## チャイブ

| フィールド | 値 |
|---|---|
| name | チャイブ |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | エゾネギ, セイヨウアサツキ |
| preferred_moisture_level | 0.52 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたら株元にたっぷり |
| watering_notes | 夏は乾燥しやすいため回数多め。冬は地上部が枯れるが休眠はせず、乾燥しすぎると枯れる恐れあり。鉢植えは乾きすぎに注意。花も食用可。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-212/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-212/ （ハイポネックス 園芸サポート）
2. 要2ソース目確認（KINCHO園芸等）

### moisture_level 数値化理由
「夏は回数多め」「乾燥しすぎると枯れる」からバジル（0.50）よりやや湿潤寄りの 0.52。

---

## レモングラス

| フィールド | 値 |
|---|---|
| name | レモングラス |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | |
| preferred_moisture_level | 0.35 |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 鉢土の表面が乾いたらたっぷり（地植えは根付き後不要） |
| watering_notes | 根付いた後は比較的乾燥に強い。葉が丸まってきたら水不足のサイン。地植えは根付き後ほぼ降雨任せ。春の水やりすぎは根腐れの原因。熱帯性植物のため冬は鉢植えで室内管理が基本。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/4120/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/4120/ （KINCHO園芸）
2. https://www.kincho-engei.co.jp/gardeningbeginner/column/2024/07/post-12.html （KINCHO園芸 コラム）

### moisture_level 数値化理由
「根付いたら不要」という地植え表現はローズマリー・タイムと同様。熱帯原産で若干乾燥に弱い面もあることから、乾燥系ハーブより若干高い 0.35（band 2 上端）を採用。

---

## レモンバーム

| フィールド | 値 |
|---|---|
| name | レモンバーム |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | メリッサ, コウスイハッカ |
| preferred_moisture_level | 0.60 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 1日1回たっぷり（鉢底からあふれるくらい） |
| watering_notes | 乾燥すると葉が黄色く変色・しおれる。鉢植えは「1日1回たっぷり」が目安。地植えは乾燥した日が続いたら。耐寒性が強く（多年草）、冬は地上部が枯れるが根は生きている。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-16447/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-16447/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-4921/ （ハイポネックス Plantia・ハーブの彩第10回）

### moisture_level 数値化理由
「1日1回たっぷり」という高頻度と「乾燥すると葉が黄変」からband 3上端〜4下端。ミント（0.65）よりやや乾燥寄り、バジル（0.50）よりは湿潤寄り。0.60 を採用。

---

## カモミール（親）

| フィールド | 値 |
|---|---|
| name | カモミール |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | カミツレ |
| preferred_moisture_level | 0.55 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたら |
| watering_notes | 子分類（ジャーマン・ローマン）で一年草/多年草の差あり。詳しくは各子レコードを参照。高温多湿に弱い（夏越しの管理に注意）。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-5108/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-5108/
2. https://www.hyponex.co.jp/garden_support/garden_support-225/

---

## ジャーマンカモミール（子）

| フィールド | 値 |
|---|---|
| name | ジャーマンカモミール |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | カモミール |
| aliases | |
| preferred_moisture_level | 0.58 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたら（地植えは乾燥しはじめたら早めに） |
| watering_notes | 「やや湿り気のある土を好む」「水切れに注意」。高温多湿には弱い。一年草（こぼれ種で自然に増える）。土の乾燥にも弱いため乾かし過ぎに注意。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-225/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-225/ （ハイポネックス 園芸サポート）
2. https://www.hyponex.co.jp/plantia/plantia-5108/ （ハイポネックス Plantia）

### moisture_level 数値化理由
「やや湿り気のある土を好む」「水切れ注意」からミント（0.65）より乾燥寄り、バジル（0.50）より湿潤寄りの 0.58。

---

## ローマンカモミール（子）
※ 要追加調査

| フィールド | 値 |
|---|---|
| name | ローマンカモミール |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | カモミール |
| aliases | |
| preferred_moisture_level | 未確定（0.50〜0.55 の範囲と推定） |
| moisture_band | 3（暫定） |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_notes | 多年草。夏の高温多湿に弱い（ジャーマンより夏越しが難しいとも言われる）。グラウンドカバー的な使い方も可。要2ソース確認。 |
| reference_url | 未調査 |

### 要確認事項
- ジャーマンとの水やり差を具体的に確認する
- 乾燥耐性の差（ジャーマンより乾燥に強いとも言われる）を複数ソースで確認

---

## シソ

| フィールド | 値 |
|---|---|
| name | シソ |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | 大葉, 紫蘇, アオジソ |
| preferred_moisture_level | 0.55 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾きかけているのを確認したらたっぷり |
| watering_notes | 夏の乾燥期は特に注意。敷き藁や腐葉土でマルチングして乾燥防止も有効。葉水も効果的（害虫防止にも）。ホースの強い水流は株を傷めるためジョウロで株元に。1年草。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-8747/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-8747/ （ハイポネックス Plantia）
2. 要2ソース目確認（KINCHO園芸等）

### moisture_level 数値化理由
「乾きかけたらたっぷり」「夏の乾燥注意」からband 3 中間〜上端。バジル（0.50）より若干湿潤寄りの 0.55。

---

## マジョラム
※ 要調査

| フィールド | 値 |
|---|---|
| name | マジョラム |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | スイートマジョラム, マヨラナ |
| preferred_moisture_level | 未確定（0.25〜0.30 の範囲と推定） |
| moisture_band | 2（暫定） |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_notes | オレガノと同じシソ科で栽培管理が近い。乾燥を好む地中海系ハーブ。要2ソース確認。 |
| reference_url | 未調査 |
