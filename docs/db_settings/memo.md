# sql化するまえのメモ

name: ローズマリー
parent_id: なし
plant_type: ハーブ
water_coefficient: 0.65
watering_pace: 土がしっかり乾いてから。過湿注意
watering_amount: 控えめ
reference_url: なし
approval_status: 承認済み

name: イングリッシュラベンダー
parent_id: ラベンダーを指す
plant_type: ハーブ
water_coefficient: 0.65
watering_pace: 週1〜2回目安。蒸れと過湿に注意
watering_amount: 控えめ
reference_url: なし
approval_status: 承認済み

# plants設計 練習メモ

plants は植物図鑑。
ユーザー個別の植物情報は入れない。

## plantsに入れるもの

- 植物名
- 親子カテゴリ
- 植物カテゴリ
- 水やり係数
- 水やりペース
- 水量目安
- 参考URL
- 承認状態

## plantsに入れないもの

- ニックネーム
- 庭の置き場所
- 植え方
- 健康状態
- 水やり履歴
- 個体メモ
- 管理タグ

## サンプル1: ローズマリー

植物名: ローズマリー
親: なし
カテゴリ: ハーブ
水やり係数: 0.65
水やりペース: 土がしっかり乾いてから。過湿注意
水量目安: 控えめ
参考URL: なし
承認状態: 承認済み

## サンプル2: イングリッシュラベンダー

植物名: イングリッシュラベンダー
親: ラベンダー
カテゴリ: ハーブ
水やり係数: 0.65
水やりペース: 週1〜2回目安。蒸れと過湿に注意
水量目安: 控えめ
参考URL: なし
承認状態: 承認済み

## 水やり係数について

水やり係数方針:
v1では water_coefficient のような固定係数は plants に持たせない。  
代わりに、water_preference / watering_amount / watering_pace / avoid_overwatering / watch_dry_out など、  
計算に使う植物特性パラメータを plants に持たせる。  
実際の水やりスコアや補正係数は、表示時にJS側で計算する。

水やりパラメータの水分設定:  
max1の係数設定。

例）  
0.05 → 極乾燥寄り。サボテン、一部多肉  
0.10 → かなり乾燥寄り。多肉、乾燥地性植物  
0.20 → 乾燥寄り。ラベンダー、ローズマリー  
0.30 → やや乾燥寄り。タイムなど  
0.50 → 標準。表土が乾いたら系  
0.70 → やや湿り気を好む。水切れ注意系  
0.90 → 湿り気強め  
1.00 → 湿地・水辺・常時湿潤寄り

watering_amount→ 1回あたりの水量目安

watering_pace→ 人間向け説明文

avoid_overwatering→ 過湿注意フラグ

watch_dry_out→ 水切れ注意フラグ

水やり係数の計算案：

plantsの植物特性  
→ preferred_moisture_level  
→ avoid_overwatering  
→ watering_amount  
→ watering_pace

user_plantsの栽培条件  
→ 鉢植え / 地植え  
→ 環境タグ  
→ 健康状態

weather_cacheの天気  
→ 気温  
→ 雨  
→ 湿度

季節・エリア  
→ 4月基準  
→ 南関東基準

水やり間隔は plants に固定日数として保存しない。
plants には preferred_moisture_level などの植物特性パラメータを保存する。
JS側で、植物特性・栽培条件・季節・地域・天気・最終水やり日から推奨水やり間隔を計算する。

季節補正の基準は4月、地域補正の基準は南関東とする。
イングリッシュラベンダーは、4月・南関東・鉢植え・通常天候の条件で5〜7日程度の水やり確認目安が出るように初期調整する。
