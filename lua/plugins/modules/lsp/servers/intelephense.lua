local lsp_util = require("utils.lsp")

lsp_util.check_server_availability({

	bin = "intelephense",

	install = "npm install -g intelephense",

	name = "intelephense",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
