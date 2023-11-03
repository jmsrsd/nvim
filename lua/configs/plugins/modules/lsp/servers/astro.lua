local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "astro-ls",

	install = "npm install -g @astrojs/language-server",

	name = "astro",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
