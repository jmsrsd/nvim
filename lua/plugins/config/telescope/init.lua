local basepath = "plugins.config.telescope"
local config = require(basepath .. ".config")
local bind = require(basepath .. ".util").bind

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("telescope").setup(config.use())

		bind("<leader>ff", "find_files")
		bind("<leader>fg", "live_grep")
		bind("<leader>fb", "buffers")
		bind("<leader>fh", "help_tags")
	end,
}
