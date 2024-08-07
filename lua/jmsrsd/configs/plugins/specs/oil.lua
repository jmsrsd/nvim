return {
	"stevearc/oil.nvim",

	lazy = false,

	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = {} },
	},

	config = function()
		local oil = require("oil")

		oil.setup({

			keymaps = {
				["<C-s>"] = false,
				["<C-h>"] = false,
				["<C-t>"] = false,
				["<C-l>"] = false,
				["gr"] = "actions.refresh",
			},

			view_options = {
				show_hidden = true,
			},

			float = {
				win_options = {
					winblend = 0,
				},
			},
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
			desc = "Open parent directory",
		})
	end,
}
