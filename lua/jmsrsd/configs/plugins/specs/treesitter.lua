return {

	"nvim-treesitter/nvim-treesitter",

	branch = "master",

	build = ":TSUpdate",

	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-context" },
		{ "windwp/nvim-ts-autotag" },
	},

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		local context = require("treesitter-context")

		local autotag = require("nvim-ts-autotag")

		treesitter.setup({

			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"html",
			},

			sync_install = true,

			auto_install = true,

			ignore_install = { "dart" },

			highlight = {

				enable = true,

				additional_vim_regex_highlighting = false,
			},

			indent = {

				enable = true,
			},
		})

		context.setup({
			--- Enable this plugin (Can be enabled/disabled later via commands)
			---
			enable = true,

			--- How many lines the window should span. Values <= 0 mean no limit.
			---
			max_lines = 0,

			--- Minimum editor window height to enable context. Values <= 0 mean no limit.
			---
			min_window_height = 0,

			line_numbers = true,

			--- Maximum number of lines to show for a single context
			---
			multiline_threshold = 20,

			--- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			---
			trim_scope = "outer",

			--- Line used to calculate context. Choices: 'cursor', 'topline'
			---
			mode = "cursor",

			--- Separator between context and content. Should be a single character string, like '-'.
			--- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			---
			separator = "─",
			--- separator = nil,

			--- The Z-index of the context window
			---
			zindex = 20,

			--- (fun(buf: integer): boolean) return false to disable attaching
			---
			on_attach = function()
				vim.cmd("highlight TreesitterContext guibg=NONE")
				vim.cmd("highlight TreesitterContextSeparator guibg=NONE")

				return true
			end,
		})

		autotag.setup({})

		vim.keymap.set("n", "[c", context.go_to_context, {
			noremap = true,
			silent = true,
			desc = "Jumping to context (upwards)",
		})
	end,
}
