local M = {}

M.slice = function(arr, first, last)
	local result = {}

	for k, v in ipairs(arr) do
		if k >= first and k <= last then
			table.insert(result, v)
		end
	end

	return result
end

return M
