local path = require("jmsrsd.utils.path")

--- @param middleware fun(value: string): string
--- @return unknown
---
return function(middleware, source_callback)
	local module = path.get_parent_module(source_callback)

	return require(middleware(module))
end
