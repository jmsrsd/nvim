local lsp_util = require("utils.lsp")

local server_opts = lsp_util.check_server_availability({

	bin = "vscode-html-language-server",

	install = "npm i -g vscode-langservers-extracted",

	name = "html",
})

return function(lspconfig, capabilities)
	local server = lspconfig[server_opts.name]

	server.setup({
		capabilities = capabilities,
	})
end
