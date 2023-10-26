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

return function(lspconfig, capabilities)
	local server_name = "intelephense"
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
