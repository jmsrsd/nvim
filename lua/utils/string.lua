local M = {}

--- @param s string|number
--- @return string
---
M.trim = function(s)
	local result, _ = s:gsub("^%s*(.-)%s*$", "%1")

	return result
end

return M
