以下のDB設計メモをもとに、niwa.log v1用のPostgreSQL / Supabase向けDBスキーマ案を作ってください。

目的は、まだ実行用マイグレーションではなく、レビュー用のSQL案を作ることです。

対象テーブル:

- users
- regions
- gardens
- garden_environment_tags
- plants
- plant_features
- user_plants
- user_plant_tags

前提:

- v1は1ユーザー1庭想定。ただし将来の複数庭対応を壊さない
- users は認証・所有者管理のみ
- regions は庭に紐づく地域マスタ
- gardens は庭プロフィールと庭環境
- plants は植物マスタ
- plant_features は植物マスタ側の特徴
- user_plants はユーザーの庭に登録された植物個体
- user_plant_tags はユーザー植物個体に紐づく環境タグ・管理タグ
- スコアは保存せず表示時に計算する
- 削除は deleted_at による論理削除を基本にする

やらないこと:

- users に region_id を持たせない
- plants にユーザー個別情報を持たせない
- plants に水やり履歴を持たせない
- user_plants と plants を混同しない
- plant_features と user_plant_tags を混同しない
- watering_scores テーブルは作らない

出力:

1. CREATE TABLE SQL
2. 外部キー制約
3. index案
4. enum または CHECK制約案
5. Supabase RLSを後で張る前提での注意点
6. 設計メモとSQLの対応表
7. 未確定事項
8. レビュー観点

まずは実行せず、レビュー用のSQL案として提示してください。
