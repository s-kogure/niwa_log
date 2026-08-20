# moisture anchor 植物

`preferred_moisture_level` の数値基準として使用するアンカー植物。  
以降の全カテゴリ調査は、この基準との相対比較で数値を決める。

## 運用ルール

- アンカー植物は 010_seed_plants.sql に優先して追記する
- 以降の調査では「アンカーAより乾燥寄り」「アンカーBとほぼ同等」などの相対比較を根拠に使う
- `is_moisture_anchor: true` は調査ログ専用フラグ。production DB には入れない

---

## band 1（0.05〜0.20）強い乾燥寄り

### サボテン

| フィールド | 値 |
|---|---|
| name | サボテン |
| plant_category | succulent |
| growth_form | other |
| preferred_moisture_level | **0.10** |
| moisture_band | 1 |
| is_moisture_anchor | true |
| anchor_note | 完全乾燥後さらに2〜3日待ってから水やり。band 1 中間の基準。 |
| watering_amount | light |
| watering_pace | 土が完全に乾いてから2〜3日後 |
| watering_notes | 春秋は「すっかり乾いた頃」に少量。夏は「乾いてから少量」。冬は断水に近い。鉢サイズ・栽培環境で大きく変わる。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-5363/ |

#### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-5363/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/garden_support/garden_support-236/ （ハイポネックス 園芸サポート）

#### 採用理由
2ソース共に「完全乾燥後」「水が少ない状況に慣れている」「水のやりすぎは根腐れ」が一致。水やり頻度の目安も「2週間に1回」「1カ月に1回」と一般植物と大きく乖離。

#### moisture_level 数値化理由
「乾いてから2〜3日後に水を与える」という表現が他の植物と明確に異なる。band 1 中間（0.10）を基準値として設定。エケベリア（0.15）との差：春秋はエケベリアの方が早めに水やりするため、サボテンをやや低く。

---

### エケベリア

| フィールド | 値 |
|---|---|
| name | エケベリア |
| plant_category | succulent |
| growth_form | other |
| preferred_moisture_level | **0.15** |
| moisture_band | 1 |
| is_moisture_anchor | true |
| anchor_note | 春秋は「乾いたらすぐ」、夏冬はほぼ断水。band 1 上端の基準。 |
| watering_amount | light |
| watering_pace | 土が乾いたら（生育期）／葉にしわが寄ったら（夏）／2〜4週に1回（冬） |
| watering_notes | 夏は根腐れ・蒸れ防止で控えめ（10日に1回程度）。冬は休眠するため水をほしがらない。生え際への水やりが基本（葉に水がかかると萎れる）。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9156/ |

#### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9156/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5680/ （KINCHO園芸 植物栽培ナビ）

#### 採用理由
2ソース共に春秋「鉢土の表面が乾いたらたっぷり」、夏「10日に1回程度軽く」、冬「2〜4週間に1回」で一致。

#### moisture_level 数値化理由
春秋の「乾いたらすぐ水やり」はサボテンより早め。ただし夏冬の断水管理はサボテンと同様にほぼ不要。年間通算するとサボテン（0.10）より若干湿潤寄りの 0.15 を採用。

---

## band 2（0.21〜0.40）乾燥寄り

### イングリッシュラベンダー

| フィールド | 値 |
|---|---|
| name | イングリッシュラベンダー |
| plant_category | herb |
| growth_form | shrub |
| preferred_moisture_level | **0.20** |
| moisture_band | 2 |
| is_moisture_anchor | true |
| anchor_note | 「しっかり乾いてから」。日本の高温多湿に最も弱いハーブの1つ。band 2 下端の基準。 |
| watering_amount | light |
| watering_pace | 土の表面がしっかりと乾いてから |
| watering_notes | 開花中のみ例外的に「気持ちたっぷりめ」。梅雨・夏は雨の当たらない場所に移動推奨。地植えは根付き後ほぼ降雨任せ。過湿は根腐れ・灰色かび病の原因。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-15070/ |

#### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-15070/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-8858/ （ハイポネックス Plantia）

#### 採用理由
2ソース共に「土の表面がしっかり乾いてからたっぷり」「乾燥を好む」「常に湿った状態は根腐れの原因」が一致。「高温多湿に非常に弱い」記述がローズマリーより強調されている。

#### moisture_level 数値化理由
「しっかり乾いてから」という表現と高温多湿への強い弱さから、band 2 最下端（0.20）に設定。ローズマリー（0.25）より若干低い。

---

### ローズマリー

| フィールド | 値 |
|---|---|
| name | ローズマリー |
| plant_category | herb |
| growth_form | shrub |
| preferred_moisture_level | **0.25** |
| moisture_band | 2 |
| is_moisture_anchor | true |
| anchor_note | 「乾いて2〜3日後」〜「乾いたらたっぷり」。乾燥気味を好むband 2 の代表。 |
| watering_amount | light |
| watering_pace | 土の表面が乾いてから（2〜3日後を目安に） |
| watering_notes | 乾燥ぎみを好む。冬は更に乾かしぎみにする。地植えは根付き後水やり不要。過湿・蒸れに注意。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-100/ |

#### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-100/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4233/ （KINCHO園芸 植物栽培ナビ）

#### 採用理由
ハイポネックスは「土の表面が乾いて2〜3日過ぎた頃にたっぷり」「乾燥ぎみを好む」。KINCHOは「土の表面が乾いたらたっぷり」「過湿を嫌う」「乾燥気味に育てる」。タイミング表現に差があるが、「乾燥を好む」点では一致。

#### moisture_level 数値化理由
ラベンダー（0.20）より若干湿潤寄り。「乾燥を好む」点は同等だが、日本の夏・梅雨耐性がラベンダーよりやや高く、水やりタイミングもKINCHOでは「乾いたらすぐ」の記述もある。0.25 を採用。

---

## band 3（0.41〜0.60）標準

### ゼラニウム

| フィールド | 値 |
|---|---|
| name | ゼラニウム |
| plant_category | flower |
| growth_form | herbaceous |
| preferred_moisture_level | **0.42** |
| moisture_band | 3 |
| is_moisture_anchor | true |
| anchor_note | 「やや乾燥した土を好む」花もの。band 3 下端の基準。バジル（0.50）よりやや乾燥寄り。 |
| watering_amount | moderate |
| watering_pace | 土の表面が乾き始めたら |
| watering_notes | 過湿に弱い。冬は「表面が乾いてから3日ほど置いて」水やり。花に水がかからないよう株元に与える。梅雨は灰色かび病に注意。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-217/ |

#### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-217/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4919/ （KINCHO園芸 植物栽培ナビ）

#### 採用理由
2ソース共に「やや乾燥した土を好む傾向」「過湿に弱い」が一致。「鉢土の表面が乾き始めたら」という表現が「表面が乾いたら」より若干乾燥待ちを示している。

#### moisture_level 数値化理由
「やや乾燥を好む」という記述から band 3 の下端（0.42）に設定。通常の「表面が乾いたら水やり」花もの（band 3 中間）より若干乾燥寄り。バジル（0.50）との差：バジルは「乾燥に弱い」でゼラニウムは「やや乾燥を好む」と逆傾向。

---

### バジル

| フィールド | 値 |
|---|---|
| name | バジル |
| plant_category | herb |
| growth_form | herbaceous |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | true |
| anchor_note | 「表面が乾いたら」「乾燥に弱い」。band 3 中間の基準。 |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたら |
| watering_notes | 乾燥に弱いため水切れ注意。夏の乾燥期は朝夕の水やりが必要なことも。水のやりすぎは根を傷める。午前中の水やり推奨。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-186/ |

#### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-186/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4230/ （KINCHO園芸 植物栽培ナビ）

#### 採用理由
2ソース共に「土の表面が乾いたらたっぷりと」「乾燥に弱い」「水切れ注意」が一致。標準的な「表面が乾いたら」管理に「乾燥に弱い」が加わる点でband 3 中間に位置する。

#### moisture_level 数値化理由
「表面が乾いたら」= band 3 の基本管理。「乾燥に弱い」から band 3 の中間（0.50）を採用。ゼラニウム（0.42）より湿潤寄り、ミント（0.65）より乾燥寄り。

---

## band 4（0.61〜0.80）湿潤寄り

### ミント

| フィールド | 値 |
|---|---|
| name | ミント |
| plant_category | herb |
| growth_form | herbaceous |
| preferred_moisture_level | **0.65** |
| moisture_band | 4 |
| is_moisture_anchor | true |
| anchor_note | 「湿り気のある土を好む」「水切れに注意」。band 4 下端〜中間の基準。 |
| watering_amount | moderate |
| watering_pace | 土の表面が乾いたら（乾燥しはじめたら早めに） |
| watering_notes | 乾燥に弱い。鉢植えは特に水切れ注意。保水性のある土が向く。ただし水のやりすぎは根腐れの原因。地植えは根付き後は自立するが、乾燥が始まったら早めに対応。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-127/ |

#### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-127/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/4231/ （KINCHO園芸 植物栽培ナビ）

#### 採用理由
ハイポネックスは「やや湿り気のある土を好む」「水切れに注意」が明確。KINCHOは地植えでは「根付き後は不要」だが、「乾燥しはじめたら早めに水やり」という鉢植えの方針はハイポネックスと一致。

#### moisture_level 数値化理由
「湿り気のある土を好む」「乾燥しはじめたら早めに」から band 4 に分類。バジル（0.50）より明確に湿潤寄り。アジサイ（0.72）より若干乾燥側で 0.65 を採用。

---

### アジサイ

| フィールド | 値 |
|---|---|
| name | アジサイ |
| plant_category | flower |
| growth_form | shrub |
| preferred_moisture_level | **0.72** |
| moisture_band | 4 |
| is_moisture_anchor | true |
| anchor_note | 「乾燥を苦手」「水切れしやすい」。夏は朝夕2回も。band 4 中間〜上端の基準。 |
| watering_amount | heavy |
| watering_pace | 土の表面が乾いたらすぐ（夏は朝夕2回も） |
| watering_notes | 乾燥を苦手とする。鉢植えは「表面が乾いたら底から流れ出すまでたっぷり」。夏の水切れに特に注意。地植えは乾燥時のみ補水。株元マルチングで乾燥防止効果あり。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-273/ |

#### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-273/ （ハイポネックス 園芸サポート）
2. https://www.hyponex.co.jp/plantia/plantia-8397/ （ハイポネックス Plantia）

#### 採用理由
2ソース共に「乾燥に弱い」「水切れしやすい」「夏は頻繁な水やりが必要」が一致。「朝夕2回の水やりが必要になることも」はミントにはない記述で、より強い湿潤志向を示す。

#### moisture_level 数値化理由
ミント（0.65）より「乾燥を苦手とする」度合いが強く、夏の水やり頻度も高い。band 4 中間〜上端の 0.72 を採用。band 5 には至らない（地植えは乾燥時のみ補水で十分なため）。

---

## band 5（0.81〜1.00）強い湿潤寄り

アンカー植物は設定しない。

初期 seed 対象カテゴリ（herb / foliage / flower / vegetable / fruit / succulent / orchid）の中で、
band 5 に自然に収まる一般流通植物はほぼ存在しないため。

**目安**: 苔類（コケ）がこのbandに相当する。  
調査中に band 5 相当の植物が出てきた場合は、その時点でアンカーを設定する。
