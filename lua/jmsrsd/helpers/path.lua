local M = {}

M.normalize = function(path)
	-- Expand path to resolve special characters and symbols
	local expanded = vim.fn.expand(path)

	-- Get the absolute path (resolved, normalized path)
	local absolute = vim.fn.fnamemodify(expanded, ":p")

	return absolute
end

return M
