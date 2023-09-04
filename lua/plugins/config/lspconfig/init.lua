local use = function(server_name)
	return require("plugins.config.lspconfig.config." .. server_name)
end

local util = require("keymaps.util")
local bind = util.bind

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "j-hui/fidget.nvim" },
		{ "rcarriga/nvim-notify" },
		{ "hrsh7th/nvim-cmp" },
		{ "stevearc/conform.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		local lspconfig = require("lspconfig")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local ensure_installed = {
			--- npm install -g @astrojs/language-server
			---
			"astro",

			--- npm install -g cssmodules-language-server
			---
			"cssmodules_ls",

			--- npm i -g vscode-langservers-extracted
			---
			"cssls",
			"eslint",
			"jsonls",

			--- npm install -g @tailwindcss/language-server
			---
			"tailwindcss",

			--- npm install -g typescript typescript-language-server
			---
			"tsserver",

			--- brew install lua-language-server
			---
			"lua_ls",
		}

		mason.setup({
			max_concurrent_installers = #ensure_installed,
		})

		mason_lspconfig.setup({
			ensure_installed = ensure_installed,

			handlers = {
				--- Default
				---
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup(use("lua_ls").configure({
						capabilities = capabilities,
					}))
				end,
			},
		})

		--- Use LspAttach autocommand to only map the following keys
		--- after the language server attaches to the current buffer
		---
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local trouble = require("trouble")

				--- Enable completion triggered by <c-x><c-o>
				---
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				--- Buffer local mappings.
				--- See `:help vim.lsp.*` for documentation on any of the below functions
				---
				local opts = { buffer = ev.buf }

				bind({
					mode = { "n" },
					lhs = "gD",
					rhs = vim.lsp.buf.declaration,
					opts = opts,
				})

				bind({
					mode = "n",
					lhs = "gd",
					rhs = function()
						trouble.open("lsp_definitions")
					end,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "K",
					rhs = vim.lsp.buf.hover,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "gi",
					rhs = function()
						trouble.open("lsp_implementations")
					end,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "gh",
					rhs = vim.lsp.buf.signature_help,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>wa",
					rhs = vim.lsp.buf.add_workspace_folder,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>wr",
					rhs = vim.lsp.buf.remove_workspace_folder,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<space>wl",
					rhs = function()
						local workspace_folders = vim.lsp.buf.list_workspace_folders()
						local msg = vim.inspect(workspace_folders)
						local level = vim.log.levels.INFO

						vim.notify(msg, level)

						--- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "gt",
					rhs = function()
						trouble.open("lsp_type_definitions")
					end,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>re",
					rhs = vim.lsp.buf.rename,
					opts = opts,
				})

				bind({
					mode = { "n", "v" },
					lhs = "<leader>aa",
					rhs = vim.lsp.buf.code_action,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>rr",
					rhs = function()
						trouble.open("lsp_references")
					end,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>fi",
					rhs = function()
						local conform = require("conform")

						conform.format({
							buf = vim.api.nvim_get_current_buf(),
							timeout_ms = 10000,
							async = false,
							lsp_fallback = true,
						})
						--- vim.lsp.buf.format({ async = false })
					end,
					opts = opts,
				})

				--- See `:help vim.diagnostic.*` for documentation on any of the below functions
				---
				bind({
					mode = { "n" },
					lhs = "[d",
					rhs = vim.diagnostic.open_float,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "]d",
					rhs = function()
						trouble.open("workspace_diagnostics")
					end,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "[g",
					rhs = vim.diagnostic.goto_prev,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "]g",
					rhs = vim.diagnostic.goto_next,
					opts = opts,
				})
			end,
		})
	end,
}
