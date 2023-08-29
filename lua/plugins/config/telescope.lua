return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local keymaps = require("keymaps.util")

		local bind = function(lhs, rhs)
			keymaps.bind({
				mode = keymaps.all_modes,
				lhs = lhs,
				rhs = rhs,
				opts = { noremap = true },
			})
		end

		local builtin = require("telescope.builtin")

		bind("<leader>ff", builtin.find_files)
		bind("<leader>fg", builtin.live_grep)
		bind("<leader>fb", builtin.buffers)
		bind("<leader>fh", builtin.help_tags)
	end,
}
