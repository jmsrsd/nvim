local basepath = "plugins.config.telescope"
local config = require(basepath .. ".config")

return {
	"nvim-telescope/telescope.nvim",

	branch = "master",
	-- branch = "0.1.x",

	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-media-files.nvim" },
	},

	keys = {
		--- Default keybindings
		---
		{ "<leader>f", ":Telescope find_files previewer=false<CR>", desc = "Find Files" },
		{ "<leader>g", ":Telescope live_grep<CR>", desc = "Live Grep" },
		{ "<leader>b", ":Telescope buffers previewer=false<CR>", desc = "Buffers" },
		{ "<leader>h", ":Telescope help_tags<CR>", desc = "Help Tags" },
		{ "<leader>/", ":Telescope current_buffer_fuzzy_find previewer=false<CR>", desc = "Fuzzy Find Current Buffer" },
		{ "<leader>m", ":Telescope media_files<CR>", desc = "Media Files" },
	},

	config = function()
		local telescope = require("telescope")
		local load_extension = telescope.load_extension

		telescope.setup(config.configure())

		--- To get fzf loaded and working with telescope, you need to call
		--- load_extension, somewhere after setup function:
		---
		load_extension("fzf")

		--- `Media files` configs
		---
		load_extension("media_files")

		--- `Flutter` configs
		---
		load_extension("flutter")
	end,
}
