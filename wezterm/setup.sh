#!/bin/bash

# WezTerm設定ファイルのセットアップスクリプト
# このスクリプトは、dotfiles/wezterm/ の設定ファイルを
# ~/.config/wezterm/ にシンボリックリンクで配置します

set -e

# スクリプトのディレクトリを取得
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config/wezterm"

echo "WezTerm設定ファイルのセットアップを開始します..."

# .config/wezterm ディレクトリが存在しない場合は作成
if [ ! -d "$CONFIG_DIR" ]; then
  echo "ディレクトリを作成: $CONFIG_DIR"
  mkdir -p "$CONFIG_DIR"
fi

# 既存のファイルをバックアップ（シンボリックリンクでない場合）
for file in "$CONFIG_DIR"/*.lua; do
  if [ -f "$file" ] && [ ! -L "$file" ]; then
    echo "既存のファイルをバックアップ: $file"
    mv "$file" "${file}.backup.$(date +%Y%m%d_%H%M%S)"
  fi
done

# シンボリックリンクを作成
echo "シンボリックリンクを作成中..."
for file in "$SCRIPT_DIR"/*.lua; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    target="$CONFIG_DIR/$filename"
    
    # 既存のシンボリックリンクを削除
    if [ -L "$target" ]; then
      rm "$target"
    fi
    
    # シンボリックリンクを作成
    ln -sf "$file" "$target"
    echo "  ✓ $filename"
  fi
done

echo ""
echo "セットアップが完了しました！"
echo ""
echo "設定ファイルの場所:"
echo "  ソース: $SCRIPT_DIR"
echo "  リンク先: $CONFIG_DIR"
echo ""
echo "weztermを再起動するか、以下のコマンドで設定をリロードしてください:"
echo "  wezterm reload-configuration"
echo ""

