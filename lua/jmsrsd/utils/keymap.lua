local M = {}

M.describe = function(desc)
	return {
		noremap = true,
		silent = true,
		desc = desc,
	}
end

M.describeBuffer = function(buffer, desc)
	local description = M.describe(desc)

	description.buffer = buffer

	return description
end

M.describeExpression = function(desc)
	local description = M.describe(desc)

	description.expr = true

	return description
end

return M
