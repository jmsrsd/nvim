--- @diagnostic disable: duplicate-set-field, inject-field
---

local string = require("utils.string")

local import_all = function(name)
	local result = {}

	local modules = require("utils.import_all")(name, function() end)

	for key, value in pairs(modules) do
		key = string.split(key .. "", ".")
		key = key[#key]

		result[key] = value
	end

	return result
end

local get_capabilities = function()
	local result = vim.lsp.protocol.make_client_capabilities()

	local is_cmp_nvim_lsp_installed, cmp_nvim_lsp = pcall(function()
		return require("cmp_nvim_lsp")
	end)

	if is_cmp_nvim_lsp_installed then
		result = cmp_nvim_lsp.default_capabilities() or result
	end

	result.textDocument.completion.completionItem.snippetSupport = true

	return result
end

local setup_all = function(on_attach)
	local lspconfig = require("lspconfig")

	local capabilities = get_capabilities()

	local setups = import_all("servers")

	local skips = { "flutter" }

	for server, config in pairs(setups) do
		local opts = config(capabilities, on_attach)

		if table.concat(skips, ","):match(server) == nil then
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

			branch = "main",

			lazy = false,

			dependencies = {

				"nvim-lua/plenary.nvim",

				--- OPTIONAL for vim.ui.select
				---
				"stevearc/dressing.nvim",

				"nvim-telescope/telescope.nvim",
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

		local keymaps = import_all("keymaps")

		--- Configure Neovim LSP client(s)
		---
		setup_all(keymaps["lsp"].on_attach)

		--- Configure related keymaps
		---
		vim.tbl_map(function(keymap)
			return keymap.setup()
		end, keymaps)
	end,
}
