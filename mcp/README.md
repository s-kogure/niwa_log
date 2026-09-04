# niwa_log 用 Local PJ MCP ガイド

このディレクトリは、ブラウザ版ChatGPTの通常の「チャット」から、開発中のローカルPJを直接読み書きするための案内です。

ローカル側のMCP本体は次にあります。

- サーバー: `/Users/shino/plugins/local-pj/scripts/server.py`
- Tunnel接続ヘルパー: `/Users/shino/plugins/local-pj/scripts/connect_tunnel.py`
- デフォルトの許可範囲: `/Users/shino/Desktop`

OpenAI公式の[MCP serverガイド](https://developers.openai.com/plugins/build/mcp-server)と[Secure MCP Tunnelガイド](https://developers.openai.com/api/docs/guides/secure-mcp-tunnels)に沿った構成です。

## 1. できることと安全境界

ChatGPTから、次の操作をライブのローカルファイルに対して実行できます。

- PJ一覧・ファイル一覧・Gitブランチ/変更状態の確認
- ファイル名・本文検索
- テキスト、Markdown、DOCX、PDFの読取
- PNG/JPEG/GIF/WebPの参照
- UTF-8ファイルの新規作成
- SHA-256確認済みファイルの全置換・狙い撃ちテキスト置換

次の操作は提供していません。

- ファイル削除・移動
- シェル実行、パッケージインストール、Gitの変更操作
- `/Users/shino/Desktop` の外側へのアクセス
- `.git`、`.ssh`、`.env`、秘密鍵など保護対象の読取・書込

既存ファイルを変更するときは、同じチャットターンで先に `read_file` を呼び、返された `sha256` を使います。ファイルが途中で変わっていた場合は変更を拒否します。

## 2. OpenAI側で一度だけ準備

1. [PlatformのTunnels設定](https://platform.openai.com/settings/organization/tunnels)でTunnelを作成し、ID（`tunnel_...`）を控える。
2. [Runtime API keys設定](https://platform.openai.com/settings/organization/api-keys)でRuntime API keyを作成する。実行主体にはTunnelの `Read + Use` 権限が必要。
3. API keyはチャットに貼らず、ローカルTerminalだけで環境変数に設定する。

## 3. ローカルTunnelを起動

公式macOS arm64版 `tunnel-client` v0.0.14は、すでに `/Users/shino/.local/bin/tunnel-client` に導入済みです。

```sh
export CONTROL_PLANE_API_KEY="<Runtime API key>"
python3 /Users/shino/plugins/local-pj/scripts/connect_tunnel.py "<tunnel_id>"
```

このヘルパーは、Local PJのstdio MCPサーバーをTunnelに登録し、管理対象ランタイムとして起動し、最後に状態を表示します。別の親ディレクトリも許可する場合は、明示的に追加します。

```sh
python3 /Users/shino/plugins/local-pj/scripts/connect_tunnel.py \
  "<tunnel_id>" \
  --allowed-root /Users/shino/Desktop \
  --allowed-root /Users/shino/別の作業親ディレクトリ
```

状態確認:

```sh
tunnel-client runtimes status local-pj --json
```

`process_running`、`healthy`、`ready` が成功状態になっていることを確認します。PCを終了・再起動した後は、必要に応じて環境変数を再設定して接続コマンドをもう一度実行します。

## 4. ChatGPTの通常チャットから接続

1. [ChatGPTのConnector設定](https://chatgpt.com/#settings/Connectors)を開く。
2. Developer modeでMCP appを作成する。
3. 接続方式に **Tunnel** を選び、`local-pj` のTunnelを指定する。
4. ツールをスキャンして有効化する。表示名は `localPJ` など、分かりやすい名前にする。

既存のクラウドProjectは作り直しません。既存チャットでツールが表示されない場合だけ、同じProject内で新規チャットを開きます。

最初の確認プロンプト:

```text
@localPJ workspace=/Users/shino/Desktop/niwa_log のworkspace_statusを実行して、Gitブランチと変更状態を説明して。
```

続けて、読取確認:

```text
@localPJ workspace=/Users/shino/Desktop/niwa_log のREADMEや主要なソースを検索して、現在の構成を要約して。
```

## 5. 安全な編集の頼み方

編集を頼むときは、次の順序を明示します。

```text
@localPJ workspace=/Users/shino/Desktop/niwa_log を最新状態で確認して。
対象ファイルをread_fileで読み、sha256を取得してから、必要最小限のreplace_textで変更して。
変更後にもう一度read_fileして、差分を説明して。
```

新規ファイル作成は、対象パスと内容を明示し、`create_if_missing=true` を使わせます。既存ファイルの全置換は、必ず直前の `sha256` を渡します。

## 6. ローカルテスト

### MCPサーバーのユニットテスト

```sh
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover \
  -s /Users/shino/plugins/local-pj/tests -v
```

### stdio通信と編集ガードのスモークテスト

これは一時PJに対して作成・置換を行います。実PJでは実行しないでください。

```sh
smoke_dir="$(mktemp -d /Users/shino/Desktop/local-pj-smoke.XXXXXX)"
python3 /Users/shino/plugins/local-pj/scripts/smoke_client.py "$smoke_dir"
rm -f "$smoke_dir/smoke.txt"
rmdir "$smoke_dir"
```

成功時は、`alpha`/`beta` のファイルを作成し、SHA-256を確認したうえで `beta` を `gamma` に置換し、最終内容が `alpha`/`gamma` になります。

### Tunnel接続テスト

```sh
tunnel-client runtimes status local-pj --json
```

その状態が正常なら、ChatGPT側で「4. ChatGPTの通常チャットから接続」の確認プロンプトを実行します。Tunnel起動中だけローカル内容を参照できます。

## 7. トラブルシュート

- **Tunnelが見えない**: `tunnel-client runtimes status local-pj --json` を確認し、`connect_tunnel.py` を再実行する。
- **ChatGPTでツールが出ない**: Tunnelを起動したまま、Developer mode appのツールスキャンをやり直す。必要なら同じProject内で新規チャットを作る。
- **読み書きが拒否される**: workspaceが許可ルート配下か、`.env`/`.git`などの保護対象でないか確認する。
- **編集が拒否される**: 先に同じファイルを `read_file` し、返された最新の `sha256` を使う。
- **秘密情報を誤って公開しそう**: Runtime API keyはチャットに送らず、Terminalの環境変数だけに置く。
