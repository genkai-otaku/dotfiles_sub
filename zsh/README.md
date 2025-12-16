# zsh 設定

このディレクトリには、`zsh` の設定ファイルが配置されています。

### ファイル構成

- **.zshrc**: `oh-my-zsh` と `powerlevel10k` を使ったメインのシェル設定
- **.p10k.zsh**: `powerlevel10k` のプロンプト設定

### 前提

- zsh がインストール済み
- [Oh My Zsh](https://ohmyz.sh/) がインストール済み（`$HOME/.oh-my-zsh` を前提）
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) が `oh-my-zsh` のテーマとして導入済み
- Nerd Font 対応フォントをターミナルで使用していること

※[インストール参考記事](https://zenn.dev/collabostyle/articles/6d668b46627d64)

### セットアップ

ホームディレクトリにシンボリックリンクを貼って使う想定です。

#### 1. セットアップスクリプトを使う方法（推奨）

```bash
cd ~/dotfiles/zsh
chmod +x setup.sh
./setup.sh
```

#### 2. 手動でシンボリックリンクを貼る方法

```bash
cd ~/dotfiles/zsh

ln -sf "$PWD/.zshrc"    "$HOME/.zshrc"
ln -sf "$PWD/.p10k.zsh" "$HOME/.p10k.zsh"
```

#### 3. 設定の反映

シェルを再起動するか、以下で反映します。

```bash
source ~/.zshrc
```

### .zshrc の主な内容

- **Powerlevel10k の有効化**
  - テーマとして `ZSH_THEME="powerlevel10k/powerlevel10k"` を使用
  - `~/.p10k.zsh` が存在する場合に自動で `source` します
- **プラグイン**
  - `git`
  - `z`
  - `colored-man-pages`
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`

### Powerlevel10k のカスタマイズ

プロンプトの見た目を変更したい場合は、以下を実行してウィザードを起動できます。

```bash
p10k configure
```

または `~/.p10k.zsh` を直接編集して、左右のセグメントや色などを調整できます。


