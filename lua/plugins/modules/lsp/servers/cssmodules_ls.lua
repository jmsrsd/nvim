local server_bin = "cssmodules-language-server"

local server_install = "npm install -g cssmodules-language-server"

local server_name = "cssmodules_ls"

local lsp_util = require("utils.lsp")

lsp_util.ensure_server_installed(server_bin, server_install)

return function(lspconfig, capabilities)
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
