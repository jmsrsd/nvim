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

	--- @param msg string|string[]
	--- @param level integer|string|nil
	--- @param opts table|nil
	---
	vim.notify = function(msg, level, opts)
		local string_util = require("utils.string")

		if type(msg) ~= "string" then
			msg = table.concat(msg, " ")
		end

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

		return notify.notify(msg, level or "", opts or {})
	end
end

return M
