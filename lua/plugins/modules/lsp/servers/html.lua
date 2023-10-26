---@diagnostic disable: inject-field
---

--- Language:
---
--- Astro
---
--- Prerequisite:
---
--- npm i -g vscode-langservers-extracted
---

return function(lspconfig, capabilities)
	local server_name = "html"
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
