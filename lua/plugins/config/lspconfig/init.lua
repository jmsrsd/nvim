local use = function(server)
	return require("plugins.config.lspconfig.config." .. server)
end

local util = require("keymaps.util")
local bind = util.bind

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "j-hui/fidget.nvim" },
		{ "rcarriga/nvim-notify" },
		{ "hrsh7th/nvim-cmp" },
		{ "stevearc/conform.nvim" },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		--- npm install -g @astrojs/language-server
		---
		lspconfig.astro.setup({
			capabilities = capabilities,
		})

		--- npm install -g cssmodules-language-server
		---
		lspconfig.cssmodules_ls.setup({ capabilities = capabilities })

		--- npm i -g vscode-langservers-extracted
		---
		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.eslint.setup({ capabilities = capabilities })
		lspconfig.jsonls.setup({ capabilities = capabilities })

		--- npm install -g @tailwindcss/language-server
		---
		lspconfig.tailwindcss.setup({ capabilities = capabilities })

		--- npm install -g typescript typescript-language-server
		---
		lspconfig.tsserver.setup({ capabilities = capabilities })

		--- brew install lua-language-server
		---
		lspconfig.lua_ls.setup(use("lua_ls").configure({
			capabilities = capabilities,
		}))

		--- Use LspAttach autocommand to only map the following keys
		--- after the language server attaches to the current buffer
		---
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local telescope = require("telescope.builtin")

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
					rhs = telescope.lsp_definitions,
					--- rhs = vim.lsp.buf.definition,
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
					rhs = telescope.lsp_implementations,
					--- rhs = vim.lsp.buf.implementation,
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
						vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()), vim.log.levels.INFO)
						--- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "gt",
					rhs = telescope.lsp_type_definitions,
					--- rhs = vim.lsp.buf.type_definition,
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
					rhs = telescope.lsp_references,
					--- rhs = vim.lsp.buf.references,
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
						telescope.diagnostics({
							bufnr = ev.buf,
							severity_limit = vim.diagnostic.severity.WARN,
							sort_by = "severity",
						})
					end,
					--- rhs = vim.diagnostic.setloclist,
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
