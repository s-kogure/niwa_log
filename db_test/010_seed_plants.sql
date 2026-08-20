-- 010_seed_plants.sql
-- 植物マスタ初期seed
--
-- 投入順序:
--   1. 親植物（parent_id = null）をまとめてINSERT
--   2. 子植物（parent_idをサブクエリで取得）をINSERT
--
-- 冪等性:
--   ON CONFLICT (name) DO NOTHING により再実行安全
--
-- 調査ログ:
--   docs/seed_research/ 配下のカテゴリ別 Markdown を参照
--
-- カテゴリ別進捗:
--   [ ] Session 0: anchor植物（moisture基準）
--   [ ] Session 1: herb + orchid
--   [ ] Session 2: succulent + fruit
--   [ ] Session 3: foliage
--   [ ] Session 4: flower
--   [ ] Session 5: vegetable

begin;

-- =========================================================
-- 親植物
-- =========================================================

-- TODO: Session 0（anchor確定）後に herb/orchid から順次追加


-- =========================================================
-- 子植物
-- =========================================================

-- TODO: 親植物INSERT後に追加


commit;
