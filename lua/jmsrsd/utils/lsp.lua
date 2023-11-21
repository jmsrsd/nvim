--- Type definitions
---

--- @class ServerOpts
--- @field bin string
--- @field install string
--- @field name string

--- Module
---
local M = {}

--- @param server_bin string
---
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
		vim.notify(vim.fn.system(server_install) .. "")
	end
end

--- @param server_opts ServerOpts
---
M.check_server_availability = function(server_opts)
	local is_server_bin_exist = M.is_server_bin_exist(server_opts.bin)

	if not is_server_bin_exist then
		local message = server_opts.bin
			.. " doesn't exist."
			.. "\n\n"
			.. "Make sure its location is defined in PATH variable and it is installed via: "
			.. server_opts.install

		vim.notify(message, vim.log.levels.WARN)
	end

	--- @type ServerOpts
	---
	return server_opts
end

return M
