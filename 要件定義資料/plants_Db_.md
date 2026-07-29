# 植物マスタ情報の設計

## plants 初期データ方針

- 初期データあり
- 大分類ごとに20件前後を目安に作成
- 想定分類：ハーブ / 観葉植物 / 野菜 / 多肉植物 / 必要に応じて草花・樹木・その他
- データ収集ルールは後続で決定
- 初期データ作成はエージェント利用想定
- ユーザー申請による追加にも対応する

※申請中は plants に入れず、plant_master_requests に置く。

plant_master_requestsテーブルも別途に作る。  
v1では plant_master_requests は削除しない。  
承認後は status=approved にして、approved_plant_id で plants と紐づける。  
plants 側にも approved_at / created_from_request_id を持たせる。  
通常利用では plants だけを見る。  
plant_master_requests は申請履歴・管理確認用として残す。

## 基本構造

- 植物名
- plant_type（大分類）
- 親カテゴリ / 親植物
- 水やり係数
- 水やりペース
- 水やり量
- reference_url
- approval_status

## plant_type内の分類

plant_typeは、ざっくりとした植物の分類。  
※学術的分類ではなく、園芸用土を基準にしたふんわりとした基準。

- herb
- foliage
- vegetable
- succulent
- flower
- tree
- other

日本語表記としてはこんなかんじ

- herb = ハーブ
- foliage = 観葉植物
- vegetable = 野菜
- succulent = 多肉植物
- flower = 草花
- tree = 樹木
- other = その他
