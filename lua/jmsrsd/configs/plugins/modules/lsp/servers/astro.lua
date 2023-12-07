local lsp = require("jmsrsd.utils.lsp")

local root_pattern = require("lspconfig.util").root_pattern

lsp.check_server_availability({

	bin = "astro-ls",

	install = "pnpm install -g @astrojs/language-server",

	name = "astro",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,

		root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
	}
end
