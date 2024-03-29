local path = require("jmsrsd.utils.path") --[[@as Path]]

--- @param middleware fun(parent: string): string
--- @param source_callback SourceCallback
---
--- @return unknown
---
return function(middleware, source_callback)
	return path.import(middleware, source_callback)
end
