# foliage 調査ログ

調査ルール・記入形式は `_template.md` を参照。

観葉植物は「土が乾いたら」を基本とするものが多いが、乾燥寄り（band 2）〜湿潤寄り（band 4）まで分布する。
アンカー相対比較の主要基準:
- サボテン 0.10 / エケベリア 0.15（band 1）
- ローズマリー 0.25（band 2 乾燥好み）
- バジル 0.50（band 3 中央）
- アジサイ 0.72（band 4 乾燥に極めて弱い）

初期 seed 対象: 親 16件（子分類は現時点で作成しない方針）
※ 人間レビュー対応（2026-08-21）でペペロミア・ハートカズラ・フィカスベンジャミナ・アグラオネマ・
　クワズイモ・クロトン・コルジリネ・アレカヤシ・ネフロレピス・マランタをDROP、ゴムノキをADD（25→16件）。
　件数目安（25〜30件）は必達条件ではなく、niwa.logでの水やり支援価値を優先した結果。

---

## ザミオクルカス

| フィールド | 値 |
|---|---|
| name | ザミオクルカス |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases | ザミオクルカス・ザミーフォリア, ZZプラント |
| preferred_moisture_level | **0.20** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 2〜3週に1回（鉢土が完全に乾いてから）／冬はさらに控えめ |
| watering_notes | 東アフリカ乾燥地帯原産のサトイモ科多年草。地中に塊茎を持ち水分を蓄えるため水やりを忘れても枯れにくい。耐陰性が非常に強い。最低10℃以上をキープ。 |
| reference_url | https://andplants.jp/blogs/magazine/zamioculcas |

### 参照URL
1. https://andplants.jp/blogs/magazine/zamioculcas （AND PLANTS）
2. https://www.saisyokukenbi.jp/c/howtoraise/h_zamiokurukasu_zami-foria （彩植健美）

### moisture_level 数値化理由
2〜3週に1回の水やり頻度は band 2 の中でも極端に少ない。エケベリア（0.15）ほどではないが、他の観葉と一線を画する乾燥志向。band 2 最下端の 0.20 を採用。

---

## サンスベリア

| フィールド | 値 |
|---|---|
| name | サンスベリア |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases | サンセベリア, トラノオ |
| preferred_moisture_level | **0.22** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 春秋: 表面が乾いて2〜3日後／夏: 表面乾いたら株元に／冬: 月1回 |
| watering_notes | 葉に水分を蓄えるため乾燥に強い。過湿による根腐れが最大のリスク。風通し重視。冬は休眠期のためほぼ断水。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-6915/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-6915/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4897/ （KINCHO園芸）

### moisture_level 数値化理由
「乾燥に強い、過湿に弱い」で ZZ（0.20）に近いが、冬月1回・生育期は表面乾いたらの管理で若干湿潤寄り。0.22 を採用。

---

## ペペロミア（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 初期seed必須とは判断せず。利用要望があれば追加検討（人間レビューコメントより）。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | ペペロミア |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.25** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 表面が乾いてから数日あけて／冬は特に控えめ |
| watering_notes | 葉や茎に水分を保有するため水やりは控えめ。定期的な葉水は推奨。明るい日陰を好み耐陰性あり。最低10℃キープ。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14478/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14478/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5307/ （KINCHO園芸）

### moisture_level 数値化理由
「葉に水分を保有」「乾燥に耐性」でサンスベリア（0.22）に近いが、葉水頻度が高めで湿度は好む。0.25 を採用。ローズマリー（0.25）と同水準。

---

## ハートカズラ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> MVP初期seedではより利用需要の高い観葉植物を優先し、人間レビューによりDROPとなった。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | ハートカズラ |
| plant_category | foliage |
| growth_form | vine |
| parent_id | null |
| aliases | ラブチェーン, セロペギア・ウッディ |
| preferred_moisture_level | **0.27** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 土の表面が乾いて完全に乾燥してから／葉水はこまめに |
| watering_notes | 半多肉性のつる植物。厚い葉に水分を蓄えるため水やりは控えめが基本。過湿は根腐れの原因。ハンギング向き。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-7214/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-7214/ （ハイポネックス Plantia 観葉植物管理方法）
2. https://www.kincho-engei.co.jp/cultivation/detail/5690/ （KINCHO園芸 セロペギア）

### moisture_level 数値化理由
半多肉性で「土が完全乾燥してから」の水やり管理は band 2 の中央。マジョラム（0.27）と同水準。

---

## ホヤ

| フィールド | 値 |
|---|---|
| name | ホヤ |
| plant_category | foliage |
| growth_form | vine |
| parent_id | null |
| aliases | サクララン |
| preferred_moisture_level | **0.28** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 表面が乾いてから／年間通してやや乾かし気味 |
| watering_notes | 過湿による根腐れが枯死の最大要因。葉水で空中湿度を保つ。花を咲かせるにはつるを長く伸ばして日照確保が必要。 |
| reference_url | https://www.hyponex.co.jp/plantia/22725/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/22725/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5313/ （KINCHO園芸）

### moisture_level 数値化理由
「年間通してやや乾かし気味」でハートカズラ（0.27）とほぼ同水準。葉水推奨で若干湿潤寄りの 0.28。

---

## ドラセナ

| フィールド | 値 |
|---|---|
| name | ドラセナ |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases | 幸福の木, マッサン |
| preferred_moisture_level | **0.30** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 春: 表面乾いたら／夏: 毎日／冬: 土が乾いて2〜3日後 |
| watering_notes | 乾燥に強くやや乾燥気味を好む。土の表面が白くなってから水やりが目安。直射日光は葉焼けの原因。2年に1回植え替え。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-7119/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-7119/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5273/ （KINCHO園芸 ドラセナ・フラグランス）

### moisture_level 数値化理由
「乾燥に強い、やや乾燥気味」でホヤ（0.28）よりやや湿潤側。ただし夏は毎日水やりが必要で band 2 中央〜上。0.30 を採用。セージ（0.30）と同水準。

---

## ガジュマル

| フィールド | 値 |
|---|---|
| name | ガジュマル |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.35** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 春秋: 表面乾いたらたっぷり／冬: 表面乾燥から2〜3日後 |
| watering_notes | 幸せを呼ぶ木として人気。丈夫で育てやすく初心者向け。夏の直射日光は葉焼けの原因。冬は5℃以上をキープ。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-6900/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-6900/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-9552/ （ハイポネックス Plantia 寒さに強い観葉18選）

### moisture_level 数値化理由
「表面乾いたらたっぷり」は band 3 寄りだが、冬の管理が明確に乾燥志向。ドラセナ（0.30）より若干湿潤側の 0.35。band 2 上端。

---

## パキラ

| フィールド | 値 |
|---|---|
| name | パキラ |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases | 発財樹 |
| preferred_moisture_level | **0.35** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | light |
| watering_pace | 春夏: 表面乾いたら鉢底から流れるまで／秋冬: 土中が乾いて2〜3日後 |
| watering_notes | 枯れる原因の多くは水のやりすぎ。受け皿の水は必ず捨てる。耐陰性あるが日光不足だと弱る。葉水推奨。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-6975/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-6975/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5102/ （KINCHO園芸）

### moisture_level 数値化理由
ガジュマル（0.35）とほぼ同じ管理（表面乾いたら + 秋冬2〜3日後）。「水やりすぎで枯れる」の警告が両ソースで共通。0.35 を採用。

---

## アイビー

| フィールド | 値 |
|---|---|
| name | アイビー |
| plant_category | foliage |
| growth_form | vine |
| parent_id | null |
| aliases | ヘデラ |
| preferred_moisture_level | **0.40** |
| moisture_band | 2 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面乾いたらたっぷり／冬: 控えめ／地植えは基本不要 |
| watering_notes | 非常に丈夫で初心者向け。耐陰性強く北側でも育つが徒長・斑消失に注意。斑入りは強日照で葉焼け。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-276/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-276/ （ハイポネックス 園芸サポート）
2. https://www.hyponex.co.jp/plantia/plantia-7332/ （ハイポネックス Plantia）

### moisture_level 数値化理由
「表面乾いたらたっぷり」の標準管理。他の乾燥寄り観葉（ドラセナ・パキラ）より生育期は水を好むが、地植えは基本不要という乾燥耐性もある。band 2 最上端の 0.40 を採用。

---

## ポトス

| フィールド | 値 |
|---|---|
| name | ポトス |
| plant_category | foliage |
| growth_form | vine |
| parent_id | null |
| aliases | ゴールデンポトス, エピプレナム |
| preferred_moisture_level | **0.45** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 冬以外: 表面乾いたら鉢底から流れるまで／冬: 乾かし気味 |
| watering_notes | 初心者向けの代表格。耐陰性ありだが日照不足で斑が消える。夏は早朝か夕方に水やり。年間通じて葉水推奨。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14463/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14463/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/4993/ （KINCHO園芸）

### moisture_level 数値化理由
「表面が乾いたら」の標準管理で band 3 下端。冬は明確に乾かし気味なため、band 3 中央（0.50）より若干乾燥寄りの 0.45。

---

## シェフレラ

| フィールド | 値 |
|---|---|
| name | シェフレラ |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases | カポック, ホンコンカポック |
| preferred_moisture_level | **0.45** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春夏: 表面乾いたら鉢底から流れるまで／秋冬: 表面乾いて2〜3日後 |
| watering_notes | 日当たり・温度・湿度をあまり選ばず育てやすい代表種。毎日水をやると根腐れの原因。40℃超の直射日光は避ける。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14376/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14376/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-20516/ （ハイポネックス Plantia 乾燥に強い植物12選）

### moisture_level 数値化理由
「表面乾いたら」で band 3 下端。ポトス（0.45）と同水準。秋冬の「2〜3日後」の待ち時間からやや乾燥寄り。

---

## オリヅルラン

| フィールド | 値 |
|---|---|
| name | オリヅルラン |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases | 折鶴蘭 |
| preferred_moisture_level | **0.45** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 表面乾いてからたっぷり／冬: 表面乾燥から3日後 |
| watering_notes | 耐寒性が観葉としては強く（5℃）、関東以西は屋外越冬可。明るい日陰〜遮光下を好む。日照不足で徒長。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14389/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14389/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-9552/ （ハイポネックス Plantia 寒さに強い観葉18選）

### moisture_level 数値化理由
「表面乾いてから」でポトス（0.45）と同じ管理感。冬の待ち時間もほぼ同等。0.45 を採用。

---

## モンステラ

| フィールド | 値 |
|---|---|
| name | モンステラ |
| plant_category | foliage |
| growth_form | vine |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 冬以外: 表面乾いたら鉢底から流れるまで／冬: 乾かし気味 |
| watering_notes | 高温多湿に強い。夏は早朝の水やりが基本。直射日光は葉焼け、レースカーテン越しが理想。ハダニ予防に葉水こまめに。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-11257/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-11257/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5003/ （KINCHO園芸）

### moisture_level 数値化理由
「表面乾いたらたっぷり」の標準管理で band 3 中央（0.50）。バジル（0.50）と同水準。

---

## フィカス・ウンベラータ

| フィールド | 値 |
|---|---|
| name | フィカス・ウンベラータ |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases | ウンベラータ |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面乾いたらたっぷり／夏: 水切れ注意／冬: 乾かし気味 |
| watering_notes | 成長が早く 1〜2年に1回植え替え必須。18〜30℃で最も成長。カーテン越しの窓辺が理想。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-16978/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-16978/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5293/ （KINCHO園芸）

### moisture_level 数値化理由
モンステラと同じ標準管理。夏「水切れ注意」が明示的で band 3 中央（0.50）。

---

## フィカス・ベンジャミナ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> フィカス属は一旦フィカス・ウンベラータのみを初期seedの代表とする方針となり、人間レビューによりDROPとなった（将来的な追加を否定するものではない）。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | フィカス・ベンジャミナ |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases | ベンジャミン, ベンジャミンゴム |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面乾いたらたっぷり／冬: 乾かし気味 |
| watering_notes | 環境変化に敏感で葉を落としやすい。設置場所は固定推奨。耐寒性弱く冬は室内。定期的な葉水推奨。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-13750/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-13750/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5111/ （KINCHO園芸）

### moisture_level 数値化理由
ウンベラータと同じ標準管理。0.50。

---

## アグラオネマ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> MVP初期seedではより利用需要の高い観葉植物を優先し、人間レビューによりDROPとなった。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | アグラオネマ |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面乾いたらたっぷり／冬: 乾き気味＋軽く霧吹き |
| watering_notes | 高温多湿を好むが常時湿った状態はNG（少し乾き始めてからたっぷり）。耐陰性強い。葉水推奨。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-20273/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-20273/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5198/ （KINCHO園芸）

### moisture_level 数値化理由
「表面乾いたらたっぷり」で標準管理。band 3 中央の 0.50。

---

## クワズイモ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> 初期seed必須とは判断せず。利用要望があれば追加検討（人間レビューコメントより）。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | クワズイモ |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面が乾いてきたらたっぷり／冬: 表面完全に乾いてから |
| watering_notes | 湿度好むが常時湿った土は根腐れの原因。冬は霧吹きや葉拭きで湿度確保。樹液にシュウ酸を含み肌荒れに注意。 |
| reference_url | https://www.kincho-engei.co.jp/cultivation/detail/5236/ |

### 参照URL
1. https://www.kincho-engei.co.jp/cultivation/detail/5236/ （KINCHO園芸）
2. https://www.hyponex.co.jp/plantia/plantia-8644/ （ハイポネックス Plantia）

### moisture_level 数値化理由
標準的な「表面乾いたら」管理。band 3 中央 0.50。

---

## クロトン（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> MVP初期seedではより利用需要の高い観葉植物を優先し、人間レビューによりDROPとなった。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | クロトン |
| plant_category | foliage |
| growth_form | shrub |
| parent_id | null |
| aliases | ヘンヨウボク |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面が乾き始めたら／冬: 表面乾いて2〜3日後 |
| watering_notes | 鮮やかな葉色をキープするには乾燥を防ぎ葉水推奨。日光不足で葉色が褪せる。耐寒性弱く最低10℃キープ。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14549/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14549/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/plantia-9449/ （ハイポネックス Plantia 観葉植物34選）

### moisture_level 数値化理由
「表面が乾き始めたら」は「表面乾いたら」より早めのタイミングで葉水頻度も高い。band 3 中央〜上の 0.55。

---

## コルジリネ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> MVP初期seedではより利用需要の高い観葉植物を優先し、人間レビューによりDROPとなった。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | コルジリネ |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases | コルディリネ |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 4〜10月: 表面乾いたら鉢底から流れるまで（7〜9月はほぼ毎日）／11〜3月: 週1〜2 |
| watering_notes | 生育旺盛な夏はほぼ毎日水やり。耐寒性弱く冬は5〜10℃をキープ。水はけの良い用土必須。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-16213/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-16213/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5067/ （KINCHO園芸）

### moisture_level 数値化理由
夏はほぼ毎日水やりで、標準管理より水好み。band 3 中〜上の 0.55。

---

## テーブルヤシ

| フィールド | 値 |
|---|---|
| name | テーブルヤシ |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases | チャメドレア |
| preferred_moisture_level | **0.55** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 冬以外: 表面乾いたら鉢底から流れるまで／冬: 週1回程度 |
| watering_notes | 中南米原産の小型ヤシで耐陰性あり。多湿を好むため葉水は毎日推奨。夏は早朝か夕方に水やり。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-14211/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-14211/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/22969/ （ハイポネックス Plantia 小さい観葉12選）

### moisture_level 数値化理由
「多湿を好む」「毎日葉水」で標準管理よりやや湿潤側。0.55。

---

## アレカヤシ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> MVP初期seedではより利用需要の高い観葉植物を優先し、人間レビューによりDROPとなった。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | アレカヤシ |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.58** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面が乾く前にたっぷり（葉先が茶色くなる）／冬: 完全に乾いてから |
| watering_notes | 熱帯・亜熱帯性。乾燥すると葉先が茶色くなる。ヤシの中では寒さに弱く冬は室内。強い直射日光を嫌う。葉水推奨。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-269/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-269/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/5043/ （KINCHO園芸）

### moisture_level 数値化理由
「乾く前にたっぷり」で水切れリスクが強調される。テーブルヤシ（0.55）よりやや湿潤側。0.58。イチジク（0.58）と同水準。

---

## ネフロレピス（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> MVP初期seedではより利用需要の高い観葉植物を優先し、人間レビューによりDROPとなった。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | ネフロレピス |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases | タマシダ |
| preferred_moisture_level | **0.65** |
| moisture_band | 4 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面が乾く前にたっぷり／冬: 乾かし気味＋葉水こまめ |
| watering_notes | シダ類で高温多湿を好む。夏の直射日光は葉焼け、遮光か半日陰で管理。冬でも空気乾燥を嫌い葉水必須。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-200/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-200/ （ハイポネックス 園芸サポート）
2. https://www.kincho-engei.co.jp/cultivation/detail/5278/ （KINCHO園芸）

### moisture_level 数値化理由
「表面が乾く前にたっぷり」で標準管理より水好み。ミント（0.65）と同水準の band 4 下端。

---

## マランタ（初期seedから除外）

> Issue #7 → 人間レビュー対応（2026-08-21）で除外。
> MVP初期seedではより利用需要の高い観葉植物を優先し、人間レビューによりDROPとなった。
> MVP初期seedからの除外はniwa.logでの利用価値・優先度による判断であり、将来のユーザーリクエスト等による追加を否定するものではない。

以下は除外前の調査記録として保持:

| フィールド | 値 |
|---|---|
| name | マランタ |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases | プレイヤープラント |
| preferred_moisture_level | **0.68** |
| moisture_band | 4 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面乾いたらたっぷり／夏: ほぼ毎日／冬: 表面乾いて数日後 |
| watering_notes | 湿度大好き（乾燥で葉がくるまる）。空気湿度不足時は葉水必須。夜に葉が立ち上がる就眠運動（プレイヤープラントの由来）。 |
| reference_url | https://www.shuminoengei.jp/m-pc/a-page_p_detail/target_plant_code-468/target_tab-2 |

### 参照URL
1. https://www.shuminoengei.jp/m-pc/a-page_p_detail/target_plant_code-468/target_tab-2 （NHK 趣味の園芸）
2. https://hanaprime.jp/botanical-book/maranta/ （HanaPrime）

### moisture_level 数値化理由
「湿度大好き」「夏は毎日」でネフロレピス（0.65）より湿潤志向。0.68。カラテアと同水準。

---

## カラテア

| フィールド | 値 |
|---|---|
| name | カラテア |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases |  |
| preferred_moisture_level | **0.68** |
| moisture_band | 4 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 表面がうっすら乾いたらたっぷり／夏: 朝夕1日2回／冬: 乾かし気味＋葉水こまめ |
| watering_notes | 高温多湿を好み水不足で葉が丸まる。強日射で葉焼け、明るい日陰が理想。葉の模様が魅力の代表種。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-11653/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-11653/ （ハイポネックス Plantia）
2. https://www.kincho-engei.co.jp/cultivation/detail/5224/ （KINCHO園芸）

### moisture_level 数値化理由
「うっすら乾いたら」「夏朝夕2回」でマランタと同じ湿潤志向。0.68。

---

## アジアンタム

| フィールド | 値 |
|---|---|
| name | アジアンタム |
| plant_category | foliage |
| growth_form | herbaceous |
| parent_id | null |
| aliases | ホウライシダ |
| preferred_moisture_level | **0.72** |
| moisture_band | 4 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 常時湿度高めキープ／こまめな葉水必須／エアコン風は避ける |
| watering_notes | シダの中でも乾燥に極めて弱い。葉がチリチリになりやすいため葉水頻度が最重要。直射日光NG、明るい日陰。 |
| reference_url | https://www.hyponex.co.jp/plantia/plantia-9714/ |

### 参照URL
1. https://www.hyponex.co.jp/plantia/plantia-9714/ （ハイポネックス Plantia）
2. https://www.hyponex.co.jp/plantia/23907/ （ハイポネックス Plantia テラリウム）

### moisture_level 数値化理由
「乾燥に極めて弱い」でアジサイ（0.72）と同水準。foliage の中で最も湿潤志向。band 4 中央〜上端。

---

## ゴムノキ（フィカス・エラスティカ）

> 人間レビュー対応（2026-08-21）でADD_CANDIDATE→採用。観葉植物の古典的代表格。フィカス属はウンベラータ・ベンジャミナ(DROP済み)を収録済みだが最も歴史的に定番のエラスティカが抜けていた。

| フィールド | 値 |
|---|---|
| name | ゴムノキ |
| plant_category | foliage |
| growth_form | tree |
| parent_id | null |
| aliases | フィカス・エラスティカ, インドゴムノキ |
| preferred_moisture_level | **0.50** |
| moisture_band | 3 |
| is_moisture_anchor | false |
| watering_amount | moderate |
| watering_pace | 春秋: 鉢土の表面が乾いたらたっぷり／夏: 毎日＋葉水／冬: 乾かし気味＋こまめな葉水で加湿 |
| watering_notes | 強健で育てやすい観葉植物の定番。過湿による根腐れに注意しつつ、夏は高温多湿を好み毎日の水やりが必要になることも。冬は室内の暖房による乾燥対策として葉水を推奨。 |
| reference_url | https://www.hyponex.co.jp/garden_support/garden_support-242/ |

### 参照URL
1. https://www.hyponex.co.jp/garden_support/garden_support-242/ （ハイポネックス 園芸サポート ゴムノキ）
2. https://www.kincho-engei.co.jp/cultivation/detail/5066/ （KINCHO園芸 インドゴムノキの育て方）

### 採用理由
2ソース共に「春秋は表面が乾いたらたっぷり」「夏は毎日＋葉水」「冬は乾かし気味＋葉水で加湿」で一致。過湿による根腐れへの注意も両ソース共通。

### moisture_level 数値化理由
フィカス・ウンベラータ（0.50）と同属・同水準の管理パターンのため同値を採用。
