local lsp_util = require("utils.lsp")

local server_opts = lsp_util.check_server_availability({

	bin = "phpactor",

	install = 'aria2c "https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar"',

	name = "phpactor",
})

return function(lspconfig, capabilities)
	local server = lspconfig[server_opts.name]

	server.setup({
		capabilities = capabilities,
	})
end
