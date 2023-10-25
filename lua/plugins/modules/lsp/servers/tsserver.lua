---@diagnostic disable: inject-field
---

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

capabilities = capabilities or vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.tsserver.setup({
	capabilities = capabilities,
})
