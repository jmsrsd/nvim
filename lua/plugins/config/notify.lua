return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			background_colour = "#000000",
			timeout = 700,
			top_down = false,
		})

		vim.notify = notify
	end,
}
