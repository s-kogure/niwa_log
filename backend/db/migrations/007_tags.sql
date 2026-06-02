-- タグはスコアリングに非関与。整理・検索用（品種名、管理メモ等）。
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- [v0.2 明示] 個体↔タグ 多対多の中間テーブル
CREATE TABLE user_plant_tags (
  user_plant_id INTEGER NOT NULL REFERENCES user_plants(id) ON DELETE CASCADE,
  tag_id INTEGER NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
  PRIMARY KEY (user_plant_id, tag_id)
);
