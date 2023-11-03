local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "intelephense",

	install = "npm install -g intelephense",

	name = "intelephense",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
