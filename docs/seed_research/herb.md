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
- [x] ローマンカモミール（要2ソース確認）
- [x] ラベンダー子分類（フレンチ、ラバンジン、レース）（要調査）
- [x] マジョラム（要調査）

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

| フィールド | 値 |
|---|---|
| name | フレンチラベンダー |
| plant_category | herb |
| growth_form | shrub |
| parent_id | ラベンダー |
| aliases | ストエカス系ラベンダー, バタフライラベンダー |
| preferred_moisture_level | **0.22** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 鉢: 表面が乾いたらたっぷり／夏は蒸れ防止で控えめ |
| watering_notes | ストエカス系。イングリッシュより耐暑性が高く日本の夏でも育てやすいが、耐寒性はやや低い（-5℃程度）。過湿を嫌う点は他ラベンダーと共通。冬は鉢管理で必要に応じ室内へ。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-114/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-114/ （ハイポネックス 園芸サポート ラベンダー類）
2. https://www.hyponex.co.jp/plantia/plantia-8858/ （ハイポネックス Plantia）

### moisture_level 数値化理由
イングリッシュ（0.20）より梅雨・夏の管理が楽（耐暑性強い）ため、若干湿潤側の 0.22。一般ラベンダー（親レコード 0.21）と近い水準。band 2 下端。

---

## ラバンジン（子）

| フィールド | 値 |
|---|---|
| name | ラバンジン |
| plant_category | herb |
| growth_form | shrub |
| parent_id | ラベンダー |
| aliases | ラバンダン, ラバンディン |
| preferred_moisture_level | **0.23** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 鉢: 表面が乾いたらたっぷり／夏は控えめ |
| watering_notes | イングリッシュとスパイカ（スパイクラベンダー）の交雑種。耐暑性・耐寒性ともにバランスがよく、日本の暖地でも栽培可能。過湿を嫌う点は共通。多肥不要。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/5013/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/5013/ （KINCHO園芸 植物栽培ナビ ラベンダー）
2. https://www.hyponex.co.jp/garden_support/garden_support-114/ （ハイポネックス 園芸サポート ラベンダー類）

### moisture_level 数値化理由
イングリッシュ（0.20）とフレンチ（0.22）の中間で耐暑性・耐寒性ともに強い。一般ラベンダー（親 0.21）とほぼ同水準。0.23 を採用。

---

## レースラベンダー（子）

| フィールド | 値 |
|---|---|
| name | レースラベンダー |
| plant_category | herb |
| growth_form | shrub |
| parent_id | ラベンダー |
| aliases | ピナータ系ラベンダー |
| preferred_moisture_level | **0.22** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 鉢: 表面が乾いたらたっぷり／長雨は避ける |
| watering_notes | ピナータ系。耐暑性は比較的あるが耐寒性が低く（-3℃以下で枯れやすい）冬は室内管理が基本。過湿に弱いため長雨を避けられる場所を選ぶ。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-8858/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-8858/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/garden_support/garden_support-114/ （ハイポネックス 園芸サポート ラベンダー類）

### moisture_level 数値化理由
フレンチ（0.22）と同水準。耐暑性の程度がフレンチと近く、水やり管理も同じ「表面が乾いたら」。0.22 を採用。

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
2. https://www.hyponex.co.jp/garden_support/garden_support-170/ （ハイポネックス 園芸サポート）

### 採用理由
2ソース共に「鉢植えは表面が乾いたらたっぷり」「庭植えは夏の乾燥時のみ補水」「直根性で移植嫌う」「多年草」で一致。ハイポネックスは特に「水はけの良い土を好む」を明示。

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
2. https://www.shuminoengei.jp/m-pc/a-page_p_detail/target_plant_code-549/target_tab-2 （NHK 趣味の園芸 植物図鑑）

### 採用理由
2ソース共に「過湿嫌う」「表面乾いたらたっぷり」「発芽まで乾かさない」「直根性で移植嫌う」「秋植えおすすめ」で一致。NHKでは特に草丈が伸びると倒れやすくなるため支柱推奨。

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
2. https://www.kincho-engei.co.jp/cultivation/detail/4040/ （KINCHO園芸 地植え）

### 採用理由
Hyponex は「表面乾いたら株元にたっぷり」「夏は回数多め」で、若干湿潤寄りの管理。KINCHO は「植えつけ後は葉が萎れてから水やり」「保水力ある培養土」で、乾き気味の記述。両ソース共に「冬地上部枯れるが休眠せず、乾燥しすぎると枯れる」で一致。ソース間で水やり頻度の記述に差があるため、両者の中間となる標準〜やや湿潤寄りを採用。

### moisture_level 数値化理由
「夏は回数多め」「乾燥しすぎると枯れる」からバジル（0.50）よりやや湿潤寄りの 0.52。KINCHOの乾かし気味の記述も踏まえて band 3 中央付近を維持。

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

| フィールド | 値 |
|---|---|
| name | ローマンカモミール |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | カモミール |
| aliases | |
| preferred_moisture_level | **0.52** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたら／庭植えは基本降雨任せ／夏は朝夕の涼しい時間帯 |
| watering_notes | 多年草で寒さに強く踏まれても育つほど丈夫。地上部が枯れても翌年再び芽吹く。夏の高温多湿に弱くプランターは午後の日差しを避ける場所へ。グラウンドカバーとしても利用可。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-5108/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-5108/ （ハイポネックス Plantia カモミールの育て方）
2. https://www.kincho-engei.co.jp/cultivation/detail/3950/ （KINCHO園芸 植物栽培ナビ カモミール地植え）

### moisture_level 数値化理由
ジャーマン（0.58）より若干乾燥寄り。多年草で丈夫、乾燥耐性がジャーマンより高いとの記述と合致。ただし基本管理は「表面が乾いたら」で band 3 中央〜下。0.52 を採用。

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
2. https://sakata-tsushin.com/lesson-vegetable/detail_192/ （サカタのタネ 園芸通信）

### 採用理由（2ソース目追加）
サカタのタネも「水切れしないようたっぷり」「畑は基本雨任せ、日照り時は早朝夕方に補水」「乾燥に弱いためマルチング推奨」を明記。ハイポネックスの記述と一致。

### moisture_level 数値化理由
「乾きかけたらたっぷり」「夏の乾燥注意」からband 3 中間〜上端。バジル（0.50）より若干湿潤寄りの 0.55。

---

## マジョラム

| フィールド | 値 |
|---|---|
| name | マジョラム |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | スイートマジョラム, マヨラナ |
| preferred_moisture_level | **0.27** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 表面が乾いてからたっぷり／過湿は根腐れの原因 |
| watering_notes | 地中海原産のシソ科多年草。オレガノと近縁だが耐寒性が低く（霜×）、11月頃までに鉢上げして軒下等で越冬させる。高温多湿を苦手とするため風通し重視。 |
| reference_url | https://horti.jp/14550 |

### 参照URL
1. https://horti.jp/14550 （HORTI by GreenSnap）
2. https://www.shuminoengei.jp/m-pc/a-page_p_detail/target_plant_code-543/target_tab-2 （NHK 趣味の園芸）

### 採用理由
2ソース共に「土の表面が乾いてからたっぷり」「過湿で根腐れ」「霜に弱い」「風通し重視」で一致。オレガノ（0.23）と比較すると耐寒性が明らかに低く、より繊細な管理が必要。

### moisture_level 数値化理由
オレガノ（0.23）と同じ「乾燥気味を好む」志向だが、水やり間隔がオレガノよりわずかに短い傾向（土が乾いたらすぐ）。band 2 中央の 0.27 を採用。

---

## レモンバーベナ

| フィールド | 値 |
|---|---|
| name | レモンバーベナ |
| plant_category | herb |
| growth_form | shrub |
| parent_id | null |
| aliases | ボウシュウボク, コウスイボク |
| preferred_moisture_level | **0.28** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 鉢: 表面が乾いたのを確認してから／地植え: 基本不要／冬はさらに控えめ |
| watering_notes | クマツヅラ科の落葉低木。乾燥した環境が適し、水やり過ぎは枯死の原因。寒さに弱く、地植えできるのは冬の寒さが厳しくない地域のみ。5〜9月に月1回の液肥。 |
| reference_url | https://magazine.cainz.com/article/111888 |

### 参照URL
1. https://magazine.cainz.com/article/111888 （となりのカインズさん）
2. https://horti.jp/8364 （HORTI by GreenSnap）

### 採用理由
2ソース共に「乾燥した場所が最適」「水やりすぎで枯死」「地植えは水やり不要」「冬は乾燥気味でも大丈夫」で一致。寒さに弱いという特性も両ソースで確認。

### moisture_level 数値化理由
「乾燥した環境が最適」「地植え不要」で band 2 中央。マジョラム（0.27）・千日紅（0.28）と同水準。ローズマリー（0.25）より若干湿潤側。

---

## ステビア（初期seedから除外）

> Issue #7 再レビュー対応（2026-08-21）で除外。
> 2ソース目として採用していた https://plantlounge.jp/stevia-cultivation/ は運営者プロフィールで
> 個人運営の「ブログ」と明記されており、Issue #6 の採用ルール（個人ブログ・SNS・匿名投稿等は
> 初期seedの根拠として使用しない）に抵触するため、独立した2ソース目が確保できなかった。
> 個人ブログを参照しないと根拠を補強できない植物は、園芸メーカー・種苗会社・大手ホームセンター等での
> 情報量が相対的に少ないことを示すため、初期seedとしての優先度を見直し、010_seed_plants.sql から
> レコードを削除した（人間判断）。将来、有効な2ソース目が確保できた場合に再検討する。

以下は削除前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | ステビア |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | アマハステビア |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 表面が乾いたら鉢底から流れるまでたっぷり（メリハリつけて）／冬: 乾いて2〜3日後 |
| watering_notes | キク科の多年草で天然甘味料としても利用可能。極端な乾燥に弱い一方、常時湿状態は根腐れの原因。夏は涼しい場所、冬は暖かい場所へ移動推奨。冬季に地上部が枯れても根は生きている。 |
| reference_url | https://yasashi.info/su_00010g.htm |

### 参照URL
1. https://yasashi.info/su_00010g.htm （ヤサシイエンゲイ）
2. https://plantlounge.jp/stevia-cultivation/ （Plant Lounge、個人ブログ — 2ソース目として無効）

### moisture_level 数値化理由（参考）
「湿り気ある土を好むが過湿NG」の標準管理はバジル（0.50）と同水準と推定していた（band 3 中央）。ただし独立2ソース目未確保のため確定値としては採用しない。

---

## チャービル

| フィールド | 値 |
|---|---|
| name | チャービル |
| plant_category | herb |
| growth_form | herbaceous |
| parent_id | null |
| aliases | セルフィーユ, フレンチパセリ, ウイキョウゼリ |
| preferred_moisture_level | **0.60** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | こまめに、土が乾くことのないようたっぷり |
| watering_notes | セリ科一年草。乾燥に弱く湿り気のある土壌を好む。夏場は半日陰、冬は日当たり良好で。直射日光と湿気を嫌うため風通し確保が重要。花茎が伸びたらすぐ摘み取ることで長期収穫可能。 |
| reference_url | https://greensnap.jp/category1/herb/botany/308/growth |

### 参照URL
1. https://greensnap.jp/category1/herb/botany/308/growth （GreenSnap）
2. https://magazine.cainz.com/article/118508 （となりのカインズさん）

### 採用理由
2ソース共に「乾燥に弱い」「湿り気のある土壌を好む」「水持ちの良い用土」「風通し良好」で一致。パセリ（0.53）とセリ科の近縁だがより湿度志向。

### moisture_level 数値化理由
「乾燥に弱い」「土が乾くことのないよう」でパセリ（0.53）より湿潤側。band 3 上端の 0.60。ヒマワリ・インパチェンス・サツキと同水準。
