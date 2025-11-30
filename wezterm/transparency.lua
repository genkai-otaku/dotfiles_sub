local wezterm = require("wezterm")

local M = {}

-- 透明度用の現在値
local current_opacity = 1.0

-- 初期の透明度（100%）
M.window_background_opacity = 1.0
M.text_background_opacity = 1.0

M.keys = {
  {
    key = "T",
    mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window, pane)
      if current_opacity == 1.0 then
        current_opacity = 0.75  -- ← 好きな透明度へ
      else
        current_opacity = 1.0
      end

      window:set_config_overrides({
        window_background_opacity = current_opacity,
        text_background_opacity = current_opacity,
      })
    end),
  },
}

return M