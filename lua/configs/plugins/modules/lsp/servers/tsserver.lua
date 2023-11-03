local lsp_util = require("utils.lsp")

lsp_util.check_server_availability({

	bin = "typescript-language-server",

	install = "npm install -g typescript typescript-language-server",

	name = "tsserver",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
