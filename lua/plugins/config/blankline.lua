return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local blankline = require("indent_blankline")

		blankline.setup({
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true,
		})
	end,
}
