local lsp_util = require("utils.lsp")

local server_opts = lsp_util.check_server_availability({

	bin = "typescript-language-server",

	install = "npm install -g typescript typescript-language-server",

	name = "tsserver",
})

return function(lspconfig, capabilities)
	local server = lspconfig[server_opts.name]

	server.setup({
		capabilities = capabilities,
	})
end
