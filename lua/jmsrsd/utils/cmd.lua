local cmd = function(command)
	return vim.cmd(command)
end

local M = {}

M.execute = function(command)
	return pcall(cmd, command)
end

return M
