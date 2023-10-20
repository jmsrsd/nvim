local M = {}

M.lua = vim.fn.stdpath("config") .. "/lua"

--- @param callback fun(result: string):string | nil
--- @return string
---
M.use_parent_module = function(callback)
	local file = debug.getinfo(callback, "S").source
	local parent = vim.fn.fnamemodify(file, ":h"):sub(2)
	local root = M.lua .. "/"

	parent = parent:gsub(root, ""):gsub("/", ".")

	return callback(parent) or parent
end

M.use_parent_module_path = function(use_parent_module_callback)
	local callback = use_parent_module_callback

	local parent_module = M.use_parent_module(callback)

	local result, _ = parent_module:gsub("%.", "/")

	result = M.lua .. "/" .. result

	return result
end

M.use_relative_module_path = function(module, use_parent_module_callback)
	local callback = use_parent_module_callback

	local parent_path = M.use_parent_module_path(callback)

	local result = parent_path .. "/" .. module

	return result
end

M.to_module = function(path)
	local module, _ = path:gsub(M.lua .. "/", ""):gsub("/", ".")

	--- Remove .lua extension
	---
	module = module:sub(1, -5)

	return module
end

return M
