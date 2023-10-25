--- Language:
---
--- Astro
---
--- Prerequisite:
---
--- npm install -g @astrojs/language-server
---

local lspconfig = require("lspconfig")

local _, capabilities = pcall(function()
	return require("cmp_nvim_lsp").default_capabilities()
end)

lspconfig.astro.setup({
	capabilities = capabilities,
})
