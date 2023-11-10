return {

	"catppuccin/nvim",

	name = "catppuccin",

	priority = require("utils.prioritization").of(0),

	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({

			flavour = "mocha",

			transparent_background = true,

			integrations = {

				notify = true,

				fidget = true,

				treesitter_context = true,

				which_key = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
