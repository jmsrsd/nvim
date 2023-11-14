local M = {}

M.maxFinite = (function()
	local num = -1

	local bin = string.format("%x", num)

	bin = string.reverse(bin)

	bin = string.gsub(bin, "0", "2")

	bin = string.gsub(bin, "1", "0")

	bin = string.gsub(bin, "2", "1")

	return tonumber(bin, 16)
end)()

return M
