local priority = require("jmsrsd.utils.priority")

return {

	"Exafunction/codeium.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},

	priority = priority.order(2),

	config = function()
		local codeium = require("codeium")

		codeium.setup({})
	end,
}
