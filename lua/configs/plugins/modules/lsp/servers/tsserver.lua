local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "typescript-language-server",

	install = "npm install -g typescript typescript-language-server",

	name = "tsserver",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
