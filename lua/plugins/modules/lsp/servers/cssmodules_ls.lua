---@diagnostic disable: inject-field
---

--- Language:
---
--- CSS
---
--- Prerequisite:
---
--- npm install -g cssmodules-language-server
---

return function(lspconfig, capabilities)
	local server_name = "cssmodules_ls"
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
