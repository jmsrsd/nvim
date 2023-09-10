return {
	"stevearc/conform.nvim",

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				["dart"] = { "dart_format" },
				["astro"] = { "prettierd" },
				["css"] = { "prettierd" },
				["html"] = { "prettierd" },
				["javascript"] = { "prettierd" },
				["javascript.jsx"] = { "prettierd" },
				["javascriptreact"] = { "prettierd" },
				["lua"] = { "stylua" },
				["svelte"] = { "prettierd" },
				["typescript"] = { "prettierd" },
				["typescript.tsx"] = { "prettierd" },
				["typescriptreact"] = { "prettierd" },
				["vue"] = { "prettierd" },
			},

			--- These options will be passed to conform.format()
			---
			format_on_save = {
				async = false,
				lsp_fallback = true,
				timeout_ms = 10000,
			},
		})
	end,
}
