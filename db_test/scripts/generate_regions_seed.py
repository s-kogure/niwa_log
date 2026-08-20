#!/usr/bin/env python3
"""
総務省「全国地方公共団体コード」Excelから
009_seed_regions.sql を生成するスクリプト。

【準備】
1. https://www.soumu.go.jp/denshijiti/code.html から最新の
   「都道府県コード及び市区町村コード」Excelをダウンロード
2. このスクリプトと同じディレクトリ、または任意のパスに置く

【実行】
  pip install openpyxl   # 初回のみ
  python3 generate_regions_seed.py <Excelファイルパス>

  例:
  python3 generate_regions_seed.py ~/Downloads/code_all.xlsx

【出力】
  db_test/009_seed_regions.sql（スクリプト実行ディレクトリを基準に上位へ出力）

【Excelの列構成（総務省標準フォーマット）】
  列0: 団体コード（6桁）
  列1: 都道府県名（漢字）
  列2: 市区町村名（漢字）
  列3: 都道府県名（カナ）  ← 不使用
  列4: 市区町村名（カナ）  ← 不使用

  ※ 先頭数行はヘッダー行のため、数字以外の団体コードはスキップする
  ※ 都道府県レコード（市区町村名が空欄）は対象外

"""

import sys
import os
import re
import hashlib
from datetime import datetime
from pathlib import Path

SOUMU_URL = "https://www.soumu.go.jp/denshijiti/code.html"


def compute_sha256(path: str) -> str:
    """指定ファイルの SHA-256 ハッシュを16進文字列で返す"""
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(65536), b""):
            h.update(chunk)
    return h.hexdigest()


def generate_sql(xlsx_path: str) -> None:
    try:
        import openpyxl
    except ImportError:
        print("エラー: openpyxl がインストールされていません。")
        print("  pip install openpyxl  を実行してからやり直してください。")
        sys.exit(1)

    wb = openpyxl.load_workbook(xlsx_path, read_only=True, data_only=True)

    # 「現在の団体」を含むシートを探す（政令市シートは除外）
    ws = None
    for name in wb.sheetnames:
        if "現在の団体" in name:
            ws = wb[name]
            break
    if ws is None:
        ws = wb.worksheets[0]  # fallback: 先頭シート

    rows = []
    for row in ws.iter_rows(values_only=True):
        code = str(row[0]).strip() if row[0] is not None else ""
        pref = str(row[1]).strip() if row[1] is not None else ""
        city = str(row[2]).strip() if row[2] is not None else ""

        # 6桁数字のみ対象（ヘッダー・空行除去）
        if not re.fullmatch(r"\d{6}", code):
            continue

        # 都道府県レコード（市区町村名が空）は除外
        if not city:
            continue

        rows.append((code, pref, city))

    wb.close()

    if not rows:
        print("エラー: 有効なデータが見つかりませんでした。列構成を確認してください。")
        sys.exit(1)

    # 公式データ情報を計算
    base_date = datetime.now().strftime("%Y-%m-%d")
    xlsx_hash = compute_sha256(xlsx_path)
    xlsx_filename = Path(xlsx_path).name

    # 出力先: このスクリプトの2つ上のディレクトリ（db_test/）
    script_dir = Path(__file__).parent
    output_path = script_dir.parent / "009_seed_regions.sql"

    def esc(s: str) -> str:
        return s.replace("'", "''")

    with open(output_path, "w", encoding="utf-8") as f:
        f.write("-- 009_seed_regions.sql\n")
        f.write("-- 総務省「全国地方公共団体コード」に基づく市区町村マスタ初期seed\n")
        f.write("--\n")
        f.write("-- 運用方針:\n")
        f.write("--   本ファイルは初期データ投入用の一回限りの migration として扱う。\n")
        f.write("--   将来の自治体変更（統廃合・新設・is_active 切替）は、本ファイルを書き換えず、\n")
        f.write("--   新しい migration で明示的に追加・更新する。\n")
        f.write("--   ON CONFLICT (municipality_code) DO NOTHING は、誤って再実行した場合の\n")
        f.write("--   安全策として保持する。（既存行の同期を目的とはしない）\n")
        f.write("--\n")
        f.write("-- 公式データ情報:\n")
        f.write(f"--   基準日: {base_date}（本ファイル生成日）\n")
        f.write("--   公式配布元: 総務省「全国地方公共団体コード」\n")
        f.write(f"--     {SOUMU_URL}\n")
        f.write(f"--   元ファイル名: {xlsx_filename}\n")
        f.write(f"--   ファイルハッシュ (SHA-256): {xlsx_hash}\n")
        f.write("--\n")
        f.write(f"-- 件数: {len(rows)}\n\n")
        f.write("begin;\n\n")
        f.write("insert into public.regions (municipality_code, municipality_name, prefecture_name)\n")
        f.write("values\n")

        for i, (code, pref, city) in enumerate(rows):
            comma = "," if i < len(rows) - 1 else ""
            f.write(f"  ('{esc(code)}', '{esc(city)}', '{esc(pref)}'){comma}\n")

        f.write("on conflict (municipality_code) do nothing;\n\n")
        f.write("commit;\n")

    print(f"生成完了: {output_path}")
    print(f"件数: {len(rows)}")
    print(f"基準日: {base_date}")
    print(f"ハッシュ: {xlsx_hash}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"使い方: python3 {sys.argv[0]} <Excelファイルパス>")
        sys.exit(1)

    xlsx_path = sys.argv[1]
    if not os.path.exists(xlsx_path):
        print(f"エラー: ファイルが見つかりません: {xlsx_path}")
        sys.exit(1)

    generate_sql(xlsx_path)
