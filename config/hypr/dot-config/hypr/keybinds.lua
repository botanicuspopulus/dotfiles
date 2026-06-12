local vars = require("vars")

local function get_hypr_config_dir()
	return (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/hypr"
end

hl.bind("CONTROL + ALT + L", hl.dsp.exec_cmd(vars.lock))

hl.bind(vars.mainMod .. " + Q", hl.dsp.window.close())
hl.bind(vars.mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(vars.mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(vars.mainMod .. " + ALT + G", hl.dsp.exec_cmd("zsh " .. get_hypr_config_dir() .. "/scripts/gamemode.zsh"))
hl.bind(vars.mainMod .. " + ALT + P", hl.dsp.exec_cmd(vars.screenshot("region")))
hl.bind(vars.mainMod .. " + SHIFT + ALT + P", hl.dsp.exec_cmd(vars.screenshot("window")))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { repeating = true })

hl.bind(
	"ALT + P",
	hl.dsp.exec_cmd('rofi-rbw --keybindings="Alt+Shift+u:copy:username,Alt+shift+p:copy:password,Alt+Shift+o:copy:otp"')
)

hl.bind(vars.mainMod .. " + E", hl.dsp.exec_cmd(vars.terminal .. "-D " .. os.getenv("HOME") .. "nvim"))
hl.bind(vars.mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(vars.filebrowser))
hl.bind(vars.mainMod .. " + RETURN", hl.dsp.exec_cmd(vars.terminal))

hl.bind(vars.mainMod .. " + SPACE", hl.dsp.exec_cmd(vars.launcher))
hl.bind(vars.mainMod .. " + B", hl.dsp.exec_cmd(vars.browser))
hl.bind(vars.mainMod .. " + V", hl.dsp.exec_cmd(vars.clipboard))
hl.bind(vars.mainMod .. " + N", hl.dsp.exec_cmd(vars.wifi_menu))
hl.bind(vars.mainMod .. " + EQUAL", hl.dsp.exec_cmd(vars.calculator))
hl.bind("CONTROL + ALT + P", hl.dsp.exec_cmd(vars.power_menu))

hl.bind(vars.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(vars.mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(vars.mainMod .. " + bracketleft", hl.dsp.group.prev())
hl.bind(vars.mainMod .. " + bracketright", hl.dsp.group.next())
hl.bind(vars.mainMod .. " + SHIFT + bracketleft", hl.dsp.group.move_window({ forward = true }))
hl.bind(vars.mainMod .. " + SHIFT + bracketright", hl.dsp.group.move_window({ forward = false }))
hl.bind(vars.mainMod .. " + SHIFT + ALT + H", hl.dsp.window.move({ into_or_create_group = "l" }))
hl.bind(vars.mainMod .. " + SHIFT + ALT + L", hl.dsp.window.move({ into_or_create_group = "r" }))
hl.bind(vars.mainMod .. " + ALT + H", hl.dsp.group.prev())
hl.bind(vars.mainMod .. " + ALT + L", hl.dsp.group.next())
hl.bind(vars.mainMod .. " + T", hl.dsp.group.toggle())

hl.bind(vars.mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(vars.mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(vars.mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(vars.mainMod .. " + K", hl.dsp.focus({ direction = "up" }))

hl.bind(vars.mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(vars.mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(vars.mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(vars.mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))

hl.bind(vars.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

for i = 1, 10 do
	local key = i % 10
	hl.bind(vars.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(vars.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(vars.mainMod .. " + SHIFT + comma", hl.dsp.workspace.move({ monitor = "-1" }))
hl.bind(vars.mainMod .. " + SHIFT + period", hl.dsp.workspace.move({ monitor = "+1" }))

hl.bind(vars.mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("pypr-client toggle volume"))
hl.bind(vars.mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("pypr-client toggle bluetooth"))

hl.bind(vars.mainMod .. " + Z", hl.dsp.workspace.toggle_special("special"))
hl.bind(
	vars.mainMod .. " + SHIFT + Z",
	hl.dsp.window.move({ workspace = "special:special", follow = false }),
	{ description = "Window: Send to scratchpad" }
)
