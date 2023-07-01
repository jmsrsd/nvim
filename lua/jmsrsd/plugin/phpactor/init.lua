return function(capabilities)
	local on_attach = require 'jmsrsd.plugin.lsp.lib.on-attach'

	require 'phpactor'.setup {
		install = {
			path = vim.fn.stdpath("data") .. "/opt/",
			branch = "master",
			bin = vim.fn.stdpath("data") .. "/opt/phpactor/bin/phpactor",
			php_bin = "php",
			composer_bin = "composer",
			git_bin = "git",
			check_on_startup = "none",
		},
		lspconfig = {
			enabled = true,
			options = {
				on_attach = require 'jmsrsd.plugin.lsp.lib.on-attach',
				capabilities = capabilities,
			},
		},
	}
end
