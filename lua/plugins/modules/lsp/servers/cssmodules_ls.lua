--- Language:
---
--- CSS
---
--- Prerequisite:
---
--- npm install -g cssmodules-language-server
---

local lspconfig = require("lspconfig")

local _, capabilities = pcall(function()
	return require("cmp_nvim_lsp").default_capabilities()
end)

lspconfig.cssmodules_ls.setup({
	capabilities = capabilities,
})
