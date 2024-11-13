local wezterm = require("wezterm")
local config = wezterm.config_builder()
wezterm.log_info("reloading")

config.font = wezterm.font("MesloLGS NF")
config.font_size = 18

config.command_palette_font_size = 16

config.enable_tab_bar = false

config.window_decorations = "TITLE | RESIZE"

-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 10

config.color_scheme = "Tokyo Night"

config.default_cursor_style = "BlinkingBar"

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.scrollback_lines = 10000

return config
