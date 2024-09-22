local helper = {
	keymap = require("jmsrsd.helpers.keymap"),
}

local set = helper.keymap.set

local describe = helper.keymap.describe

return {
	"zapling/mason-conform.nvim",

	dependencies = {
		"williamboman/mason.nvim",
		"stevearc/conform.nvim",
	},

	config = function()
		local conform = require("conform")

		local format_opts = {

			timeout_ms = 10000,

			lsp_fallback = true,
		}

		local format = function()
			return conform.format(format_opts)
		end

		conform.setup({
			--- These options will be passed to conform.format()
			---
			format_on_save = format_opts,

			formatters_by_ft = {

				glsl = { "clang-format" },

				astro = { { "prettier" }, { "prettierd" } },

				php = { "php_cs_fixer" },

				lua = { "stylua" },

				json = { { "prettier" }, { "prettierd" } },

				javascript = { { "prettier" }, { "prettierd" } },

				javascriptreact = { { "prettier" }, { "prettierd" } },

				jsx = { { "prettier" }, { "prettierd" } },

				typescript = { { "prettier" }, { "prettierd" } },

				typescriptreact = { { "prettier" }, { "prettierd" } },

				tsx = { { "prettier" }, { "prettierd" } },

				html = { { "prettier" }, { "prettierd" } },

				css = { { "prettier" }, { "prettierd" } },

				yaml = { { "prettier" }, { "prettierd" } },

				markdown = { "markdownlint" },

				--- Note:
				---
				--- trim_whitespace means using awk to
				---
				--- trim whitespaces
				---

				--- Use the "*" filetype to run formatters on all filetypes.
				---
				--- Prerequisite:
				---
				--- brew install codespell
				---
				["*"] = {

					-- "codespell",

					"trim_whitespace",
				},

				--- Use the "_" filetype to
				---
				--- run formatters on filetypes that don't
				---
				--- have other formatters configured.
				---
				["_"] = {

					-- "indent",

					-- "trim_whitespace",
				},
			},
		})

		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		set("n", "<leader>c", format, describe("Format current buffer with conform.nvim"))

		require("mason-conform").setup({})
	end,
}
