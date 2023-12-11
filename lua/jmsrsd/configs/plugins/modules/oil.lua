local path = require("jmsrsd.utils.path")

local import = function(module)
	return path.import(function(parent)
		return parent .. "/" .. module
	end, function() end)
end

return {

	"stevearc/oil.nvim",

	dependencies = {

		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local oil = require("oil")

		oil.setup({
			keymaps = {
				["<C-s>"] = false,
				["<C-h>"] = false,
				["<C-t>"] = false,
				["<C-l>"] = false,
				["gr"] = "actions.refresh",
			},
			view_options = {
				show_hidden = true,
			},
		})

		vim.keymap.set("n", "-", function()
			vim.cmd("Oil")

			local close_buffers = import("close_buffers/utils.lua")

			close_buffers.wipe_hidden_buffers()
		end, {

			noremap = true,
			silent = true,
			desc = "Open parent directory",
		})
	end,
}
