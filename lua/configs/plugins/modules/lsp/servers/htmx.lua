local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "htmx-lsp",

	install = "cargo install htmx-lsp",

	name = "htmx",
})

return function(capabilities)
	return {
		capabilities = capabilities,
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
