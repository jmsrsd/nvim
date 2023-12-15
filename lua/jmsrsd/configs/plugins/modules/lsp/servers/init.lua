local path = require("jmsrsd.utils.path")

local import = function(module)
	return path.import(function(parent)
		return parent .. module
	end, function() end)
end

--- @type table
---
local servers = {
	{
		bin = "astro-ls",
		install = "pnpm install -g @astrojs/language-server",
		name = "astro",
	},
	{
		bin = "bash-language-server",
		install = "pnpm i -g bash-language-server",
		name = "bashls",
	},
	{
		bin = "csharp-ls",
		install = "dotnet tool install --global csharp-ls",
		name = "csharp_ls",
	},
	{
		bin = "vscode-css-language-server",
		install = "pnpm i -g vscode-langservers-extracted",
		name = "cssls",
	},
	{
		bin = "cssmodules-language-server",
		install = "pnpm install -g cssmodules-language-server",
		name = "cssmodules_ls",
	},
	{
		bin = "flutter",
		install = "fvm install stable",
		name = "flutter",
	},
	{
		bin = "vscode-html-language-server",
		install = "pnpm i -g vscode-langservers-extracted",
		name = "html",
	},
	{
		bin = "htmx-lsp",
		install = "cargo install htmx-lsp",
		name = "htmx",
	},
	{
		bin = "intelephense",
		install = "pnpm install -g intelephense",
		name = "intelephense",
	},
	{
		bin = "vscode-json-language-server",
		install = "pnpm i -g vscode-langservers-extracted",
		name = "jsonls",
	},
	{
		bin = "lua-language-server",
		install = "brew install lua-language-server",
		name = "lua_ls",
	},
	{
		bin = "phpactor",
		install = 'aria2c "https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar"',
		name = "phpactor",
	},
	{
		bin = "tailwindcss-language-server",
		install = "pnpm i -g @tailwindcss/language-server",
		name = "tailwindcss",
	},
	{
		bin = "typescript-language-server",
		install = "pnpm install -g typescript typescript-language-server",
		name = "tsserver",
	},
}

local lsp = require("jmsrsd.utils.lsp")

return function(capabilities, on_attach)
	return vim.tbl_map(function(opts)
		lsp.check_server_availability(opts)

		local setup = import("modules/" .. opts.name)

		return {
			["name"] = opts.name,
			["opts"] = setup(capabilities, on_attach),
		}
	end, servers)
end
