-- [v0.2 新設] 地域マスタ。庭は座標の代わりにこのテーブルを参照する。
-- external_id は HeartRails Geo API が返す郵便番号（postal）を使用する。
-- 二重作成防止のため UNIQUE 制約が必須。
CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  external_id VARCHAR(100) UNIQUE NOT NULL,
  name VARCHAR(100) NOT NULL,
  lat NUMERIC(10, 7) NOT NULL,
  lng NUMERIC(10, 7) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
