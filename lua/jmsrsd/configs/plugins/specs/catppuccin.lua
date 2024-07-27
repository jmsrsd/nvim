return {
	"catppuccin/nvim",

	name = "catppuccin",

	lazy = false,

	config = function()
		require("catppuccin").setup({

			flavour = "mocha",

			transparent_background = true,
		})

		--- Make sure
		--- there is no other color
		--- when the background is transparent
		---
		vim.tbl_map(vim.cmd.highlight, {
			"Normal guibg=NONE",
			"NormalFloat guibg=NONE",
		})
	end,
}
