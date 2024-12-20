local catch = require("jmsrsd.common.catch")

return function(f)
	return catch(f)()
end
