--- @diagnostic disable: duplicate-set-field, missing-fields
---

return {

	"rcarriga/nvim-notify",

	dependencies = {
		"nvim-telescope/telescope.nvim",
	},

	priority = require("utils.number").maxFinite - 1,

	config = function()
		vim.opt.termguicolors = true

		local notify = require("notify")

		notify.setup({

			background_colour = "#000000",

			timeout = 300,

			top_down = false,
		})

		local blacklist = {
			"",
			"No information available",
		}

		--- @param msg string
		--- @param level integer|nil
		--- @param opts table|nil
		---
		vim.notify = function(msg, level, opts)
			local string_util = require("utils.string")

			--- Trim msg
			---
			msg = string_util.trim(msg)

			--- Should not notify when msg is empty
			---
			for _, blacklisted in ipairs(blacklist) do
				if msg == blacklisted then
					return
				end
			end

			return notify(msg, level, opts)
		end
	end,
}
