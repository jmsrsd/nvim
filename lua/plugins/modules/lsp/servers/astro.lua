local lsp_util = require("utils.lsp")

local server_opts = lsp_util.check_server_availability({

	bin = "astro-ls",

	install = "npm install -g @astrojs/language-server",

	name = "astro",
})

return function(lspconfig, capabilities)
	local server = lspconfig[server_opts.name]

	server.setup({
		capabilities = capabilities,
	})
end
