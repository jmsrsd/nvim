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

return function(lspconfig, capabilities)
	local server_name = "tsserver"
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
