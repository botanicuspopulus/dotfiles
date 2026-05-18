hl.config({
	cursor = {
		enable_hyprcursor = true,
	},
	binds = {
		workspace_back_and_forth = true,
		allow_workspace_cycles = true,
		pass_mouse_when_bound = false,
	},
	xwayland = {
		force_zero_scaling = true,
	},
	render = {
		direct_scanout = false,
	},
})

hl.gesture({
	fingers = 3,
	direction = "swipe",
	action = "move",
})
