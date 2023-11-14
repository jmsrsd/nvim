local lsp = require("jmsrsd.utils.lsp")

lsp.check_server_availability({

	bin = "tailwindcss-language-server",

	install = "pnpm i -g @tailwindcss/language-server",

	name = "tailwindcss",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,
	}
end
