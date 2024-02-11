return {
	"folke/neoconf.nvim",

	"folke/neodev.nvim",

	"dnlhc/glance.nvim",

	"Hoffs/omnisharp-extended-lsp.nvim",

	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		},
		config = function(_, opts)
			local signature = require("lsp_signature")

			signature.setup(opts)
		end,
	},

	--- Flutter
	---
	"nvim-lua/plenary.nvim",
	"stevearc/dressing.nvim", -- OPTIONAL for vim.ui.select
	"nvim-telescope/telescope.nvim",
	"akinsho/flutter-tools.nvim",
}
