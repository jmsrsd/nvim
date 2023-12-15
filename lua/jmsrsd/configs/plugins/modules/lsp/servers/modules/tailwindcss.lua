local lsp = require("jmsrsd.utils.lsp")

local root_pattern = require("lspconfig.util").root_pattern

lsp.check_server_availability({

	bin = "tailwindcss-language-server",

	install = "pnpm i -g @tailwindcss/language-server",

	name = "tailwindcss",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,

		root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
	}
end
