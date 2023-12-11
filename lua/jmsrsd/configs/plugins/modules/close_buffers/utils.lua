local cmd = function(command)
	return pcall(function()
		return vim.cmd(command)
	end)
end

local M = {}

M.wipe_hidden_buffers = function()
	vim.tbl_map(cmd, {
		"wa",
		"wa",
		"BWipeout hidden",
		"BWipeout! hidden",
	})
end

return M
