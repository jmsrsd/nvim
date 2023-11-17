local M = {}

--- @param s string
--- @return string
---
M.trim = function(s)
	local result, _ = s:gsub("^%s*(.-)%s*$", "%1")

	return result
end

M.split = function(str, separator)
	if separator == nil then
		separator = "%s"
	end

	local result = {}

	for s in string.gmatch(str, "([^" .. separator .. "]+)") do
		table.insert(result, s)
	end

	return result
end

return M
