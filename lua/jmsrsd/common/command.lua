local try = require("jmsrsd.common.try")

return function(cmd)
	return try(function()
		return vim.cmd(cmd)
	end)
end
