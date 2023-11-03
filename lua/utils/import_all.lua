local path = require("utils.path")

local import = require("utils.import")

--- @param name string
--- @param source_callback fun(parent_module: string): string | nil
---
return function(name, source_callback)
	local result = {}

	local dir_path = path.get_relative_module_path(name, source_callback)

	local file_paths = vim.split(vim.fn.glob(dir_path .. "/*"), "\n")

	vim.tbl_map(function(file_path)
		if file_path == "" then
			return
		end

		local module = path.to_module(file_path)

		result[module] = import(function(_)
			return module
		end)
	end, file_paths)

	return result
end
