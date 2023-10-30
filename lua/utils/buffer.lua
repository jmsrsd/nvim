local M = {}

M.save_all = function()
	local cmd = function(command)
		vim.cmd(command)
	end

	local commands = { "w", "wa" }

	vim.tbl_map(function(command)
		pcall(cmd, command)
	end, commands)
end

M.quit_all = function()
	local cmd = function(command)
		vim.cmd(command)
	end

	local commands = { "w", "wa", "wqa", "qa!", 'exe "normal \\<CR>"' }

	vim.tbl_map(function(command)
		pcall(cmd, command)
	end, commands)
end

return M
