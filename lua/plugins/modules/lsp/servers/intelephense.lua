local lsp_util = require("utils.lsp")

local server_opts = lsp_util.check_server_availability({

	bin = "intelephense",

	install = "npm install -g intelephense",

	name = "intelephense",
})

return function(lspconfig, capabilities)
	local server = lspconfig[server_opts.name]

	server.setup({
		capabilities = capabilities,
	})
end
