local maybe = require("jmsrsd.common.maybe")

local try = require("jmsrsd.common.try")

local helper = {
	keymap = require("jmsrsd.helper.keymap"),
}

local set = helper.keymap.set

local describe = helper.keymap.describe

local catch = require("jmsrsd.common.catch")

return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"nvim-telescope/telescope.nvim",
		"folke/neoconf.nvim",
		"folke/neodev.nvim",
		"williamboman/mason.nvim",
		{
			"williamboman/mason-lspconfig.nvim",
			version = "*",
		},
	},

	config = function()
		--- Configure default
		---
		--- lua_ls configs for
		---
		--- Neovim config development
		---
		require("neodev").setup({})

		--- Implement mechanism of
		---
		--- configuring lua_ls through
		---
		--- JSON files
		---
		require("neoconf").setup({})

		local telescope = require("telescope.builtin")

		vim.lsp.buf.definition = telescope.lsp_definitions
		vim.lsp.buf.type_definition = telescope.lsp_type_definitions
		vim.lsp.buf.implementation = telescope.lsp_implementations
		vim.lsp.buf.references = telescope.lsp_references

		local handlers = vim.lsp.handlers

		local overrides = {
			["textDocument/hover"] = handlers.hover,
			["textDocument/signatureHelp"] = handlers.signature_help,
		}

		for method, handler in pairs(overrides) do
			handlers[method] = vim.lsp.with(handler, { border = "rounded" })
		end

		--- Apply rounded border shapes
		---
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

		require("lspconfig.ui.windows").default_options.border = "rounded"

		local diagnostic = vim.diagnostic

		local diagnostics = function()
			return require("telescope.builtin").diagnostics({
				bufnr = nil,
				severity_limit = vim.diagnostic.severity.WARN,
				sort_by = "severity",
			})
		end

		--- Global mappings.
		---
		--- See `:help vim.diagnostic.*` for documentation on any of the
		---
		--- below functions
		---

		set("n", "[d", diagnostic.open_float, describe("Show diagnostics in a floating window."))

		set("n", "]d", diagnostics, describe("Lists diagnostics"))

		set("n", "[g", diagnostic.goto_prev, describe("Move to the previous diagnostic in the current buffer."))

		set("n", "]g", diagnostic.goto_next, describe("Move to the next diagnostic."))

		--- @diagnostic disable-next-line: unused-local
		local on_attach = function(client, bufnr)
			--- Buffer local mappings.
			---
			--- See `:help vim.lsp.*` for documentation on any of the
			---
			--- below functions
			---

			local lsp = vim.lsp.buf

			local describeBuffer = function(desc)
				local description = describe(desc)

				description.buffer = bufnr

				return description
			end

			set(
				"n",
				"gD",
				catch(lsp.declaration),
				describeBuffer("Jumps to the declaration of the symbol under the cursor.")
			)

			set(
				"n",
				"gd",
				catch(lsp.definition),
				describeBuffer("Jumps to the definition of the symbol under the cursor.")
			)

			set(
				"n",
				"gt",
				catch(lsp.type_definition),
				describeBuffer("Jumps to the definition of the type of the symbol under the cursor.")
			)

			set(
				"n",
				"gi",
				catch(lsp.implementation),
				describeBuffer("Lists all the implementations for the symbol under the cursor in the quickfix window.")
			)

			set(
				"n",
				"gr",
				catch(lsp.references),
				describeBuffer("Lists all the references to the symbol under the cursor in the quickfix window.")
			)

			set(
				"n",
				"K",
				catch(lsp.hover),
				describeBuffer(
					"Displays hover information about the symbol under the "
						.. "cursor in a floating window. Calling the "
						.. "function twice will jump into the floating window."
				)
			)

			set(
				"n",
				"<leader>k",
				catch(lsp.signature_help),
				describeBuffer("Displays signature information about the symbol under the cursor in a floating window.")
			)

			set(
				{ "n", "v" },
				"<leader>a",
				catch(lsp.code_action),
				describeBuffer("Selects a code action available at the current cursor position.")
			)

			set(
				"n",
				"<leader>r",
				catch(lsp.rename),
				describeBuffer("Renames all references to the symbol under the cursor.")
			)
		end

		local create_capabilities = function()
			local result = vim.lsp.protocol.make_client_capabilities()

			local cmp_nvim_lsp_installed, cmp_nvim_lsp = try(function()
				return require("cmp_nvim_lsp")
			end)

			if cmp_nvim_lsp_installed == true then
				cmp_nvim_lsp = maybe(cmp_nvim_lsp).getOrElse({
					default_capabilities = function()
						return result
					end,
				})

				result = cmp_nvim_lsp.default_capabilities()
			end

			result.textDocument.completion.completionItem.snippetSupport = true

			return result
		end

		local servers = {
			"astro",
			"cssls",
			"cssmodules_ls",
			"html",
			"lua_ls",
			"tailwindcss",
			"ts_ls",
			"jsonls",
			"glslls",
			"pyright",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		local lsp = require("lspconfig")

		for _, server in ipairs(servers) do
			local config = {

				capabilities = create_capabilities(),

				on_attach = on_attach,
			}

			if server == "pyright" then
				config.settings = {
					python = {
						--- Automatically use pyenv's active Python
						---
						pythonPath = vim.fn.systemlist("pyenv which python")[1],
					},
				}
			end

			if server == "ts_ls" then
				config.init_options = {
					preferences = {
						importModuleSpecifierPreference = "relative",
					},
				}
			end

			lsp[server].setup(config)
		end
	end,
}
