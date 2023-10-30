return {

	"kazhala/close-buffers.nvim",

	lazy = false,

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

		vim.keymap.set("n", "<leader><CR>", function()
			local cmd = function(command)
				vim.cmd(command)
			end

			local commands = { "wa", "wa", "BWipeout hidden", "BWipeout! hidden" }

			vim.tbl_map(function(command)
				pcall(cmd, command)
			end, commands)
		end, {
			noremap = true,
			silent = true,
			desc = "Save all and then wipe hidden buffers",
		})
	end,
}
