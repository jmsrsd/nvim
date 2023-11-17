local lsp = require("jmsrsd.utils.lsp")

lsp.check_server_availability({

	bin = "vscode-json-language-server",

	install = "npm i -g vscode-langservers-extracted",

	name = "jsonls",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,
	}
end