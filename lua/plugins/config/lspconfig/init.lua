return {
	"neovim/nvim-lspconfig",
	cmd = "LspInfo",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "j-hui/fidget.nvim" },
		{ "rcarriga/nvim-notify" },
		{ "hrsh7th/nvim-cmp" },
		{ "stevearc/conform.nvim" },
	},
	config = function()
		local use = function(server_name)
			return require("plugins.config.lspconfig.config." .. server_name)
		end

		local bind = require("plugins.config.lspconfig.bind")

		local lspconfig = require("lspconfig")

		local default_capabilities = require("cmp_nvim_lsp").default_capabilities

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
			"efm",

			--- npm install -g @tailwindcss/language-server
			---
			"tailwindcss",

			--- brew install lua-language-server
			---
			"lua_ls",

			--- npm install -g typescript typescript-language-server
			---
			"tsserver",
		}

		for _, server_name in ipairs(server_names) do
			if server_name == "lua_ls" then
				lspconfig[server_name].setup(use(server_name).configure({
					on_attach = function(client)
						client.resolved_capabilities = default_capabilities()

						if client.config.flags then
							client.config.flags.allow_incremental_sync = true
						end

						client.resolved_capabilities.document_formatting = false
					end,
				}))
			elseif server_name == "efm" then
				-- local eslint_parser_options = " --no-eslintrc --parser-options="
				-- 	.. "ecmaVersion:6,"
				-- 	.. "sourceType:module,"
				-- 	.. "parser:@babel/eslint-parser"

				local eslint = {
					lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
					-- lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}" .. eslint_parser_options,
					lintStdin = true,
					lintFormats = { "%f:%l:%c: %m" },
					lintIgnoreExitCode = true,
					formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
					-- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}" .. eslint_parser_options,
					formatStdin = true,
				}

				lspconfig[server_name].setup({
					on_attach = function(client)
						client.resolved_capabilities = default_capabilities()

						client.resolved_capabilities.document_formatting = true
						client.resolved_capabilities.goto_definition = false
					end,
					root_dir = function()
						local function eslint_config_exists()
							local eslintrc = vim.fn.glob(".eslintrc*", false, 1)

							if not vim.tbl_isempty(eslintrc) then
								return true
							end

							if vim.fn.filereadable("package.json") then
								if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
									return true
								end
							end

							return false
						end

						if not eslint_config_exists() then
							return nil
						end

						return vim.fn.getcwd()
					end,
					settings = {
						languages = {
							["javascript"] = { eslint },
							["javascriptreact"] = { eslint },
							["javascript.jsx"] = { eslint },
							["typescript"] = { eslint },
							["typescript.tsx"] = { eslint },
							["typescriptreact"] = { eslint },
						},
					},
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescript.tsx",
						"typescriptreact",
					},
				})
			else
				lspconfig[server_name].setup({
					capabilities = default_capabilities(),
				})
			end
		end

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
