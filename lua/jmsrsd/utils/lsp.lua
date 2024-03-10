--- @class ServerOpts
--- @field bin string
--- @field install string
--- @field name string

--- @class LSP
---
local LSP = {}
LSP.__index = LSP

local _instance = nil

function LSP:_new(this)
	this = this or {}
	setmetatable(this, self)
	self.__index = self

	return this --[[@as LSP]]
end

function LSP:new()
	if _instance == nil then
		_instance = self:_new()
	end

	return _instance --[[@as LSP]]
end

--- @param server_bin string
---
function LSP:is_server_bin_exist(server_bin)
	local server_path = vim.fn.system("which" .. server_bin) .. ""
	local result = server_path:match("not found") ~= nil

	return result
end

--- @param server_bin string
--- @param server_install string
---
function LSP:ensure_server_installed(server_bin, server_install)
	local server_path = vim.fn.system("which " .. server_bin) .. ""

	if server_path:match("not found") ~= nil then
		vim.notify(server_path)
		vim.notify(vim.fn.system(server_install) .. "")
	end
end

--- @param server_opts ServerOpts
---
function LSP:check_server_availability(server_opts)
	local is_server_bin_exist = self:is_server_bin_exist(server_opts.bin)

	if not is_server_bin_exist then
		local message = server_opts.bin
			.. " doesn't exist."
			.. "\n\n"
			.. "Make sure its location is defined in PATH variable and it is installed via: "
			.. server_opts.install

		vim.notify(message, vim.log.levels.WARN)
	end

	return server_opts --[[@as ServerOpts]]
end

return LSP
