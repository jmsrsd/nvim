--- @diagnostic disable: duplicate-set-field, missing-fields
---

local M = {}

M.setup = function()
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

	--- @param message string|string[]
	--- @param level integer|string|nil
	--- @param opts table|nil
	---
	vim.notify = function(message, level, opts)
		local string = require("jmsrsd.utils.string")

		if type(message) ~= "string" then
			message = table.concat(message, " ")
		end

		--- Trim msg
		---
		message = string.trim(message)

		--- Should not notify when msg is empty
		---
		for _, blacklisted in ipairs(blacklist) do
			if message == blacklisted then
				return nil
			end
		end

		local ok, result = pcall(function()
			return notify.notify(message, level or "", opts or {})
		end)

		return ok and result or nil
	end
end

return M
