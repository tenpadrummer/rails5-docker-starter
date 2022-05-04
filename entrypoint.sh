#!/bin/bash
set -e

# railsのpidが存在している場合に削除する処理
rm -f /app/tmp/pids/server.pid

# DockerfileのCMDで渡されたコマンド（→Railsのサーバー起動）を実行
exec "$@"