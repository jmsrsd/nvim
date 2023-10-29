local lsp_util = require("utils.lsp")

lsp_util.check_server_availability({

	bin = "astro-ls",

	install = "npm install -g @astrojs/language-server",

	name = "astro",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
