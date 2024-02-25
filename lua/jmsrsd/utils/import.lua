--- @type PathUtil
---
local path = require("jmsrsd.utils.path"):new()

--- @param middleware fun(value: string): string
---
--- @return unknown
---
return function(middleware, source_callback)
	local parent = path:get_parent_module(source_callback)
	local module = middleware(parent)

	while module:match("%.%.") do
		module = module:gsub("%.%.", "%.")
	end

	local result = require(module)

	return result
end
