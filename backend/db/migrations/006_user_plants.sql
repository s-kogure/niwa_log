CREATE TABLE user_plants (
  id SERIAL PRIMARY KEY,
  plant_id INTEGER NOT NULL REFERENCES plants(id),
  garden_id INTEGER NOT NULL REFERENCES gardens(id),
  zone_id INTEGER REFERENCES zones(id),
  nickname VARCHAR(100),
  memo TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
