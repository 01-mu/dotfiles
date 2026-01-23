local wezterm = require("wezterm")

local config = wezterm.config_builder() or {}

-- Appearance
config.font = wezterm.font("BlexMono Nerd Font Mono")
config.font_size = 14
config.line_height = 1.1
config.color_scheme = "Catppuccin Macchiato"

-- Window / Effects
config.window_background_opacity = 0.80
config.macos_window_background_blur = 8
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
config.window_decorations = "RESIZE|MACOS_FORCE_ENABLE_SHADOW"

-- macOS
config.macos_forward_to_ime_modifier_mask = "ALT"
config.hide_mouse_cursor_when_typing = true

-- Keybinds (Splits)
config.keys = {
  { key = "Enter", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "Enter", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

  { key = "LeftArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "UpArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "DownArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },

  { key = "LeftArrow", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 20 }) },
  { key = "RightArrow", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 20 }) },
  { key = "UpArrow", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 20 }) },
  { key = "DownArrow", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 20 }) },

  { key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
}

return config
