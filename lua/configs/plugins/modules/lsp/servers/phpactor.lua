local lsp_util = require("utils.lsp")

lsp_util.check_server_availability({

	bin = "phpactor",

	install = 'aria2c "https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar"',

	name = "phpactor",
})

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
