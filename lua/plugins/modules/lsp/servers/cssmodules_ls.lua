local lsp_util = require("utils.lsp")

local server_opts = lsp_util.check_server_availability({

	bin = "cssmodules-language-server",

	install = "npm install -g cssmodules-language-server",

	name = "cssmodules_ls",
})

return function(lspconfig, capabilities)
	local server = lspconfig[server_opts.name]

	server.setup({
		capabilities = capabilities,
	})
end
