local catch = require("jmsrsd.commons.catch")

return function(f)
	return catch(f)()
end
