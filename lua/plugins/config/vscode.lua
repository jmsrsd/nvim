return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.background = "dark"

		local vscode = require("vscode")

		vscode.setup({
			style = "dark",
			transparent = true,
			italic_comments = true,
			disable_nvimtree_bg = true,
		})

		vscode.load(vim.o.background)
	end,
}
