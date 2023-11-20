return {
	"folke/zen-mode.nvim",

	dependencies = {
		{
			"folke/twilight.nvim",

			config = function()
				local twilight = require("twilight")

				twilight.setup({})
			end,
		},
	},

	config = function()
		local zen = require("zen-mode")

		zen.setup({ window = { width = 86 } })

		local toggle = zen.toggle

		local describe = require("jmsrsd.utils.keymap").describe

		local set = vim.keymap.set

		set("n", "\\", toggle, describe("Toggle Zen Mode"))
	end,
}
