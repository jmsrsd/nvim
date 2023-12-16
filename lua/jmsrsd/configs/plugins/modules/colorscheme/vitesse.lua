local priority = require("jmsrsd.utils.priority")

return {
	"2nthony/vitesse.nvim",

	dependencies = {
		"tjdevries/colorbuddy.nvim",
	},

	priority = priority.order(0),

	config = function()
		local vitesse = require("vitesse")

		vitesse.setup({})

		vim.opt.winblend = 0
		vim.opt.pumblend = 0

		vim.cmd.colorscheme("vitesse")
	end,
}
