local try = require("jmsrsd.commons.try")

return function(cmd)
	return try(function()
		return vim.cmd(cmd)
	end)
end
