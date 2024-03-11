local path = require("jmsrsd.utils.path") --[[@as Path]]

local import = function(module)
	return path.import(function(parent)
		return parent .. "/" .. module
	end, function() end)
end

return import("tokyonight")
