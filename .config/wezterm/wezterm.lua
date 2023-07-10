local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config = {
  font = wezterm.font("JetBrainsMono Nerd Font", {weight="Regular", stretch="Normal", style="Normal"}),
  font_size = 13,
  enable_tab_bar = true,
  window_background_opacity = 0.75,
  disable_default_key_bindings = true,
  use_fancy_tab_bar = false,
  tab_and_split_indices_are_zero_based = true,
  window_decorations = "NONE",
  color_scheme = 'iceberg-dark',
  tab_bar_at_bottom = true,
  leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }, 
  keys = {
    -- pain
    {
      key = '|',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '-',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'e',
      mods = 'LEADER',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
      key = 'k',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
      key = 'j',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Down',
    },
    -- clipboard
    { key = "c", mods = "CMD", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CMD", action = wezterm.action({ PasteFrom = "Clipboard" }) },
    {
      key = 'f',
      mods = 'LEADER',
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = 'z',
      mods = 'LEADER',
      action = wezterm.action.TogglePaneZoomState,
    },
    {
      key = 'Tab',
      mods = 'LEADER',
      action = wezterm.action.ActivateTabRelative(1),
    },
    -- TODO use for
    {
      key = '0',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(0),
    },
    {
      key = '1',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(1),
    },
    {
      key = '2',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(2),
    },
    {
      key = '3',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(3),
    },
    {
      key = '4',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(4),
    },
    {
      key = ',',
      mods = 'LEADER',
      action = wezterm.action.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      },
    },
    { key = 'n', mods = 'LEADER', action = wezterm.action.SpawnTab 'DefaultDomain' },
    { key = 'w', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = true } }
  }
}


return config
