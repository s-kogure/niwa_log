-- [v0.2 変更] キャッシュ単位を庭単位→地域単位に変更。同地域の複数庭で共有する。
-- ポーリング頻度: アクティブ期 1〜2時間ごと / 休眠期 1日1回
CREATE TABLE weather_cache (
  id SERIAL PRIMARY KEY,
  region_id INTEGER NOT NULL REFERENCES regions(id),
  observed_at TIMESTAMPTZ NOT NULL,
  condition VARCHAR(50),
  temp NUMERIC(5, 2),
  humidity INTEGER,
  raw_data JSONB
);

CREATE INDEX idx_weather_cache_region_observed ON weather_cache (region_id, observed_at DESC);
