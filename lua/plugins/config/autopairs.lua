return {
	"windwp/nvim-autopairs",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter" },
	},
	event = "InsertEnter",
	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			check_ts = true,
		})

		autopairs.enable()
	end,
}
