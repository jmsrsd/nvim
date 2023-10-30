local lsp_util = require("utils.lsp")

lsp_util.check_server_availability({

	bin = "vscode-json-language-server",

	install = "npm i -g vscode-langservers-extracted",

	name = "jsonls",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
