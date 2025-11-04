local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { 'fish' }

config.font_size = 10
-- config.line_height = 0.9

config.color_scheme = 'Dracula (Official)'


config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.97

config.enable_tab_bar = false


config.keys = {
  { key = 'd', mods = 'CTRL', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentPane { confirm = true }},
}



return config