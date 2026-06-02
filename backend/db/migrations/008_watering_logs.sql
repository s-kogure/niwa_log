-- 「あげた」のみ記録。記録なし = あげていない。
-- 降雨との棲み分け：行動記録はここ、雨が降った事実は weather_cache（地域単位）。
CREATE TABLE watering_logs (
  id SERIAL PRIMARY KEY,
  user_plant_id INTEGER NOT NULL REFERENCES user_plants(id) ON DELETE CASCADE,
  watered_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  memo TEXT
);
