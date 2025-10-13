local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_decorations = "RESIZE"

-- tab
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 2 -- lets be honest. you are not going to open more than 9 tabs

-- -- config.color_scheme = "Batman"
-- config.color_scheme = "AdventureTime"

config.window_background_opacity = 0.8

-- key bindings
config.keys = {
	{ key = "Enter", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
}

-- The set of schemes that we like and want to put in our rotation
local schemes = {}
for name, scheme in pairs(wezterm.get_builtin_color_schemes()) do
	table.insert(schemes, name)
end

wezterm.on("window-config-reloaded", function(window, pane)
	-- If there are no overrides, this is our first time seeing
	-- this window, so we can pick a random scheme.
	if not window:get_config_overrides() then
		-- Pick a random scheme name
		local scheme = schemes[math.random(#schemes)]
		window:set_config_overrides({
			color_scheme = scheme,
		})
	end
end)

return config
