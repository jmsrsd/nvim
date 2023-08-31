return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional for vim.ui.select
		--
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({})
	end,
}
