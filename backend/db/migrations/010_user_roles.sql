-- 庭単位ロール（owner / viewer / contributor）。
-- moderator はグローバル権限なので users.is_moderator で管理し、このテーブルには入れない。
-- 複合ユニーク制約は (user_id, garden_id, role) — 将来的な複数ロール付与を許容する。
CREATE TYPE garden_role_enum AS ENUM ('owner', 'viewer', 'contributor');

CREATE TABLE user_roles (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  garden_id INTEGER NOT NULL REFERENCES gardens(id) ON DELETE CASCADE,
  role garden_role_enum NOT NULL,
  UNIQUE (user_id, garden_id, role)
);
