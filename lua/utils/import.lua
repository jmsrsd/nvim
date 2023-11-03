local path = require("utils.path")

--- @param parent_module_callback fun(value: string): string
--- @return unknown
---
return function(parent_module_callback)
	local module = path.get_parent_module(parent_module_callback)

	return require(parent_module_callback(module))
end
