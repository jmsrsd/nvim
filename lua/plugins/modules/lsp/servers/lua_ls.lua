local lsp_util = require("utils.lsp")

local server_opts = lsp_util.check_server_availability({

	bin = "lua-language-server",

	install = "brew install lua-language-server",

	name = "lua_ls",
})

return function(lspconfig, capabilities)
	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	local server = lspconfig[server_opts.name]

	server.setup({

		capabilities = capabilities,

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
	})
end
