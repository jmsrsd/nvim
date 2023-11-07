local lsp = require("utils.lsp")

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
	}
end
