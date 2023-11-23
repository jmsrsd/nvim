local lsp = require("jmsrsd.utils.lsp")

local root_pattern = require("lspconfig.util").root_pattern

lsp.check_server_availability({

	bin = "csharp-ls",

	install = "dotnet tool install --global csharp-ls",

	name = "csharp_ls",
})

return function(capabilities, on_attach)
	return {

		capabilities = capabilities,

		on_attach = on_attach,

		root_dir = root_pattern("*.sln", "*.csproj"),
	}
end

--- UNUSED: local lsp = require("jmsrsd.utils.lsp")
--- UNUSED:
--- UNUSED: lsp.check_server_availability({
--- UNUSED:
--- UNUSED: 	bin = "OmniSharp",
--- UNUSED:
--- UNUSED: 	install = 'aria2c "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.10/omnisharp-linux-x86.zip"',
--- UNUSED:
--- UNUSED: 	name = "omnisharp",
--- UNUSED: })
--- UNUSED:
--- UNUSED: return function(capabilities, on_attach)
--- UNUSED: 	return {
--- UNUSED:
--- UNUSED: 		capabilities = capabilities,
--- UNUSED:
--- UNUSED: 		on_attach = on_attach,
--- UNUSED:
--- UNUSED: 		--- UNUSED: cmd = { "dotnet", vim.fn.expand("~/src/omnisharp/OmniSharp.dll") },
--- UNUSED:
--- UNUSED: 		cmd = { vim.fn.expand("~/src/omnisharp/OmniSharp") },
--- UNUSED:
--- UNUSED: 		handlers = {
--- UNUSED: 			["textDocument/definition"] = require("omnisharp_extended").handler,
--- UNUSED: 		},
--- UNUSED: 	}
--- UNUSED: end
