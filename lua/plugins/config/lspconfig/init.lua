return {
	"neovim/nvim-lspconfig",
	cmd = "LspInfo",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "j-hui/fidget.nvim" },
		{ "rcarriga/nvim-notify" },
		{ "hrsh7th/nvim-cmp" },
		{ "stevearc/conform.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "nvimdev/lspsaga.nvim" },
	},
	config = function()
		local use = function(server_name)
			return require("plugins.config.lspconfig.config." .. server_name)
		end

		local bind = require("plugins.config.lspconfig.bind")

		local lspconfig = require("lspconfig")

		local lspsaga = require("lspsaga")

		local default_capabilities = require("cmp_nvim_lsp").default_capabilities

		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		local server_names = {
			--- npm install -g @astrojs/language-server
			---
			"astro",

			--- npm install -g cssmodules-language-server
			---
			"cssmodules_ls",

			--- npm i -g vscode-langservers-extracted
			---
			"cssls",
			"jsonls",
			-- "eslint",

			--- npm install -g eslint_d
			--- brew install efm-langserver
			---
			-- "efm",

			--- npm install -g @tailwindcss/language-server
			---
			"tailwindcss",

			--- brew install lua-language-server
			---
			"lua_ls",

			--- npm install -g typescript typescript-language-server
			---
			"tsserver",

			--- curl https://c.quick-lint-js.com/quick-lint-js-release.key | sudo apt-key add -
			--- printf '\n# From: https://quick-lint-js.com/install/neovim/debian/\ndeb [arch=amd64,arm64] https://c.quick-lint-js.com/debian experimental main\n' | sudo tee /etc/apt/sources.list.d/quick-lint-js.list
			--- sudo apt-get update
			--- sudo apt-get install quick-lint-js quick-lint-js-vim
			---
			"quick_lint_js",
		}

		mason.setup({
			max_concurrent_installers = #server_names,
		})

		mason_lspconfig.setup({
			ensure_installed = server_names,

			handlers = {
				--- Default
				---
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = default_capabilities(),
					})
				end,

				["quick_lint_js"] = function()
					lspconfig["quick_lint_js"].setup({
						capabilities = default_capabilities(),

						filetypes = {
							"javascript",
							"javascriptreact",
							"javascript.jsx",
							"typescript",
							"typescriptreact",
							"typescript.tsx",
						},
					})
				end,

				["lua_ls"] = function()
					lspconfig["lua_ls"].setup(use("lua_ls").configure({
						on_attach = function(client)
							client.resolved_capabilities = default_capabilities()

							if client.config.flags then
								client.config.flags.allow_incremental_sync = true
							end

							client.resolved_capabilities.document_formatting = false
						end,
					}))
				end,
			},
		})

		lspsaga.setup({
			ui = {
				border = "rounded",
			},
		})

		--- Use LspAttach autocommand to only map the following keys
		--- after the language server attaches to the current buffer
		---
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				--- Enable completion triggered by <c-x><c-o>
				---
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				--- Buffer local mappings.
				--- See `:help vim.lsp.*` for documentation on any of the below functions
				---
				local opts = { buffer = ev.buf }

				bind(opts)
			end,
		})
	end,
}
