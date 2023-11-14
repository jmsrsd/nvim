local number = require("jmsrsd.utils.number")

local M = {}

M.order = function(n)
	return number.maxFinite - n
end

return M
