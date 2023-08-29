-- Installation
--
local datapath = vim.fn.stdpath("data")
local lazypath = datapath .. "/lazy/lazy.nvim"

if vim.fn.filereadable(lazypath) ~= 1 then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Setup
--
local bind = require("keymaps.util").bind
local use = require("plugins.util").use
local lazy = require("lazy")

lazy.setup({
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = "dark"

			local vscode = require("vscode")

			vscode.setup({
				transparent = true,
				italic_comments = true,
				disable_nvimtree_bg = true,
			})

			vscode.load(vim.o.background)
		end,
	},

	-- {
	--   'folke/tokyonight.nvim',
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     local tokyonight = require 'tokyonight'

	--     tokyonight.setup {
	--       style = 'night',
	--       transparent = true,
	--     }

	--     vim.cmd.colorscheme 'tokyonight-night'
	--   end,
	-- },

	{
		"xiyaowong/transparent.nvim",
		config = function()
			local transparent = require("transparent")

			transparent.setup({
				-- table: default groups
				--
				groups = {
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLineNr",
					"EndOfBuffer",
				},

				-- table: additional groups that should be cleared
				--
				extra_groups = {
					-- plugins which have float panel such as Lazy, Mason, LspInfo
					--
					"NormalFloat",

					-- NvimTree
					--
					"NvimTreeNormal",
				},

				-- table: groups you don't want to clear
				--
				exclude_groups = {},
			})

			pcall(vim.cmd.TransparentEnable)
		end,
	},

	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			local oil = require("oil")

			oil.setup({})

			bind({
				mode = { "n" },
				lhs = "-",
				rhs = "<CMD>Oil<CR>",
				opts = {
					silent = true,
					desc = "Open parent directory",
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-refactor" },
		},
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- A list of parser names, or "all"
				--
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

				-- Install parsers synchronously (only applied to `ensure_installed`)
				--
				sync_install = true,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				--
				auto_install = true,

				-- List of parsers to ignore installing (for "all")
				--
				ignore_install = { "dart" },

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				-- nvim-treesitter/nvim-treesitter-refactor configs
				--
				refactor = {
					highlight_definitions = {
						enable = true,
						-- Set to false if you have an `updatetime` of ~100.
						--
						clear_on_cursor_move = false,
					},
					highlight_current_scope = { enable = false },
					smart_rename = {
						enable = true,
						-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
						--
						keymaps = {
							smart_rename = "<leader>re",
						},
					},
					navigation = {
						enable = false,
						-- keymaps = {
						-- 	goto_definition = "gd",
						-- 	list_definitions = "gl",
						-- 	list_definitions_toc = "go",
						-- 	goto_next_usage = "gn",
						-- 	goto_previous_usage = "gp",
						-- },
					},
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			local context = require("treesitter-context")

			context.setup({
				-- Enable this plugin (Can be enabled/disabled later via commands)
				--
				enable = true,

				-- How many lines the window should span. Values <= 0 mean no limit.
				--
				max_lines = 0,

				-- Minimum editor window height to enable context. Values <= 0 mean no limit.
				--
				min_window_height = 0,

				line_numbers = true,

				-- Maximum number of lines to show for a single context
				--
				multiline_threshold = 20,

				-- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				--
				trim_scope = "outer",

				-- Line used to calculate context. Choices: 'cursor', 'topline'
				--
				mode = "cursor",

				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				--
				separator = "─",
				-- separator = nil,

				-- The Z-index of the context window
				--
				zindex = 20,

				-- (fun(buf: integer): boolean) return false to disable attaching
				--
				on_attach = nil,
			})

			bind({
				mode = { "n" },
				lhs = "[c",
				rhs = context.go_to_context,
				opts = {
					silent = true,
					desc = "Jumping to context (upwards)",
				},
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					css = { "prettierd" },
					html = { "prettierd" },
					javascript = { "prettierd" },
					typescript = { "prettierd" },
				},

				-- These options will be passed to conform.format()
				--
				format_on_save = {
					timeout_ms = 5000,
					lsp_fallback = true,
				},
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")

			notify.setup({
				background_colour = "#000000",
			})

			vim.notify = notify
		end,
	},

	use("telescope"),

	use("fidget"),

	use("cmp"),

	use("lspconfig"),
})
