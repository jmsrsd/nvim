local lspconfig = require("lspconfig")

local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "typescript-language-server",

	install = "npm install -g typescript typescript-language-server",

	name = "tsserver",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,

		root_dir = lspconfig.util.root_pattern("package.json"),

		single_file_support = false,
	}
end
