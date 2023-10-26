local M = {}

M.is_server_bin_exist = function(server_bin)
	local server_path = vim.fn.system("which " .. server_bin) .. ""

	return server_path:match("not found") == nil
end

--- @param server_bin string
--- @param server_install string
---
M.ensure_server_installed = function(server_bin, server_install)
	local server_path = vim.fn.system("which " .. server_bin) .. ""

	if server_path:match("not found") ~= nil then
		vim.notify(server_path)
		vim.notify(vim.fn.system(server_install))
	end
end

return M
