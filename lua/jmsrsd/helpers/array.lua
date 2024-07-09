local M = {}

M.remove_empty_strings = function(arr)
	local result = {}

	for _, str in ipairs(arr) do
		if str ~= "" then
			table.insert(result, str)
		end
	end

	return result
end

M.remove_duplicates = function(arr)
	local seen = {}

	local result = {}

	for _, value in ipairs(arr) do
		if not seen[value] then
			table.insert(result, value)
			seen[value] = true
		end
	end

	return result
end

M.slice = function(arr, from, to)
	local sliced = {}

	for i = from, to do
		table.insert(sliced, arr[i])
	end

	return sliced
end

return M
