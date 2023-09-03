local basepath = "plugins.config.telescope"
local config = require(basepath .. ".config")
local bind = require(basepath .. ".util").bind

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup(config.use())

		--- To get fzf loaded and working with telescope, you need to call
		--- load_extension, somewhere after setup function:
		telescope.load_extension("fzf")

		bind("<leader>ff", "find_files")
		bind("<leader>fg", "live_grep")
		bind("<leader>fb", "buffers")
		bind("<leader>fh", "help_tags")
	end,
}
