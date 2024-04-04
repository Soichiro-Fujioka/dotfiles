local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config = {
  font = wezterm.font("UDEV Gothic 35NF", {weight="Regular", stretch="Normal", style="Normal"}),
  font_size = 13,
  enable_tab_bar = true,
  window_background_opacity = 0.5,
  macos_window_background_blur = 20,
  disable_default_key_bindings = true,
  use_fancy_tab_bar = false,
  tab_and_split_indices_are_zero_based = true,
  window_decorations = "RESIZE",
  color_scheme = 'Tokyo Night Moon',
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
    -- pain move
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
    { key = "h", mods = "CMD", action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
    { key = "l", mods = "CMD", action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
    { key = "k", mods = "CMD", action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
    { key = "j", mods = "CMD", action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
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
    -- move tab
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
      key = '5',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(5),
    },
    {
      key = '6',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(6),
    },
    {
      key = '7',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(7),
    },
    {
      key = '8',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(8),
    },
    {
      key = '9',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(9),
    },
    -- change tab name
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
    { key = 'w', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = true } },
    -- copy mode
    { key = 'c', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
    -- quick select
    { key = 's', mods = 'LEADER', action = wezterm.action.QuickSelect },
  }
}

wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime '%Y-%m-%d %H:%M:%S'

  window:set_right_status(wezterm.format {
    { Text = '' .. date},
  })
end)


return config
