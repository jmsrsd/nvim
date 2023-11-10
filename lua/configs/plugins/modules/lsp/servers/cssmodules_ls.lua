local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "cssmodules-language-server",

	install = "npm install -g cssmodules-language-server",

	name = "cssmodules_ls",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,
	}
end
