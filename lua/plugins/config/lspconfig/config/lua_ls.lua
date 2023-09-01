local M = {}

M.configure = function(opts)
	local capabilities = opts.capabilities

	return {
		on_init = function(client)
			local path = client.workspace_folders[1].name

			if
				vim.fn.filereadable(path .. "/.luarc.json") ~= 1
				and vim.fn.filereadable(path .. "/.luarc.jsonc") ~= 1
			then
				local runtime_path = vim.split(package.path, ";")
				table.insert(runtime_path, "lua/?.lua")
				table.insert(runtime_path, "lua/?/init.lua")

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					--- Disable telemetry
					---
					telemetry = {
						enable = false,
					},

					runtime = {
						--- Tell the language server which version of Lua you're using
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
				})

				client.config.settings.capabilities = capabilities

				client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
			end

			return true
		end,
	}
end

return M
