local command = require("jmsrsd.commons.command")

local M = {}

M.save_all = function()
	vim.tbl_map(command, {
		"w",
		"wa",
	})
end

M.quit = function(opts)
	return command("q" .. (opts.force and "!" or ""))
end

M.quit_all = function()
	vim.tbl_map(command, {
		"w",
		"wa",
		"wqa",
		"qa!",
		'exe "normal \\<CR>"',
	})
end

M.close = function()
	M.save_all()
	M.quit({ force = true })
end

return M
