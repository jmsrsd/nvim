local cmd = function(arg)
	vim.cmd(arg)
end

local execute = function(command)
	pcall(cmd, command)
end

local M = {}

M.save_all = function()
	vim.tbl_map(execute, {
		"w",
		"wa",
	})
end

M.quit_all = function()
	vim.tbl_map(execute, {
		"w",
		"wa",
		"wqa",
		"qa!",
		'exe "normal \\<CR>"',
	})
end

return M
