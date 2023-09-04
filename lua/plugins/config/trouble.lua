return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		--- your configuration comes here
		--- or leave it empty to use the default settings
		--- refer to the configuration section below
		---
		-- severity = vim.diagnostic.severity.WARN,

		--- for the given modes, include the declaration of the current symbol in the results
		---
		auto_jump = {
			"lsp_type_definitions",
			"lsp_references",
			"lsp_implementations",
			"lsp_definitions",
		},

		action_keys = {
			--- jump to the diagnostic or open / close folds
			---
			jump = { "<tab>", "<2-leftmouse>" },

			--- jump to the diagnostic and close the list
			---
			jump_close = { "<cr>", "o" },
		},
	},
}
