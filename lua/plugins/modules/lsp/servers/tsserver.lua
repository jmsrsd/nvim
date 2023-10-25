--- Language:
---
--- Typescript
---
--- Prerequisite:
---
--- npm install -g typescript typescript-language-server
---

local lspconfig = require("lspconfig")

local _, capabilities = pcall(function()
	return require("cmp_nvim_lsp").default_capabilities()
end)

lspconfig.tsserver.setup({
	capabilities = capabilities,
})
