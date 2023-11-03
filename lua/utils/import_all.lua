local path = require("utils.path")

local string = require("utils.string")

--- @param name string
--- @param source_callback fun(parent_module: string): string | nil
---
return function(name, source_callback)
	local result = {}

	local import = function(module)
		return require("utils.import")(function(_)
			return module
		end, source_callback)
	end

	local dir = path.get_relative_module_path(name, source_callback)

	local files = string.split(vim.fn.glob(dir .. "/*"), "\n")

	local modules = vim.tbl_map(path.to_module, files)

	modules = string.split(table.concat(modules, ","), ",")

	for _, module in pairs(modules) do
		result[module] = import(module)
	end

	return result
end
