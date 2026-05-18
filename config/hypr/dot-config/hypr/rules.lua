hl.window_rule({ match = { class = "^()$", title = "^()$" }, no_blur = true })

-- Floating
hl.window_rule({
	match = { title = "^(((Open|Save) File)|(Save As)|(Open Folder)|(Select a File)|(File Upload))(.*)$" },
	center = true,
	float = true,
	size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})
hl.window_rule({ match = { title = "^(.*)(wants to (save|open))$" }, center = true, float = true })
hl.window_rule({
	match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol)$" },
	center = true,
	float = true,
	size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})
hl.window_rule({
	match = { class = "^(nm-connection-editor)$" },
	center = true,
	float = true,
	size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})

hl.window_rule({
	match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
	float = true,
	keep_aspect_ratio = true,
	pin = true,
	move = { "(monitor_w*0.73)", "(monitor_h*0.72)" },
	size = { "(monitor_w*.25)", "(monitor_h*0.25)" },
})

hl.window_rule({
	match = { class = "blueman-manager" },
	center = true,
	float = true,
	size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})

hl.window_rule({
	match = { class = "^(python3)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(nwg-look)$" },
	float = true,
	center = true,
	size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})
