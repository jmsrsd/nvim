--- Language:
---
--- PHP
---
--- Prerequisite:
---
--- aria2c "https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar"
---

local lspconfig = require("lspconfig")

local _, capabilities = pcall(function()
	return require("cmp_nvim_lsp").default_capabilities()
end)

lspconfig.phpactor.setup({
	capabilities = capabilities,
})
