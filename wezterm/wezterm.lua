local wezterm = require("wezterm")

-- サブ設定の読み込み
local fish = require("fish")
local transparency = require("transparency")
local keymaps = require("keymaps")
local env = require("env")

-- base config
local config = {}

-- サブ設定を上書き統合（keys は後で特別に処理）
for k, v in pairs(fish) do 
  if k ~= "keys" then
    config[k] = v 
  end
end
for k, v in pairs(transparency) do 
  if k ~= "keys" then
    config[k] = v 
  end
end
for k, v in pairs(keymaps) do 
  if k ~= "keys" then
    config[k] = v 
  end
end
if env.set_environment_variables and next(env.set_environment_variables) then
  config.set_environment_variables = env.set_environment_variables
end

-- keys の配列をマージ
local all_keys = {}
if transparency.keys then
  for _, key in ipairs(transparency.keys) do
    table.insert(all_keys, key)
  end
end
if keymaps.keys then
  for _, key in ipairs(keymaps.keys) do
    table.insert(all_keys, key)
  end
end
if #all_keys > 0 then
  config.keys = all_keys
end

return config