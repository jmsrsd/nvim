local lsp_util = require("utils.lsp")

lsp_util.check_server_availability({

	bin = "htmx-lsp",

	install = "cargo install htmx-lsp",

	name = "htmx",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
