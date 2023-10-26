local server_bin = "vscode-html-language-server"

local server_install = "npm i -g vscode-langservers-extracted"

local server_name = "html"

local lsp_util = require("utils.lsp")

lsp_util.ensure_server_installed(server_bin, server_install)

return function(lspconfig, capabilities)
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
