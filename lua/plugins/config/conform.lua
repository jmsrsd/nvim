return {
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
