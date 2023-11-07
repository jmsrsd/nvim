local cmd = require("utils.cmd")

local execute = cmd.execute

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

M.quit = function(opts)
	local force = opts.force

	return execute("q" .. (force and "!" or ""))
end

M.close = function()
	M.save_all()
	M.quit({ force = true })
end

return M
