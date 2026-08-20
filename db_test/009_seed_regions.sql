-- 009_seed_regions.sql
-- 総務省「全国地方公共団体コード」に基づく市区町村マスタ初期seed
--
-- このファイルは db_test/scripts/generate_regions_seed.py で生成する。
-- 手動編集は不要。生成方法は同スクリプトのコメントを参照。
--
-- 生成手順:
--   1. https://www.soumu.go.jp/denshijiti/code.html から
--      最新の「都道府県コード及び市区町村コード」Excelをダウンロード
--   2. pip install openpyxl（初回のみ）
--   3. python3 db_test/scripts/generate_regions_seed.py <ダウンロードしたExcelのパス>
--   4. 本ファイルが上書き生成される

-- ※ 本ファイルは生成前のプレースホルダーです。
--    generate_regions_seed.py 実行後、内容が置き換わります。

begin;

-- TODO: generate_regions_seed.py を実行してこのファイルを生成してください

commit;
