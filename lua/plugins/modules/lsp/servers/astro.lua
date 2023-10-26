---@diagnostic disable: inject-field
---

--- Language:
---
--- Astro
---
--- Prerequisite:
---
--- npm install -g @astrojs/language-server
---

return function(lspconfig, capabilities)
	local server_name = "astro"
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
