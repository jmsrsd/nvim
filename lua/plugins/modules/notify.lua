--- @diagnostic disable: duplicate-set-field, missing-fields
---

return {

	"rcarriga/nvim-notify",

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
			--- Trim msg
			---
			msg = msg:gsub("^%s*(.-)%s*$", "%1")

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
