return {
	"j-hui/fidget.nvim",

	branch = "main",

	event = "LspAttach",

	config = function()
		local fidget = require("fidget")

		fidget.setup({

			notification = {

				window = {

					winblend = 0,

					border = "rounded",
				},
			},
		})
	end,
}
