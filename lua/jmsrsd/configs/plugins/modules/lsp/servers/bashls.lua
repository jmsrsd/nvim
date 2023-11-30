local lsp = require("jmsrsd.utils.lsp")

lsp.check_server_availability({

	bin = "bash-language-server",

	install = "npm i -g bash-language-server",

	name = "bashls",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,
	}
end
