local lsp = require("jmsrsd.utils.lsp"):new() --[[@as LSP]]

local path = require("jmsrsd.utils.path") --[[@as Path]]

local import = function(module)
	return path.import(function(parent)
		return parent .. module
	end, function() end)
end

local configure = function(server)
	local setup_ok, setup = pcall(function()
		return import("/configs/setups/" .. server)
	end)

	return setup_ok and setup
		or function(capabilities, on_attach)
			return {
				capabilities = capabilities,
				on_attach = on_attach,
			}
		end
end

local configs = import("/configs") --[[@as table]]

return function(capabilities, on_attach)
	return vim.tbl_map(function(config)
		lsp:check_server_availability(config)

		local name = config.name

		local setup = configure(name)

		local opts = setup(capabilities, on_attach)

		return {
			name = name,
			opts = opts,
		}
	end, configs)
end
