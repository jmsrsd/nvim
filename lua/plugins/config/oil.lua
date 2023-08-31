local bind = require("keymaps.util").bind

return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local oil = require("oil")

		oil.setup({})

		bind({
			mode = { "n" },
			lhs = "-",
			rhs = "<CMD>Oil<CR>",
			opts = {
				silent = true,
				desc = "Open parent directory",
			},
		})
	end,
}
