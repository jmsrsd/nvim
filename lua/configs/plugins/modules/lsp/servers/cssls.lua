local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "vscode-css-language-server",

	install = "npm i -g vscode-langservers-extracted",

	name = "cssls",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
