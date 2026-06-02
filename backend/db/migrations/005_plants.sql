-- 植物マスタ。2階層固定（parent_id を持つ行はさらに子を持てない）。
-- 2階層制約はアプリ側（サービス層）で担保する。
-- サジェスト用に name に B-tree インデックスを付与する。
CREATE TYPE approval_status_enum AS ENUM ('draft', 'approved', 'rejected');

CREATE TABLE plants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  parent_id INTEGER REFERENCES plants(id),
  water_coefficient NUMERIC(4, 2) NOT NULL DEFAULT 1.0,
  approval_status approval_status_enum NOT NULL DEFAULT 'draft',
  submitted_by INTEGER REFERENCES users(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_plants_name ON plants (name);
