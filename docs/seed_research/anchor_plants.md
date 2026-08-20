# moisture anchor 植物

`preferred_moisture_level` の数値基準として使用するアンカー植物。  
全カテゴリの調査開始前にこのファイルを確定させる。

各 band に 2 植物を設定し、以降の全植物はこの基準との相対比較で数値を決める。

## 運用ルール

- アンカー植物の具体値（preferred_moisture_level）は、実際に 2〜3 ソースを確認してから確定する
- 値確定後は `010_seed_plants.sql` に優先して追記する
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
| preferred_moisture_level | 未調査 |
| moisture_band | 1 |
| is_moisture_anchor | true |
| anchor_note | 「水やり不要」の代名詞。band 1 下限〜中間の基準。 |

#### 参照URL
<!-- 調査時に記入 -->

#### moisture_level 数値化理由
<!-- 調査時に記入 -->

---

### エケベリア

| フィールド | 値 |
|---|---|
| name | エケベリア |
| plant_category | succulent |
| growth_form | other |
| preferred_moisture_level | 未調査 |
| moisture_band | 1 |
| is_moisture_anchor | true |
| anchor_note | 多肉の中での乾燥耐性代表。サボテンより若干湿潤寄り。 |

#### 参照URL
<!-- 調査時に記入 -->

#### moisture_level 数値化理由
<!-- 調査時に記入 -->

---

## band 2（0.21〜0.40）乾燥寄り

### ローズマリー

| フィールド | 値 |
|---|---|
| name | ローズマリー |
| plant_category | herb |
| growth_form | shrub |
| preferred_moisture_level | 未調査 |
| moisture_band | 2 |
| is_moisture_anchor | true |
| anchor_note | 「土が完全に乾いてから」で情報源の記述が揃いやすい。band 2 中間の基準。 |

#### 参照URL
<!-- 調査時に記入 -->

#### moisture_level 数値化理由
<!-- 調査時に記入 -->

---

### イングリッシュラベンダー

| フィールド | 値 |
|---|---|
| name | イングリッシュラベンダー |
| plant_category | herb |
| growth_form | shrub |
| preferred_moisture_level | 未調査 |
| moisture_band | 2 |
| is_moisture_anchor | true |
| anchor_note | 乾燥耐性の典型ハーブ。情報源豊富。ローズマリーとの相対比較も検証する。 |

#### 参照URL
<!-- 調査時に記入 -->

#### moisture_level 数値化理由
<!-- 調査時に記入 -->

---

## band 3（0.41〜0.60）標準

### バジル

| フィールド | 値 |
|---|---|
| name | バジル |
| plant_category | herb |
| growth_form | herbaceous |
| preferred_moisture_level | 未調査 |
| moisture_band | 3 |
| is_moisture_anchor | true |
| anchor_note | 「土表面が乾いたら与える」標準管理の代表。band 3 中間の基準。 |

#### 参照URL
<!-- 調査時に記入 -->

#### moisture_level 数値化理由
<!-- 調査時に記入 -->

---

### ゼラニウム

| フィールド | 値 |
|---|---|
| name | ゼラニウム |
| plant_category | flower |
| growth_form | herbaceous |
| preferred_moisture_level | 未調査 |
| moisture_band | 3 |
| is_moisture_anchor | true |
| anchor_note | 「やや乾かし気味〜標準」の中間。花ものの基準として使いやすい。 |

#### 参照URL
<!-- 調査時に記入 -->

#### moisture_level 数値化理由
<!-- 調査時に記入 -->

---

## band 4（0.61〜0.80）湿潤寄り

### ミント

| フィールド | 値 |
|---|---|
| name | ミント |
| plant_category | herb |
| growth_form | herbaceous |
| preferred_moisture_level | 未調査 |
| moisture_band | 4 |
| is_moisture_anchor | true |
| anchor_note | 乾燥でほぼ即へたれる。湿潤寄りハーブの代表。 |

#### 参照URL
<!-- 調査時に記入 -->

#### moisture_level 数値化理由
<!-- 調査時に記入 -->

---

### アジサイ

| フィールド | 値 |
|---|---|
| name | アジサイ |
| plant_category | flower |
| growth_form | shrub |
| preferred_moisture_level | 未調査 |
| moisture_band | 4 |
| is_moisture_anchor | true |
| anchor_note | 「水切れに注意」の定番。band 4 上寄りの基準になる可能性。 |

#### 参照URL
<!-- 調査時に記入 -->

#### moisture_level 数値化理由
<!-- 調査時に記入 -->

---

## band 5（0.81〜1.00）強い湿潤寄り

アンカー植物は設定しない。

初期 seed 対象カテゴリ（herb / foliage / flower / vegetable / fruit / succulent / orchid）の中で、
band 5 に自然に収まる一般流通植物はほぼ存在しないため。

**目安**: 苔類（コケ）がこのbandに相当する。  
調査中に band 5 相当の植物が出てきた場合は、その時点でアンカーを設定する。
