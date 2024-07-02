local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"

	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local trim = function(s)
	local result, _ = s:gsub("^%s*(.-)%s*$", "%1")

	return result
end

local split = function(str, separator)
	if separator == nil then
		separator = "%s"
	end

	local result = {}

	for s in string.gmatch(str, "([^" .. separator .. "]+)") do
		table.insert(result, s)
	end

	return result
end

local describe = function(desc)
	return {
		noremap = true,
		silent = true,
		desc = desc,
	}
end

local set = function(mode, lhs, rhs, opts)
	pcall(function()
		vim.keymap.del(mode, lhs, opts)
	end)

	vim.keymap.set(mode, lhs, rhs, opts)
end

require("lazy").setup({
	ui = {
		border = "rounded",
	},

	change_detection = {
		notify = false,
	},

	spec = {
		{
			"Mofiqul/dracula.nvim",

			lazy = false,

			priority = 1000,

			config = function()
				local colors = require("dracula").colors()

				require("dracula").setup({

					transparent_bg = true,

					lualine_bg_color = colors["selection"],
				})

				vim.cmd([[colorscheme dracula]])
			end,
		},
		{
			"stevearc/oil.nvim",

			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},

			config = function()
				local oil = require("oil")

				oil.setup({

					keymaps = {
						["<C-s>"] = false,
						["<C-h>"] = false,
						["<C-t>"] = false,
						["<C-l>"] = false,
						["gr"] = "actions.refresh",
					},

					view_options = {
						show_hidden = true,
					},

					float = {
						win_options = {
							winblend = 100,
						},
					},

					preview = {
						win_options = {
							winblend = 100,
						},
					},

					progress = {
						win_options = {
							winblend = 100,
						},
					},
				})

				vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
					desc = "Open parent directory",
				})
			end,
		},
		{

			"nvim-treesitter/nvim-treesitter",

			branch = "master",

			build = ":TSUpdate",

			dependencies = {
				{ "nvim-treesitter/nvim-treesitter-context" },
				{ "windwp/nvim-ts-autotag" },
			},

			config = function()
				local treesitter = require("nvim-treesitter.configs")

				local context = require("treesitter-context")

				local autotag = require("nvim-ts-autotag")

				treesitter.setup({

					ensure_installed = {
						"c",
						"lua",
						"vim",
						"vimdoc",
						"query",
						"html",
					},

					sync_install = true,

					auto_install = true,

					ignore_install = { "dart" },

					highlight = {

						enable = true,

						additional_vim_regex_highlighting = false,
					},

					indent = {

						enable = true,
					},
				})

				context.setup({
					--- Enable this plugin (Can be enabled/disabled later via commands)
					---
					enable = true,

					--- How many lines the window should span. Values <= 0 mean no limit.
					---
					max_lines = 0,

					--- Minimum editor window height to enable context. Values <= 0 mean no limit.
					---
					min_window_height = 0,

					line_numbers = true,

					--- Maximum number of lines to show for a single context
					---
					multiline_threshold = 20,

					--- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
					---
					trim_scope = "outer",

					--- Line used to calculate context. Choices: 'cursor', 'topline'
					---
					mode = "cursor",

					--- Separator between context and content. Should be a single character string, like '-'.
					--- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
					---
					separator = "─",
					--- separator = nil,

					--- The Z-index of the context window
					---
					zindex = 20,

					--- (fun(buf: integer): boolean) return false to disable attaching
					---
					on_attach = function()
						vim.cmd("highlight TreesitterContext guibg=NONE")
						vim.cmd("highlight TreesitterContextSeparator guibg=NONE")

						return true
					end,
				})

				autotag.setup({})

				vim.keymap.set("n", "[c", context.go_to_context, {
					noremap = true,
					silent = true,
					desc = "Jumping to context (upwards)",
				})
			end,
		},
		{

			"windwp/nvim-autopairs",

			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},

			config = function()
				local autopairs = require("nvim-autopairs")

				autopairs.setup({ check_ts = true })

				autopairs.enable()
			end,
		},
		{

			"j-hui/fidget.nvim",

			lazy = false,

			config = function()
				--- Setup fidget.nvim
				---
				local fidget = require("fidget")

				fidget.setup({

					-- Options related to notification subsystem
					notification = {

						-- Options related to the notification window and buffer
						window = {

							normal_hl = "Comment", -- Base highlight group in the notification window

							winblend = 0, -- Background color opacity in the notification window

							border = "rounded", -- Border around the notification window

							border_hl = "NONE",

							zindex = 45, -- Stacking priority of the notification window

							max_width = 0, -- Maximum width of the notification window

							max_height = 0, -- Maximum height of the notification window

							x_padding = 0, -- Padding from right edge of window boundary

							y_padding = 0, -- Padding from bottom edge of window boundary

							relative = "editor", -- What the notification window position is relative to
						},
					},
				})

				--- Override vim.notify
				---

				local blacklisted_messages = {
					"",
					"No information available",
				}

				vim.notify = function(message, level, opts)
					if type(message) ~= "string" then
						message = table.concat(message, " ")
					end

					--- Trim msg
					---
					message = trim(message)

					--- Should not notify when msg is empty
					---
					for _, blacklisted in ipairs(blacklisted_messages) do
						blacklisted = trim(blacklisted)

						if string.lower(message) == string.lower(blacklisted) then
							return nil
						end
					end

					local ok, result = pcall(function()
						return fidget.notify(message, level, opts)
					end)

					return ok and result or nil
				end
			end,
		},
		{
			"folke/which-key.nvim",

			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,

			config = function()
				local which_key = require("which-key")

				which_key.setup()
			end,
		},
		{

			"nvim-telescope/telescope.nvim",

			dependencies = {

				{ "nvim-lua/plenary.nvim" },

				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

				{ "rcarriga/nvim-notify", lazy = false, opts = {} },
			},

			config = function()
				local telescope = require("telescope")

				local builtin = require("telescope.builtin")

				local actions = require("telescope.actions")

				local sorters = require("telescope.sorters")

				local previewers = require("telescope.previewers")

				local create_buffer_previewer_maker = function()
					local Job = require("plenary.job")

					return function(filepath, bufnr, opts)
						filepath = vim.fn.expand(filepath) .. ""

						Job:new({
							command = "file",
							args = { "--mime-type", "-b", filepath },
							on_exit = function(j)
								local mime_type = vim.split(j:result()[1], "/")[1]

								if mime_type == "text" then
									previewers.buffer_previewer_maker(filepath, bufnr, opts)
								else
									--- Maybe we want to write something to the buffer here
									---
									vim.schedule(function()
										vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {
											"   No preview available",
										})
									end)
								end
							end,
						}):sync()
					end
				end

				telescope.setup({
					defaults = {
						mappings = {
							n = {
								["<Esc>"] = false,
								["q"] = actions.close,
							},
						},

						vimgrep_arguments = {
							"rg",
							"-L",
							"--color=never",
							"--no-heading",
							"--no-ignore",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
							"--trim",
						},

						prompt_prefix = "   ",

						selection_caret = "  ",

						entry_prefix = "  ",

						initial_mode = "insert",

						selection_strategy = "reset",

						sorting_strategy = "ascending",

						--- Can be set with:
						---
						--- "vertical", or "horizontal"
						---
						layout_strategy = "vertical",

						layout_config = {
							vertical = {
								preview_height = 0.6,
								results_height = 0.4,
							},
						},

						file_sorter = sorters.get_fuzzy_file,

						file_ignore_patterns = { "node_modules" },

						generic_sorter = sorters.get_generic_fuzzy_sorter,

						path_display = { "truncate" },

						winblend = 0,

						border = {},

						borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

						color_devicons = true,

						--- DEFAULT: set_env = nil
						---
						set_env = { ["COLORTERM"] = "truecolor" },

						file_previewer = previewers.vim_buffer_cat.new,

						grep_previewer = previewers.vim_buffer_vimgrep.new,

						qflist_previewer = previewers.vim_buffer_qflist.new,

						buffer_previewer_maker = create_buffer_previewer_maker(),
					},
					pickers = {
						find_files = {
							--- `hidden = true` will still show the inside of `.git/` as it's not
							--- `.gitignore`d.
							---
							find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
						},
					},
				})

				--- Extensions
				---
				vim.tbl_map(telescope.load_extension, {
					"fzf",
					"notify",
				})

				--- Keymaps
				---

				set("n", "<leader>f", function()
					return builtin.find_files({
						follow = true,
						hidden = true,
						no_ignore = true,
						no_ignore_parent = true,
					})
				end, describe("Search for files"))

				set(
					"n",
					"<leader>g",
					builtin.live_grep,
					describe("Search for a string and get results live as you type")
				)

				set(
					"n",
					"<leader>b",
					builtin.buffers,
					describe("Lists open buffers in current neovim instance, opens selected buffer on `<cr>`")
				)

				set(
					"n",
					"<leader>/",
					builtin.current_buffer_fuzzy_find,
					describe("Live fuzzy search inside of the currently open buffer")
				)
			end,
		},
		{
			"numToStr/Comment.nvim",

			config = function()
				local comment = require("Comment")

				comment.setup({})
			end,
		},
		{
			"tpope/vim-fugitive",

			dependencies = {
				{ "lewis6991/gitsigns.nvim" },
			},

			config = function()
				set("n", "g;", "<CMD>Git<CR><C-w>L<C-w>=", describe("Show fugitive"))

				local gitsigns = require("gitsigns")

				gitsigns.setup({

					signs = {
						add = { text = "│" },
						change = { text = "│" },
						delete = { text = "_" },
						topdelete = { text = "‾" },
						changedelete = { text = "~" },
						untracked = { text = "┆" },
					},

					--- Toggle with `:Gitsigns toggle_signs`
					---
					signcolumn = true,

					--- Toggle with `:Gitsigns toggle_numhl`
					---
					numhl = false,

					--- Toggle with `:Gitsigns toggle_linehl`
					---
					linehl = false,

					--- Toggle with `:Gitsigns toggle_word_diff`
					---
					word_diff = false,

					watch_gitdir = {
						follow_files = true,
					},

					attach_to_untracked = true,

					--- Toggle with `:Gitsigns toggle_current_line_blame`
					---
					current_line_blame = false,

					current_line_blame_opts = {
						virt_text = true,

						--- 'eol' | 'overlay' | 'right_align'
						---
						virt_text_pos = "eol",

						delay = 1000,

						ignore_whitespace = false,
					},

					current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

					sign_priority = 6,

					update_debounce = 100,

					--- Use default
					---
					status_formatter = nil,

					--- Disable if file is longer than this (in lines)
					---
					max_file_length = 40000,

					preview_config = {
						--- Options passed to nvim_open_win
						---
						border = "single",
						style = "minimal",
						relative = "cursor",
						row = 0,
						col = 1,
					},
				})
			end,
		},
		{

			"utilyre/barbecue.nvim",

			name = "barbecue",

			version = "*",

			dependencies = {

				"SmiteshP/nvim-navic",

				--- optional dependency
				---
				"nvim-tree/nvim-web-devicons",
			},

			opts = {
				--- configurations go here
				---
			},
		},
		{
			"stevearc/dressing.nvim",

			config = function()
				local dressing = require("dressing")

				dressing.setup({

					input = {

						mappings = {

							n = {

								["<Esc>"] = false,

								["q"] = "Close",
							},
						},
					},
				})
			end,
		},
		{
			"nvim-lualine/lualine.nvim",

			config = function()
				local lualine = require("lualine")

				lualine.setup({
					options = {
						theme = "dracula-nvim",
					},
				})
			end,
		},
		{
			"christoomey/vim-tmux-navigator",
		},
		{
			"hrsh7th/nvim-cmp",

			dependencies = {
				"onsails/lspkind.nvim",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"ray-x/cmp-treesitter",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
			},

			config = function()
				local lspkind = require("lspkind")

				local cmp = require("cmp")

				local snippet = {
					expand = function(args)
						vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				}

				local completion = {
					completeopt = "menu,menuone",
				}

				local bordered = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:None,CursorLine:Visual,Search:None",
				})

				local window = {
					completion = bordered,

					documentation = bordered,
				}

				local formatting_format = function(_, vim_item)
					--- Assign symbol and type
					---

					local symbol_type = lspkind.symbolic(vim_item.kind, "symbol")

					symbol_type = split(symbol_type, " ")

					if #symbol_type < 2 then
						symbol_type = { " ", symbol_type[1] }
					end

					local symbol = trim(symbol_type[1])

					local type = symbol_type[2]

					vim_item.kind = symbol ~= "" and symbol or ""

					vim_item.menu = type

					--- Truncate text
					---

					local maxwidth = 20

					local ellipsis_char = "..."

					if vim.fn.strchars(vim_item.abbr) > maxwidth then
						vim_item.abbr = vim.fn.strcharpart(vim_item.abbr, 0, maxwidth) .. ellipsis_char
					end

					--- Done
					---

					return vim_item
				end

				local formatting = {

					expandable_indicator = true,

					fields = { "kind", "abbr", "menu" },

					format = formatting_format,
				}

				local mapping = {

					["<C-b>"] = cmp.mapping.scroll_docs(-4),

					["<C-f>"] = cmp.mapping.scroll_docs(4),

					["<C-Space>"] = cmp.mapping.complete(),

					["<C-e>"] = cmp.mapping.abort(),

					--- Accept currently selected item.
					---
					--- Set `select` to `false` to
					---
					--- only confirm explicitly selected items.
					---
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}

				local view = {
					docs = {
						auto_open = true,
					},
				}

				cmp.setup({

					snippet = snippet,

					completion = completion,

					window = window,

					formatting = formatting,

					mapping = cmp.mapping.preset.insert(mapping),

					view = view,

					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "nvim_lua" },
						{ name = "treesitter" },
						{ name = "buffer" },
					}),
				})

				--- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
				---
				cmp.setup.cmdline({ "/", "?" }, {

					completion = completion,

					window = window,

					formatting = formatting,

					mapping = cmp.mapping.preset.cmdline(mapping),

					view = view,

					sources = cmp.config.sources({
						{ name = "treesitter" },
						{ name = "buffer" },
					}),
				})

				--- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
				---
				cmp.setup.cmdline(":", {
					completion = completion,

					window = window,

					formatting = formatting,

					mapping = cmp.mapping.preset.cmdline(mapping),

					view = view,

					sources = cmp.config.sources({
						{ name = "cmdline" },
						{ name = "path" },
					}),

					matching = { disallow_symbol_nonprefix_matching = false },
				})
			end,
		},
		{
			"williamboman/mason.nvim",

			config = function()
				require("mason").setup()
			end,
		},
		{
			"neovim/nvim-lspconfig",

			dependencies = {
				"nvim-telescope/telescope.nvim",
				"folke/neoconf.nvim",
				"folke/neodev.nvim",
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
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

					local catch = function(f)
						return function()
							local ok, result = xpcall(f, function(error)
								return vim.notify(error .. "", vim.log.levels.ERROR)
							end)

							return ok and result or nil
						end
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
						describeBuffer(
							"Lists all the implementations for the symbol under the cursor in the quickfix window."
						)
					)

					set(
						"n",
						"gr",
						catch(lsp.references),
						describeBuffer(
							"Lists all the references to the symbol under the cursor in the quickfix window."
						)
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
						describeBuffer(
							"Displays signature information about the symbol under the cursor in a floating window."
						)
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

					local cmp_nvim_lsp_installed, cmp_nvim_lsp = pcall(function()
						return require("cmp_nvim_lsp")
					end)

					if cmp_nvim_lsp_installed then
						result = cmp_nvim_lsp.default_capabilities() or result
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
					"tsserver",
				}

				require("mason-lspconfig").setup({
					ensure_installed = servers,
				})

				vim.tbl_map(function(server)
					require("lspconfig")[server].setup({

						capabilities = create_capabilities(),

						on_attach = on_attach,
					})
				end, servers)
			end,
		},
		{
			"zapling/mason-conform.nvim",

			dependencies = {
				"williamboman/mason.nvim",
				"stevearc/conform.nvim",
			},

			config = function()
				local conform = require("conform")

				local format_opts = {

					timeout_ms = 10000,

					lsp_fallback = true,
				}

				local format = function()
					return conform.format(format_opts)
				end

				conform.setup({
					--- These options will be passed to conform.format()
					---
					format_on_save = format_opts,

					formatters_by_ft = {

						astro = { { "prettier", "prettierd" } },

						php = { { "php_cs_fixer" } },

						lua = { { "stylua" } },

						json = { { "prettier", "prettierd" } },

						javascript = { { "prettier", "prettierd" } },

						javascriptreact = { { "prettier", "prettierd" } },

						jsx = { { "prettier", "prettierd" } },

						typescript = { { "prettier", "prettierd" } },

						typescriptreact = { { "prettier", "prettierd" } },

						tsx = { { "prettier", "prettierd" } },

						html = { { "prettier", "prettierd" } },

						css = { { "prettier", "prettierd" } },

						yaml = { { "prettier", "prettierd" } },

						markdown = { { "markdownlint" } },

						--- Note:
						---
						--- trim_whitespace means using awk to
						---
						--- trim whitespaces
						---

						--- Use the "*" filetype to run formatters on all filetypes.
						---
						--- Prerequisite:
						---
						--- brew install codespell
						---
						["*"] = {

							-- "codespell",

							"trim_whitespace",
						},

						--- Use the "_" filetype to
						---
						--- run formatters on filetypes that don't
						---
						--- have other formatters configured.
						---
						["_"] = {

							-- "indent",

							-- "trim_whitespace",
						},
					},
				})

				vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

				vim.keymap.set("n", "<leader>c", format, {
					noremap = true,
					silent = true,
					desc = "Format current buffer with conform.nvim",
				})

				require("mason-conform").setup({})
			end,
		},
		{

			"cappyzawa/trim.nvim",

			opts = {
				trim_on_write = true,
				trim_trailing = true,
				trim_last_line = false,
				trim_first_line = false,
			},
		},
	},
})
