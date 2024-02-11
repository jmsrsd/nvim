local path = require("jmsrsd.utils.path")

local import = function(module)
	return path.import(function(parent)
		return parent .. "/" .. module
	end, function() end)
end

local cmd = function(command)
	return pcall(function()
		return vim.cmd(command)
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
			local is_tsserver_filetype = (function()
				local filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"html",
					"astro",
				}

				for _, filetype in ipairs(filetypes) do
					if string.find(filetype, vim.bo.filetype) then
						return true
					end
				end

				return false
			end)()

			if is_tsserver_filetype then
				cmd("LspStop")
			end

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
