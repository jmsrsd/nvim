local path = require("jmsrsd.utils.path")

local string = require("jmsrsd.utils.string")

--- @param name string
--- @param source_callback fun(parent_module: string): string | nil
---
return function(name, source_callback)
	local result = {}

	local dir = path.get_relative_module_path(name, source_callback)

	local files = string.split(vim.fn.glob(dir .. "/*"), "\n")

	local modules = vim.tbl_map(path.to_module, files)

	for _, module in pairs(modules) do
		local module_split = string.split(module, ".")

		local module_name = module_split[#module_split]

		result[module_name] = require(module)
	end

	return result
end
