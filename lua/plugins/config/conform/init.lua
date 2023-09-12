local util = require("plugins.config.conform.util")

return {
	"stevearc/conform.nvim",

	lazy = false,

	ft = util.ft,

	config = function()
		pcall(vim.cmd, "silent! !prettierd start")

		local conform = require("conform")

		conform.setup({
			formatters_by_ft = util.formatters_by_ft,

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
