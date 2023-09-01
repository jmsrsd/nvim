local M = {}

M.tbl_map = function(tbl, f)
	local t = {}

	for k, v in pairs(tbl) do
		t[k] = f(k, v)
	end

	return t
end

return M
