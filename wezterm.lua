local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- Aparência e fontes ----------------------------------------------------------

config.tab_max_width = 64
config.use_fancy_tab_bar = false
config.window_padding = { left = 2, top = 0, bottom = 0, right = 2 }

config.font_size = 10
config.font = wezterm.font "Hack"

config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"

-- Atalhos de teclado ----------------------------------------------------------

config.leader = { key = "a", mods = "CTRL" }
config.keys = {
  { key = "F11", action = wezterm.action.ToggleFullScreen },
  { mods = "LEADER|CTRL", key = "a",
    action = wezterm.action.SendKey { mods = "CTRL", key = "a" },
  },
  { mods = "LEADER", key = "c",
    action = wezterm.action.SpawnTab "CurrentPaneDomain"
  },
  { mods = "LEADER", key = "w",
    action = wezterm.action.CloseCurrentTab { confirm = true }
  },
  { mods = "LEADER", key = "v",
    action = wezterm.action.SplitHorizontal { domain  = "CurrentPaneDomain" },
  },
  { mods = "LEADER", key = "h",
    action = wezterm.action.SplitVertical { domain  = "CurrentPaneDomain" },
  },
}

return config
