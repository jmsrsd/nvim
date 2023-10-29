--- @diagnostic disable: duplicate-set-field, inject-field
---

local import_all = function(name)
	return require("utils.import_all")(name, function() end)
end

local get_capabilities = function()
	local result = vim.lsp.protocol.make_client_capabilities()

	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	pcall(function()
		result = cmp_nvim_lsp.default_capabilities() or result
	end)

	result.textDocument.completion.completionItem.snippetSupport = true

	return result
end

local setup_all = function()
	local lspconfig = require("lspconfig")

	local capabilities = get_capabilities()

	local setups = import_all("servers")

	local uniques = { "flutter" }

	for server, config in pairs(setups) do
		local opts = config(capabilities)

		server = vim.split(server, "%.")
		server = server[#server]

		if table.concat(uniques, ","):match(server) == nil then
			lspconfig[server].setup(opts)
		end
	end
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "folke/neoconf.nvim" },
		{ "folke/neodev.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{

			"akinsho/flutter-tools.nvim",

			lazy = false,

			dependencies = {

				"nvim-lua/plenary.nvim",

				--- OPTIONAL for vim.ui.select
				---
				"stevearc/dressing.nvim",
			},
		},
	},
	config = function()
		--- Configure default
		---
		--- lua_ls configs for
		---
		--- Neovim config development
		---
		local neodev = require("neodev")
		neodev.setup({})

		--- Implement mechanism of
		---
		--- configuring lua_ls through
		---
		--- JSON files
		---
		local neoconf = require("neoconf")
		neoconf.setup({})

		--- Override lsp functions
		---
		local telescope = require("telescope.builtin")

		vim.lsp.buf.definition = telescope.lsp_definitions
		vim.lsp.buf.type_definition = telescope.lsp_type_definitions
		vim.lsp.buf.implementation = telescope.lsp_implementations
		vim.lsp.buf.references = telescope.lsp_references

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {

			--- Use a sharp border with `FloatBorder` highlights
			---
			border = "rounded",
		})

		vim.diagnostic.config({
			float = {
				border = {
					{ "╭", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╮", "FloatBorder" },
					{ "│", "FloatBorder" },
					{ "╯", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╰", "FloatBorder" },
					{ "│", "FloatBorder" },
				},
			},
		})

		--- Configure Neovim LSP client(s)
		---
		setup_all()

		--- Configure related keymaps
		---
		import_all("keymaps")
	end,
}
