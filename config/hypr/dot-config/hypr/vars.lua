local M = {}

M.mainMod = "SUPER"
M.terminal = "foot"
M.browser = "firefox"
M.filebrowser = M.terminal .. " ranger"

local rofi = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/rofi"
local rofi_scripts = rofi .. "/scripts"

M.launcher = rofi_scripts .. "/launcher"
M.power_menu = rofi_scripts .. "/powermenu"
M.wifi_menu = rofi_scripts .. "/wifi"
M.calculator = rofi_scripts .. "/calculator"
M.clipboard = rofi_scripts .. "/clipboard"

M.lock = "hyprlock"

M.screenshot = function(mode)
	return "hyprshot --clipboard-only --mode " .. mode
end

return M
