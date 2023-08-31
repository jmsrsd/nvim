local bind = require("keymaps.util").bind

return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local oil = require("oil")

		oil.setup({})

		bind({
			mode = { "n" },
			lhs = "-",
			rhs = function()
				local close_buffers = require("plugins.config.close_buffers.util")

				pcall(vim.cmd.Oil)
				pcall(close_buffers.wipe_hiddens)
			end,
			opts = {
				silent = true,
				desc = "Open parent directory",
			},
		})
	end,
}
