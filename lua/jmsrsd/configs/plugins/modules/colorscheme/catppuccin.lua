local priority = require("jmsrsd.utils.priority")

return {

	"catppuccin/nvim",

	name = "catppuccin",

	priority = priority.order(0),

	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({

			flavour = "mocha",

			transparent_background = true,

			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):

				comments = { "italic" }, -- Change the style of comments

				conditionals = { "italic" },

				loops = { "italic" },

				keywords = { "italic" },

				types = { "italic" },

				functions = {},

				strings = {},

				variables = {},

				numbers = {},

				booleans = {},

				properties = {},

				operators = {},
			},

			integrations = {

				notify = true,

				fidget = true,

				treesitter_context = true,

				which_key = true,

				aerial = true,

				alpha = true,

				cmp = true,

				dashboard = true,

				flash = true,

				gitsigns = true,

				headlines = true,

				illuminate = true,

				indent_blankline = { enabled = true },

				leap = true,

				lsp_trouble = true,

				mason = true,

				markdown = true,

				mini = true,

				native_lsp = {

					enabled = true,

					underlines = {

						errors = { "undercurl" },

						hints = { "undercurl" },

						warnings = { "undercurl" },

						information = { "undercurl" },
					},
				},

				navic = { enabled = true, custom_bg = "lualine" },

				neotest = true,

				neotree = true,

				noice = true,

				semantic_tokens = true,

				telescope = true,

				treesitter = true,
			},
		})

		--- Enable italics
		---
		vim.cmd("set t_ZH=^[[3m")
		vim.cmd("set t_ZR=^[[23m")

		--- Enable 256 colors
		---
		vim.o.termguicolors = true

		--- Apply colorscheme
		---
		vim.cmd.colorscheme("catppuccin")
	end,
}
