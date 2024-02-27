local priority = require("jmsrsd.utils.priority")

return {
	"folke/tokyonight.nvim",

	lazy = false,

	priority = priority.order(0),

	config = function()
		local tokyonight = require("tokyonight")

		tokyonight.setup({
			transparent = true,
		})

		vim.opt.winblend = 0
		vim.opt.pumblend = 0

		vim.cmd.colorscheme("tokyonight-storm")
	end,
}
