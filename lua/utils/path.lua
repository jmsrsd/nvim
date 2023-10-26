local M = {}

M.lua = vim.fn.stdpath("config") .. "/lua"

--- Get the parent directory of the
---
--- source file where
---
--- the `source_function` is defined.
---
--- @param source_function fun(result: string):string | nil
---
--- @return string
---
M.get_parent_module = function(source_function)
	local file = debug.getinfo(source_function, "S").source

	local parent = vim.fn.fnamemodify(file, ":h"):sub(2)

	parent = parent:gsub(M.lua .. "/", ""):gsub("/", ".")

	return parent
end

M.get_parent_module_path = function(source_function)
	local parent_module = M.get_parent_module(source_function)

	local result = parent_module:gsub("%.", "/")

	result = M.lua .. "/" .. result

	return result
end

M.get_relative_module_path = function(module, source_function)
	local parent_path = M.get_parent_module_path(source_function)

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
