local lsp_util = require("utils.lsp")

lsp_util.check_server_availability({

	bin = "cssmodules-language-server",

	install = "npm install -g cssmodules-language-server",

	name = "cssmodules_ls",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
