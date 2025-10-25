local wezterm = require("wezterm")

local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"

local default_prog
if is_windows then
	default_prog = { "wsl.exe", "-d", "ArchLinux", "--cd", "~" }
else
	default_prog = { os.getenv("SHELL") }
end

local config = wezterm.config_builder()
config = {
	default_prog = default_prog,
	font = wezterm.font("UDEV Gothic 35NF", { weight = "Regular", stretch = "Normal", style = "Normal" }),
	font_size = 10,
	enable_tab_bar = true,
	window_background_opacity = 0.8,
	macos_window_background_blur = 15,
	disable_default_key_bindings = true,
	use_fancy_tab_bar = false,
	tab_and_split_indices_are_zero_based = true,
	window_decorations = "RESIZE",
	-- color_scheme = "Tokyo Night Moon",
	-- color_scheme = "Solarized Dark - Patched",
	-- color_scheme = "Catppuccin Mocha",
	-- color_scheme = "Kanagawa (Gogh)",
	color_scheme = "Gruvbox Material (Gogh)",
	-- colors = {
	-- 	background = "black",
	-- },
	tab_bar_at_bottom = true,
	leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 },
	keys = {
		-- pain
		{
			key = "|",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "e",
			mods = "LEADER",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		-- pain move
		{
			key = "h",
			mods = "LEADER",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "LEADER",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "LEADER",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "LEADER",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{ key = "h", mods = "CMD", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
		{ key = "l", mods = "CMD", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
		{ key = "k", mods = "CMD", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
		{ key = "j", mods = "CMD", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
		-- clipboard
		{ key = "c", mods = "CMD", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CMD", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{
			key = "f",
			mods = "LEADER",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "z",
			mods = "LEADER",
			action = wezterm.action.TogglePaneZoomState,
		},
		{ key = "t", mods = "LEADER", action = wezterm.action.EmitEvent("toggle-tabbar") },
		{
			key = "Tab",
			mods = "LEADER",
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			key = "m",
			mods = "LEADER",
			action = wezterm.action_callback(function(win, pane)
				local tab, window = pane:move_to_new_window()
			end),
		},
		{
			key = "t",
			mods = "LEADER",
			action = wezterm.action_callback(function(win, pane)
				local tab, window = pane:move_to_new_tab()
			end),
		},
		-- move tab
		-- TODO use for
		{
			key = "0",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(0),
		},
		{
			key = "1",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(1),
		},
		{
			key = "2",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(2),
		},
		{
			key = "3",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(3),
		},
		{
			key = "4",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(4),
		},
		{
			key = "5",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(5),
		},
		{
			key = "6",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(6),
		},
		{
			key = "7",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(7),
		},
		{
			key = "8",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(8),
		},
		{
			key = "9",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(9),
		},
		-- change tab name
		{
			key = ",",
			mods = "LEADER",
			action = wezterm.action.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{ key = "n", mods = "LEADER", action = wezterm.action.SpawnTab("DefaultDomain") },
		{ key = "w", mods = "LEADER", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
		-- copy mode
		{ key = "c", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
		-- quick select
		{ key = "s", mods = "LEADER", action = wezterm.action.QuickSelect },
	},
}

if is_windows then
	keys = {
		{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "c", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
		{ key = "c", mods = "ALT", action = wezterm.action.SendKey({ key = "c", mods = "CTRL" }) },
		{ key = "d", mods = "ALT", action = wezterm.action.SendKey({ key = "d", mods = "CTRL" }) },
	}
	for _, keymap in ipairs(keys) do
		table.insert(config.keys, keymap)
	end
end

wezterm.on("update-right-status", function(window, pane)
	local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")

	window:set_right_status(wezterm.format({
		{ Text = "" .. date },
	}))
end)

wezterm.on("toggle-tabbar", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.enable_tab_bar == false then
		wezterm.log_info("tab bar shown")
		overrides.enable_tab_bar = true
	else
		wezterm.log_info("tab bar hidden")
		overrides.enable_tab_bar = false
	end
	window:set_config_overrides(overrides)
end)

-- https://github.com/folke/zen-mode.nvim?tab=readme-ov-file#wezterm
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
