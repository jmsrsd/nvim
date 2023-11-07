local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "astro-ls",

	install = "npm install -g @astrojs/language-server",

	name = "astro",
})

return function(capabilities, on_attach)
	return {
		capabilities = capabilities,
		on_attach = on_attach,
	}
end
