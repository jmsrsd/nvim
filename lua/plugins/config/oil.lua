local open_parent_directory = function()
	local close_buffers = require("plugins.config.close_buffers.util")

	pcall(vim.cmd.Oil)
	pcall(close_buffers.wipe_hiddens)
end

return {
	"stevearc/oil.nvim",

	lazy = false,

	--- Optional dependencies
	---
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},

	keys = {
		{ "-", open_parent_directory, desc = "Open Parent Directory" },
	},

	config = function()
		local oil = require("oil")

		oil.setup({
			view_options = {
				--- Show files and directories that start with "."
				---
				show_hidden = true,
			},
		})
	end,
}
