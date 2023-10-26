local server_bin = "intelephense"

local server_install = "npm install -g intelephense"

local server_name = "intelephense"

local lsp_util = require("utils.lsp")

lsp_util.ensure_server_installed(server_bin, server_install)

return function(lspconfig, capabilities)
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
