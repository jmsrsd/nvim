local M = {}

M.describe = function(desc)
	return {
		noremap = true,
		silent = true,
		desc = desc,
	}
end

M.describeExpression = function(desc)
	local description = M.describe(desc)

	description.expr = true

	return description
end

M.unset = function(mode, lhs, opts)
	vim.keymap.del(mode, lhs, opts)
end

M.set = function(mode, lhs, rhs, opts)
	local unset = function()
		M.unset(mode, lhs, opts)
	end

	pcall(unset)

	vim.keymap.set(mode, lhs, rhs, opts)
end

return M
