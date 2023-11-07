local lsp = require("utils.lsp")

lsp.check_server_availability({

	bin = "deno",

	install = "brew install deno",

	name = "denols",
})

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

return function(capabilities)
	return {
		capabilities = capabilities,
	}
end
