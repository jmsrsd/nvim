return {

	"windwp/nvim-autopairs",

	event = "InsertEnter",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			check_ts = true,
		})

		autopairs.enable()
	end,
}
