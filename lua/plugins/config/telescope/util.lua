local M = {}

M.bind = function(lhs, rhs)
	rhs = ":Telescope " .. rhs .. "<CR>"

	require("keymaps.util").bind({
		mode = { "n" },
		lhs = lhs,
		rhs = rhs,
		opts = {
			silent = true,
			noremap = true,
			desc = rhs,
		},
	})
end

return M
