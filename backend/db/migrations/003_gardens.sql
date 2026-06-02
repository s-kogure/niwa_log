-- [v0.2 変更] season_state を enum に変更（旧: float）
-- [v0.2 変更] 座標を持たず、regions への参照に変更
CREATE TYPE season_state_enum AS ENUM ('active', 'dormant');

CREATE TABLE gardens (
  id SERIAL PRIMARY KEY,
  owner_id INTEGER NOT NULL REFERENCES users(id),
  name VARCHAR(100) NOT NULL,
  region_id INTEGER REFERENCES regions(id),
  season_state season_state_enum NOT NULL DEFAULT 'active',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
