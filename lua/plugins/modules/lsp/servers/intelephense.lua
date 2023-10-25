---@diagnostic disable: inject-field
---

--- Language:
---
--- PHP
---
--- Prerequisite:
---
--- npm install -g intelephense
---

local lspconfig = require("lspconfig")

local _, capabilities = pcall(function()
	return require("cmp_nvim_lsp").default_capabilities()
end)

capabilities = capabilities or vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.intelephense.setup({
	capabilities = capabilities,
})
