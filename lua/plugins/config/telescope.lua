return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local keymaps = require("keymaps.util")

		local bind = function(lhs, rhs)
			rhs = ":Telescope " .. rhs .. "<CR>"

			keymaps.bind({
				mode = { "n" },
				lhs = lhs,
				rhs = rhs,
				opts = {
					silent = true,
					noremap = true,
					desc = rhs,
				},
			})
		end

		bind("<leader>ff", "find_files")
		bind("<leader>fg", "live_grep")
		bind("<leader>fb", "buffers")
		bind("<leader>fh", "help_tags")
	end,
}
