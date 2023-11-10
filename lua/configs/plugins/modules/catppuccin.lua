return {

	"catppuccin/nvim",

	name = "catppuccin",

	priority = require("utils.number").maxFinite - 0,

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
