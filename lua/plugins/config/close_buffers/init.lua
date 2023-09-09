local bind = require("keymaps.util").bind
local util = require("plugins.config.close_buffers.util")

return {
	"kazhala/close-buffers.nvim",
	config = function()
		local close_buffers = require("close_buffers")

		close_buffers.setup({
			--- Filetype to ignore when running deletions
			---
			filetype_ignore = {},

			--- File name glob pattern to ignore when running deletions (e.g. '*.md')
			---
			file_glob_ignore = {},

			--- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
			---
			file_regex_ignore = {},

			--- Types of deletion that should preserve the window layout
			---
			preserve_window_layout = { "this", "nameless" },

			--- Custom function to retrieve the next buffer when preserving window layout
			---
			next_buffer_cmd = nil,
		})

		bind({
			mode = { "n" },
			lhs = "<leader><CR>",
			rhs = util.wipe_hiddens,
			opts = {
				noremap = true,
				desc = "Delete all hidden buffers",
			},
		})
	end,
}
