local lsp_util = require("utils.lsp")

lsp_util.check_server_availability({

	bin = "vscode-css-language-server",

	install = "npm i -g vscode-langservers-extracted",

	name = "cssls",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
