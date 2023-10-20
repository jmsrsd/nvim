local path_utils = require("utils.path")

--- @param callback fun(value: string): string
--- @return unknown
---
return function(callback)
	local module = path_utils.use_parent_module(callback)

	return require(module)
end
