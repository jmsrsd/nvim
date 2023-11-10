return {

	"petertriho/nvim-scrollbar",

	dependencies = {

		"kevinhwang91/nvim-hlslens",

		"lewis6991/gitsigns.nvim",
	},

	config = function()
		local scrollbar = require("scrollbar")

		local hlslens = require("hlslens")

		local search_handler = require("scrollbar.handlers.search").handler

		local gitsigns_handler = require("scrollbar.handlers.gitsigns")

		scrollbar.setup({})

		hlslens.setup({
			build_position_cb = function(plist, _, _, _)
				search_handler.show(plist.start_pos)
			end,
		})

		vim.cmd([[
        augroup scrollbar_search_hide
            autocmd!
            autocmd CmdlineLeave : lua search_handler.hide()
        augroup END
    ]])

		gitsigns_handler.setup({})
	end,
}
