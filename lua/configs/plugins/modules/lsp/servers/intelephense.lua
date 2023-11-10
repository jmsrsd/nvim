local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "intelephense",

	install = "npm install -g intelephense",

	name = "intelephense",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,
	}
end
