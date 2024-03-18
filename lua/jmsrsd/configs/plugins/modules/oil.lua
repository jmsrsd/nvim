local path = require("jmsrsd.utils.path") --[[@as Path]]

local import = function(module)
	return path.import(function(parent)
		return parent .. "/" .. module
	end, function() end)
end

local cmd = function(command)
	return pcall(function()
		local result = vim.cmd(command)

		vim.wait(100)

		return result
	end)
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
			local lsp = import("lsp/util.lua") --[[@as LspModuleUtil]]

			lsp.stop_lsp_servers_on_web_filetypes()

			cmd("Oil")

			local close_buffers = import("close_buffers/utils.lua")

			close_buffers.wipe_hidden_buffers()
		end, {

			noremap = true,
			silent = true,
			desc = "Open parent directory",
		})
	end,
}
