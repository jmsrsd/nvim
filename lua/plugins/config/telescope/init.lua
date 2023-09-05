local basepath = "plugins.config.telescope"
local config = require(basepath .. ".config")
local bind = require(basepath .. ".util").bind

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-media-files.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local load_extension = telescope.load_extension

		telescope.setup(config.use())

		--- Default keybindings
		---
		bind("<leader>ff", "find_files")
		bind("<leader>fg", "live_grep")
		bind("<leader>fb", "buffers")
		bind("<leader>fh", "help_tags")

		--- To get fzf loaded and working with telescope, you need to call
		--- load_extension, somewhere after setup function:
		---
		load_extension("fzf")

		--- `Media files` configs
		---
		load_extension("media_files")

		bind("<leader>mf", "media_files")
	end,
}
