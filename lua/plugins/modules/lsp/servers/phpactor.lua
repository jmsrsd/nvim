local server_bin = "phpactor"

local server_install = 'aria2c "https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar"'

local server_name = "phpactor"

local lsp_util = require("utils.lsp")

local is_server_bin_exist = lsp_util.is_server_bin_exist(server_bin)

if is_server_bin_exist == false then
	vim.notify(
		server_bin
			.. " doesn't exist."
			.. "\n"
			.. "Make sure its location is defined in PATH variable and it is installed via: "
			.. server_install
	)
end

return function(lspconfig, capabilities)
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
