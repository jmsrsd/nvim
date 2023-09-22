local M = {}

--- @params tbl table
--- @params f fun(key: string, value: any): any
--- @return table
---
M.map_table = function(tbl, f)
	local t = {}

	for key, value in pairs(tbl) do
		t[key] = f(key, value)
	end

	return t
end

return M
