local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "vscode-css-language-server",

	install = "npm i -g vscode-langservers-extracted",

	name = "cssls",
})

return function(capabilities, on_attach)
	return {
		capabilities = capabilities,
		on_attach = on_attach,
	}
end
