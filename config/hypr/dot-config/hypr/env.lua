local home_dir = os.getenv("HOME")

hl.env("XDG_CONFIG_HOME", home_dir .. "/.config")
hl.env("XDG_DATA_HOME", home_dir .. "/.local/share")
hl.env("XDG_DATA_CACHE", home_dir .. "/.cache")
hl.env("XDG_STATE_HOME", home_dir .. "/.local/state")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)
hl.env("QT_AUTOSCREEN_SCALE_FACTOR", 1)

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("_JAVA_AWT_WM_NONPARENTING", 1)

hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR") .. "/rbw/ssh-agent-socket")

hl.env("ZDOTDIR", home_dir .. "/.config/zsh/")
hl.env("MOZ_ENABLE_WAYLAND", 1)

local has_nvidia = false
local has_intel = false
local has_amd = false

local handle = io.popen("lspci -d ::03xx 2>/dev/null")

if handle ~= nil then
	local gpus = handle:read("*a") or ""

	has_nvidia = gpus:lower():find("nvidia") ~= nil
	has_intel = gpus:lower():find("intel") ~= nil
	has_amd = gpus:lower():find("amd") ~= nil or gpus:lower():find("ati") ~= nil
end

if has_nvidia and (has_intel or has_amd) then
	-- [[
	-- For this to work, you need to add the following in /etc/udev/rules.d/99-gpu-paths.rules
	-- KERNEL=="card*", KERNELS=="0000:00:02.0", SUBSYSTEM="drm", SYMLINK+="dri/intel-igpu"
	-- KERNEL=="card*", KERNELS=="0000:01:00.0", SUBSYSTEM="drm", SYMLINK+="dri/nvidia-dgpu"
	-- Then you need to run
	-- sudo udevadm control --reload
	-- sudo udevadm trigger
	--]]

	hl.env("AQ_DRM_DEVICES", "/dev/dri/intel-igpu:/dev/dri/nvidia-dgpu")
	hl.env("LIBVA_DRIVER_NAME", "iHD")
	hl.env("VDPAU_DRIVER", "va_gl")
end

if has_nvidia and not (has_intel or has_amd) then
	hl.env("LIBVA_DRIVER_NAME", "nvidia")
	hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
	hl.env("GBM_BACKEND", "nvidia-drm")
	hl.env("NVD_BACKEND", "direct")
end
