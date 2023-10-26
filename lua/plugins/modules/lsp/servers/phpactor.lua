---@diagnostic disable: inject-field
---

--- Language:
---
--- PHP
---
--- Prerequisite:
---
--- aria2c "https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar"
---

return function(lspconfig, capabilities)
	local server_name = "phpactor"
	local server = lspconfig[server_name]

	server.setup({
		capabilities = capabilities,
	})
end
