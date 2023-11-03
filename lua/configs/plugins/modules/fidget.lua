return {
	"j-hui/fidget.nvim",

	tag = "legacy",

	event = "LspAttach",

	config = function()
		local fidget = require("fidget")

		fidget.setup({

			text = {

				spinner = {
					"🕐",
					"🕑",
					"🕒",
					"🕓",
					"🕔",
					"🕕",
					"🕖",
					"🕗",
					"🕘",
					"🕙",
					"🕚",
					"🕛",
				},
			},

			window = {

				blend = 0,

				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			},
		})
	end,
}
