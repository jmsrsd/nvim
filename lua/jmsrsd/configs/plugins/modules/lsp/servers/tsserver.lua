local lsp = require("jmsrsd.utils.lsp")

lsp.check_server_availability({

	bin = "typescript-language-server",

	install = "npm install -g typescript typescript-language-server",

	name = "tsserver",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,
	}
end
