local lsp = require("jmsrsd.utils.lsp")

local root_pattern = require("lspconfig.util").root_pattern

lsp.check_server_availability({

	bin = "cssmodules-language-server",

	install = "npm install -g cssmodules-language-server",

	name = "cssmodules_ls",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,

		root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
	}
end
