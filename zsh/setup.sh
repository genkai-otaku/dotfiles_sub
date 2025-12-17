#!/bin/bash

# zsh 設定ファイルのセットアップスクリプト
# このスクリプトは、dotfiles/zsh/ の設定ファイルを
# $HOME にシンボリックリンクで配置します

set -e

# スクリプトのディレクトリを取得
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "zsh 設定ファイルのセットアップを開始します..."

link_file() {
  local src="$1"
  local dest="$2"

  if [ -f "$dest" ] && [ ! -L "$dest" ]; then
    echo "既存のファイルをバックアップ: $dest"
    mv "$dest" "${dest}.backup.$(date +%Y%m%d_%H%M%S)"
  fi

  if [ -L "$dest" ]; then
    rm "$dest"
  fi

  ln -sf "$src" "$dest"
  echo "  ✓ $(basename "$dest") -> $src"
}

# .zshrc
if [ -f "$SCRIPT_DIR/.zshrc" ]; then
  link_file "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
else
  echo "  ✗ .zshrc が $SCRIPT_DIR に見つかりません"
fi

# .p10k.zsh
if [ -f "$SCRIPT_DIR/.p10k.zsh" ]; then
  link_file "$SCRIPT_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
else
  echo "  ✗ .p10k.zsh が $SCRIPT_DIR に見つかりません"
fi

echo ""
echo "セットアップが完了しました！"
echo ""
echo "以下のコマンドで設定を反映できます:"
echo "  source ~/.zshrc"
echo ""


