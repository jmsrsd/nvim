local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "vscode-json-language-server",

	install = "npm i -g vscode-langservers-extracted",

	name = "jsonls",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
