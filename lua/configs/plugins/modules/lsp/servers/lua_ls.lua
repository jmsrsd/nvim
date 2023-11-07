local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "lua-language-server",

	install = "brew install lua-language-server",

	name = "lua_ls",
})

return function(capabilities, on_attach)
	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	return {

		capabilities = capabilities,

		on_attach = on_attach,

		settings = {

			Lua = {
				--- Disable telemetry
				---
				telemetry = {
					enable = false,
				},

				runtime = {
					--- Tell the language server which version of
					---
					--- Lua you're using
					---
					--- (most likely LuaJIT in the case of Neovim)
					---
					version = "LuaJIT",
					path = runtime_path,
				},

				diagnostics = {
					--- Get the language server to recognize the `vim` global
					---
					globals = { "vim" },
				},

				workspace = {
					checkThirdParty = false,
					library = {
						--- Make the server aware of Neovim runtime files
						---
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.stdpath("config") .. "/lua",
					},
				},
			},
		},
	}
end
