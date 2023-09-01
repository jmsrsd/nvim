return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-refactor" },
		{ "windwp/nvim-ts-autotag" },
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			--- A list of parser names, or "all"
			---
			ensure_installed = {
				"css",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"jsonc",
				"lua",
				"query",
				"scss",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
			},

			--- Install parsers synchronously (only applied to `ensure_installed`)
			---
			sync_install = true,

			--- Automatically install missing parsers when entering buffer
			--- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			---
			auto_install = true,

			--- List of parsers to ignore installing (for "all")
			---
			ignore_install = { "dart" },

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			--- nvim-treesitter/nvim-treesitter-refactor configs
			---
			refactor = {
				highlight_definitions = {
					enable = true,
					--- Set to false if you have an `updatetime` of ~100.
					---
					clear_on_cursor_move = false,
				},
				highlight_current_scope = { enable = false },
				smart_rename = {
					enable = true,
					--- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
					---
					keymaps = {
						smart_rename = "<leader>re",
					},
				},
				navigation = {
					enable = false,
					--- keymaps = {
					--- 	goto_definition = "gd",
					--- 	list_definitions = "gl",
					--- 	list_definitions_toc = "go",
					--- 	goto_next_usage = "gn",
					--- 	goto_previous_usage = "gp",
					--- },
				},
			},

			--- windwp/nvim-ts-autotag configs
			---
			autotag = {
				enable = true,
			},
		})
	end,
}
