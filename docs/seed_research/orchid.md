# orchid 調査ログ

調査ルール・記入形式は `_template.md` を参照。
anchor_plants.md を確認して moisture_level の相対位置を把握してから読むこと。

---

## 胡蝶蘭

| フィールド | 値 |
|---|---|
| name | 胡蝶蘭 |
| plant_category | orchid |
| growth_form | other |
| parent_id | null |
| aliases | コチョウラン, ファレノプシス |
| preferred_moisture_level | 0.55 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 植え込み材料の表面が乾いて湿り気を感じなくなったら（水苔：春秋10〜14日に1回、夏週1回、冬月1回） |
| watering_notes | 熱帯着生ランのため高湿度を好むが、根は「乾いてから」が鉄則。水苔とバークで頻度が異なる（バーク：春秋1〜10日、夏4〜5日、冬2〜3週）。鉢底水は必ず捨てる。葉付け根の水は拭き取る（カビ予防）。冬はぬるま湯を使う。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9667/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9667/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/garden_support/garden_support-245/ （ハイポネックス 園芸サポート）

### 採用理由
2ソース共に「表面が乾いてから」「気温が高い生長期は多め、低温期は控えめ」が一致。水苔植えで春秋10〜14日に1回というのは一般草花よりかなり長い間隔。

### moisture_level 数値化理由
着生ランで「高温多湿地帯の木に着生」という特性から湿潤志向だが、管理上は「乾いてから」でband 3上端（0.55）。バジル（0.50）より若干湿潤、ミント（0.65）よりは乾燥寄り。

---

## シンビジウム

| フィールド | 値 |
|---|---|
| name | シンビジウム |
| plant_category | orchid |
| growth_form | other |
| parent_id | null |
| aliases | |
| preferred_moisture_level | 0.52 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたらたっぷり（秋冬は週1〜2回） |
| watering_notes | 春〜秋は「表面が乾いたらたっぷり」の標準管理。秋冬は週1〜2回に固定。つぼみが出てきたら回数を増やす。冬以外はたっぷり水やりを継続。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-227/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-227/ （ハイポネックス 園芸サポート）
2. https://www.hyponex.co.jp/plantia/plantia-7621/ （ハイポネックス Plantia・洋ラン全般記事）

### 採用理由
「冬以外はたっぷり」「表面が乾いたらたっぷり」が2ソースで一致。秋冬でも週1〜2回と完全断水はしない。

### moisture_level 数値化理由
「表面が乾いたらたっぷり」のband 3 標準管理。胡蝶蘭（0.55）より若干乾燥寄り、バジル（0.50）と同程度の 0.52。

---

## デンドロビウム

| フィールド | 値 |
|---|---|
| name | デンドロビウム |
| plant_category | orchid |
| growth_form | other |
| parent_id | null |
| aliases | |
| preferred_moisture_level | 0.38 |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 植え込み材料が乾くまで待つ（10月以降は控えめ） |
| watering_notes | 多湿を嫌う。「植え込み材料が乾くまで待ってから与える」が鉄則。10月以降の水やりは控えめにして新芽の充実を促す。鉢皿の水は毎回捨てる。室内では葉水で乾燥を補う。 |
| reference_url | https://www.hyponex.co.jp/plantia/study/6473 |

### 参照URL
1. https://www.hyponex.co.jp/plantia/study/6473 （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-7621/ （ハイポネックス Plantia・洋ラン全般記事）

### 採用理由
「多湿を嫌う」「植え込み材料が乾くまで待つ」が2ソースで一致。洋ランの中では乾燥気味管理が必要な品種。秋冬の控えめ管理も共通。

### moisture_level 数値化理由
「多湿を嫌う」「乾くまで待つ」からband 2。ローズマリー（0.25）よりは若干湿潤寄り、カトレア（0.22）より湿潤。0.38（band 2 上端）を採用。

---

## カトレア

| フィールド | 値 |
|---|---|
| name | カトレア |
| plant_category | orchid |
| growth_form | other |
| parent_id | null |
| aliases | |
| preferred_moisture_level | 0.22 |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 植え込み材料の中心部が完全に乾いてから（冬は乾いても2〜3日待つ） |
| watering_notes | 洋ランの中でも特に乾燥を好む。「中心部が完全に乾いたのを確認してから」が基本。冬・花後は「表面が乾いても2〜3日待ってから軽く」。CAM型光合成のため夕方の水やりが効果的。受け皿の水は毎回廃棄。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/4862/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/4862/ （KINCHO園芸 植物栽培ナビ）
2. https://www.hyponex.co.jp/garden_support/garden_support-260/ （ハイポネックス 園芸サポート カトレア）

### 採用理由
2ソース（独立サイト）共に「春〜秋始めはたっぷり、秋終〜冬は乾燥気味」で一致。KINCHOは「中心部が完全に乾いてから」「冬は2〜3日待つ」を明示。Hyponex は「雨季と乾季が存在する熱帯・亜熱帯原産のため季節メリハリが必要」と説明。両ソースが洋ランの中で最も乾燥管理が必要な種の一つと位置付けている点で一致。

### moisture_level 数値化理由
「完全に乾いてから」かつ「さらに2〜3日待つ」という表現はイングリッシュラベンダー（0.20）と同等かやや乾燥寄り。band 2 下端の 0.22 を採用。洋ランの中で最も低い値。

---

## オンシジウム

| フィールド | 値 |
|---|---|
| name | オンシジウム |
| plant_category | orchid |
| growth_form | other |
| parent_id | null |
| aliases | |
| preferred_moisture_level | 0.48 |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたらたっぷりと（年間通じて） |
| watering_notes | 年間を通じて「表面が乾いたらたっぷり」の標準管理。特に夏場は乾燥しやすいため水枯れに注意。葉に縦方向のシワが寄ったら水不足のサイン。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-16019/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-16019/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-7621/ （ハイポネックス Plantia・洋ラン全般記事）

### 採用理由
「年間通じて土の表面が乾いたらたっぷり」が明確。夏の水切れ注意という点もバジル・コリアンダーと類似した管理。

### moisture_level 数値化理由
「表面が乾いたらたっぷり」のband 3 管理。カトレア・デンドロビウムより湿潤寄り、シンビジウムより若干乾燥寄り。0.48（band 3 下端）を採用。
