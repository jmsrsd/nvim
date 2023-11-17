return {

	"stevearc/conform.nvim",

	event = "VeryLazy",

	config = function()
		local conform = require("conform")

		local format_opts = {

			timeout_ms = 5000,

			lsp_fallback = true,
		}

		local format = function()
			conform.format(format_opts)
		end

		conform.setup({
			--- These options will be passed to conform.format()
			---
			format_on_save = format_opts,

			formatters_by_ft = {

				astro = { "prettier" },

				php = { "php_cs_fixer" },

				lua = { "stylua" },

				json = { { "prettier", "prettierd" } },

				javascript = { { "prettier", "prettierd" } },

				javascriptreact = { { "prettier", "prettierd" } },

				jsx = { { "prettier", "prettierd" } },

				typescript = { { "prettier", "prettierd" } },

				typescriptreact = { { "prettier", "prettierd" } },

				tsx = { { "prettier", "prettierd" } },

				html = { { "prettier", "prettierd" } },

				css = { { "prettier", "prettierd" } },

				yaml = { { "prettier", "prettierd" } },

				markdown = { { "markdownlint" } },

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

		vim.keymap.set("n", "<leader>c", format, {
			noremap = true,
			silent = true,
			desc = "Format current buffer with conform.nvim",
		})
	end,
}
