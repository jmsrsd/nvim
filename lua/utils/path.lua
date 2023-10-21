local M = {}

M.lua = vim.fn.stdpath("config") .. "/lua"

--- @param callback fun(result: string):string | nil
--- @return string
---
M.use_parent_module = function(callback)
	local file = debug.getinfo(callback, "S").source

	local parent = vim.fn.fnamemodify(file, ":h"):sub(2)

	parent = parent:gsub(M.lua .. "/", ""):gsub("/", ".")

	return callback(parent) or parent
end

M.use_parent_module_path = function(parent_module_callback)
	local parent_module = M.use_parent_module(parent_module_callback)

	local result = parent_module:gsub("%.", "/")

	result = M.lua .. "/" .. result

	return result
end

M.use_relative_module_path = function(module, parent_module_callback)
	local parent_path = M.use_parent_module_path(parent_module_callback)

	local result = parent_path .. "/" .. module

	return result
end

--- @param path string
--- @return string
---
M.to_module = function(path)
	local module = path:gsub(M.lua .. "/", ""):gsub("/", ".")

	--- Remove .lua extension
	---
	module = module:sub(1, -5)

	return module
end

return M
