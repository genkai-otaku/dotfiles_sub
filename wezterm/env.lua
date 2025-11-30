local M = {}

-- 環境変数の設定
-- 追加の環境変数を設定する場合は、ここに記述
local env = {}

-- 例: 環境変数を追加する場合
-- env["CUSTOM_VAR"] = "value"
-- env["PATH"] = os.getenv("PATH") .. ":/custom/path"

M.set_environment_variables = env

return M

