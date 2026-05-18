local vars = require("colours")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 1,

		col = {
			active_border = "rgba(" .. vars.colours.lavender .. "ff)",
			inactive_border = "rgba(" .. vars.colours.blue .. "cc)",
		},

		layout = "master",

		resize_on_border = true,

		allow_tearing = false,
	},

	decoration = {
		rounding = 5,
		dim_inactive = false,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = false,
		},
	},

	group = {
		col = {
			border_active = "rgb(" .. vars.colours.mauve .. ")",
			border_inactive = "rgb(" .. vars.colours.overlay0 .. ")",
			border_locked_active = "rgb(" .. vars.colours.blue .. ")",
			border_locked_inactive = "rgb(" .. vars.colours.surface2 .. ")",
		},

		groupbar = {
			enabled = true,
			font_size = 12,
			height = 18,
			gradients = true,

			col = {
				active = "rgb(" .. vars.colours.blue .. ")",
				inactive = "rgb(" .. vars.colours.surface2 .. ")",
				locked_active = "rgb(" .. vars.colours.mauve .. ")",
			},
			text_color = "rgb(" .. vars.colours.text .. ")",
		},
	},
})
