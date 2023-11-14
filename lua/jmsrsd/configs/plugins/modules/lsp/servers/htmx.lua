local lsp = require("jmsrsd.utils.lsp")

local root_pattern = require("lspconfig.util").root_pattern

lsp.check_server_availability({

	bin = "htmx-lsp",

	install = "cargo install htmx-lsp",

	name = "htmx",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,

		filetypes = {

			"javascript",

			"javascriptreact",

			"javascript.jsx",

			"typescript",

			"typescriptreact",

			"typescript.tsx",

			"html",

			"astro",
		},

		root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
	}
end
