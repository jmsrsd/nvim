-- null-ls setup
local null_ls = require("null-ls")
local null_ls_utils = require("null-ls.utils")

local config = {
	update_in_insert = true,
	on_attach = require 'jmsrsd.plugin.lsp.lib.on-attach',
	source = {
		root_dir = null_ls_utils.root_pattern("composer.json", "package.json", "Makefile", ".git"), -- Add composer
		diagnostics_format = "#{m} (#{c}) [#{s}]",                                                -- Makes PHPCS errors more readeable
		sources = {
			null_ls.builtins.completion.spell,                                                      -- You still need to execute `:set spell`
			null_ls.builtins.diagnostics.eslint,                                                    -- Add eslint to js projects
			null_ls.builtins.diagnostics.phpcs,
			null_ls.builtins.formatting.stylua,                                                     -- You need to install stylua first: `brew install stylua`
			null_ls.builtins.formatting.phpcbf,
		},
	},
}

null_ls.setup(config)
