local M = {}

M.describe = function(desc)
	return {
		noremap = true,
		silent = true,
		desc = desc,
	}
end

M.describeExpression = function(desc)
	return {
		expr = true,
		noremap = true,
		silent = true,
		desc = desc,
	}
end

return M
