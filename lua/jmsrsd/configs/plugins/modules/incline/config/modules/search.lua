local string = require("jmsrsd.utils.string")

local M = {}

M.render = function()
	--- @type {current: number, total: number}
	---
	local count = vim.fn.searchcount({
		recompute = 1,
		maxcount = -1,
	}) or { current = 0, total = 0 }

	local contents = string.trim(vim.fn.getreg("/") .. "")

	return {
		{
			("  %s  "):format(string.trim((" %s"):format(contents))),
			group = "IncSearch",
		},
		{ " " },
		{
			(" %d/%d "):format(count.current, count.total),
			group = "dkoStatusValue",
		},
	}
end

return M
