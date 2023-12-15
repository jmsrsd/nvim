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
