local M = {}

--- @param callback fun(result: string):string
--- @return string
---
M.getparentmodule = function(callback)
	local file = debug.getinfo(callback, "S").source
	local parent = vim.fn.fnamemodify(file, ":h"):sub(2)
	local root = vim.fn.stdpath("config") .. "/lua/"

	parent = parent:gsub(root, ""):gsub("/", ".")

	return callback(parent)
end

return M
