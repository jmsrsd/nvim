local M = {}

-- Function to split a string by a delimiter and return a table of substrings
M.split = function(str, delimiter)
	local result = {}

	local start = 1

	local delimiter_start, delimiter_end = string.find(str, delimiter, start)

	while delimiter_start do
		table.insert(result, string.sub(str, start, delimiter_start - 1))

		start = delimiter_end + 1

		delimiter_start, delimiter_end = string.find(str, delimiter, start)
	end

	table.insert(result, string.sub(str, start))

	return result
end

-- Function to trim whitespace from the beginning and end of a string
M.trim = function(s)
	return s:match("^%s*(.-)%s*$")
end

-- Function to find the longest common substring between two strings
M.common = function(str1, str2)
	local len1, len2 = #str1, #str2
	local maxlen, endpos = 0, 0
	local mat = {}

	for i = 1, len1 do
		mat[i] = {}
		for j = 1, len2 do
			if str1:sub(i, i) == str2:sub(j, j) then
				if i == 1 or j == 1 then
					mat[i][j] = 1
				else
					mat[i][j] = mat[i - 1][j - 1] + 1
				end
				if mat[i][j] > maxlen then
					maxlen = mat[i][j]
					endpos = i
				end
			else
				mat[i][j] = 0
			end
		end
	end

	if maxlen == 0 then
		return ""
	else
		return str1:sub(endpos - maxlen + 1, endpos)
	end
end

return M
