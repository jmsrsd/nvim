local M = {}

M.bind = function(params)
	vim.keymap.set(params.mode, params.lhs, params.rhs, params.opts)
end

-- Map Modes
-- n = Normal
-- v = Visual and Select
-- s = Select
-- x = Visual
-- o = Operator-pending
-- i = Insert
-- l = Insert, Command-line, Lang-Arg
-- c = Command-line
-- t = Terminal
--
M.all_modes = { "n", "v", "s", "x", "o", "i", "l", "c", "t" }

M.save = function()
	local filename = vim.fn.expand("%")

	pcall(vim.cmd.w)
	pcall(vim.cmd.wa)
	pcall(function()
		vim.cmd.bufdo("w")
	end)
	pcall(function()
		vim.cmd.edit(filename)
	end)
end

return M
