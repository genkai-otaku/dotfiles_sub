# WezTerm設定

このディレクトリには、WezTermの設定ファイルが機能ごとに分割されています。

## ディレクトリ構成

```
wezterm/
├── wezterm.lua      # メイン設定ファイル（各モジュールを統合）
├── fish.lua         # fishシェルの設定
├── transparency.lua # 透過設定とショートカット
├── keymaps.lua      # キーマップ設定
├── env.lua          # 環境変数設定
└── setup.sh         # セットアップスクリプト
```

## 機能

### 1. Fishシェルの自動起動
- wezterm起動時に自動的にfishシェルが起動します
- 設定ファイル: `fish.lua`

### 2. 透過機能
- 初期状態: 不透明（透過度1.0）
- `Ctrl+Shift+T`: 透過（0.75）と不透明（1.0）を切り替え
- 設定ファイル: `transparency.lua`

### 3. キーマップ
- 追加のキーバインドを設定できます
- 設定ファイル: `keymaps.lua`

### 4. 環境変数
- wezterm内で使用する環境変数を設定できます
- 設定ファイル: `env.lua`

## セットアップ方法

### 初回セットアップ

1. このリポジトリをクローンまたはPullします
2. セットアップスクリプトを実行します：

```bash
cd ~/dotfiles/wezterm
chmod +x setup.sh
./setup.sh
```

または、手動でシンボリックリンクを作成：

```bash
mkdir -p ~/.config/wezterm
cd ~/.config/wezterm
ln -sf ~/dotfiles/wezterm/*.lua .
```

## 設定のカスタマイズ

### Fishのパスを変更する

`fish.lua`を編集：

```lua
M.default_prog = { "/opt/homebrew/bin/fish", "-l" }
```

### 透過度を変更する

`transparency.lua`を編集：

```lua
local current_opacity = 1.0  -- 初期透過度
-- ...
current_opacity = 0.75  -- 切り替え時の透過度
```

### キーマップを追加する

`keymaps.lua`を編集：

```lua
local wezterm = require("wezterm")

local M = {}

M.keys = {
  {
    key = "YourKey",
    mods = "CTRL|SHIFT",
    action = wezterm.action.YourAction,
  },
}

return M
```

### 環境変数を追加する

`env.lua`を編集：

```lua
local env = {}

env["CUSTOM_VAR"] = "value"
env["PATH"] = os.getenv("PATH") .. ":/custom/path"

M.set_environment_variables = env
```

## 設定の反映

設定ファイルを変更した後は、weztermを再起動するか、以下のコマンドで設定をリロードしてください：

```bash
wezterm reload-configuration
```

## トラブルシューティング

### 設定が反映されない

1. 設定ファイルが`~/.config/wezterm/`に正しく配置されているか確認：
   ```bash
   ls -la ~/.config/wezterm/
   ```

2. シンボリックリンクが正しく作成されているか確認：
   ```bash
   ls -la ~/.config/wezterm/wezterm.lua
   ```

3. weztermのログを確認：
   ```bash
   wezterm show-config
   ```

### Fishが起動しない

1. fishのパスが正しいか確認：
   ```bash
   which fish
   ```

2. `fish.lua`のパスを確認し、必要に応じて修正

### 透過が動作しない

1. `transparency.lua`の設定を確認
2. weztermを再起動
3. `Ctrl+Shift+T`を押して動作を確認

## ファイルの役割

- **wezterm.lua**: メイン設定ファイル。各モジュールを読み込み、統合します
- **fish.lua**: fishシェルの起動設定
- **transparency.lua**: 透過機能とショートカット設定
- **keymaps.lua**: 追加のキーマップ設定
- **env.lua**: 環境変数の設定

各ファイルは独立しており、必要な機能だけを有効にできます。

