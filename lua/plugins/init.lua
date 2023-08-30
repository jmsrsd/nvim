-- Installation
--
local datapath = vim.fn.stdpath("data")
local lazypath = datapath .. "/lazy/lazy.nvim"
local lazy_installed = vim.fn.filereadable(lazypath) == 1

if not lazy_installed then
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
	--
	--     tokyonight.setup {
	--       style = 'night',
	--       transparent = true,
	--     }
	--
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
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {},
	},

	use("treesitter"),

	use("treesitter_context"),

	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					["lua"] = { "stylua" },
					["dart"] = { "dart_format" },
					["css"] = { "prettierd" },
					["html"] = { "prettierd" },
					["javascript"] = { "prettierd" },
					["typescript"] = { "prettierd" },
					["javascriptreact"] = { "prettierd" },
					["javascript.jsx"] = { "prettierd" },
					["typescriptreact"] = { "prettierd" },
					["typescript.tsx"] = { "prettierd" },
				},

				-- These options will be passed to conform.format()
				--
				format_on_save = {
					async = false,
					lsp_fallback = true,
					timeout_ms = 10000,
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
				timeout = 2000,
				top_down = false,
			})

			vim.notify = notify
		end,
	},

	use("telescope"),

	use("fidget"),

	use("cmp"),

	use("lspconfig"),

	use("flutter"),

	use("close_buffers"),
})
