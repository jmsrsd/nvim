local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "vscode-html-language-server",

	install = "npm i -g vscode-langservers-extracted",

	name = "html",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
