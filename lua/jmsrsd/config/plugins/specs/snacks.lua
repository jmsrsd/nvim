local common = {
	buffer = require("jmsrsd.common.buffer"),
	command = require("jmsrsd.common.command"),
}

return {
	"folke/snacks.nvim",

	lazy = false,

	---@type snacks.Config
	opts = {},

	keys = {
		{
			";d",
			function()
				common.buffer.save_all()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			";o",
			function()
				common.buffer.save_all()
				Snacks.bufdelete.other()
			end,
			desc = "Delete Other Buffers",
		},
		{
			";D",
			function()
				common.buffer.save_all()
				common.command("bd")
			end,
			desc = "Delete Buffer and Window",
		},
	},
}
