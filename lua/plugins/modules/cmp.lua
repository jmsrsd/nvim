--- @diagnostic disable: missing-fields
---

local cmp_primary_sources = {

	--- LSP
	---
	{ name = "nvim_lsp" },
	{ name = "nvim_lsp_signature_help" },

	--- Lua
	---
	{ name = "nvim_lua" },
	{ name = "luasnip" },

	--- Treesitter
	---
	{ name = "treesitter" },

	--- Emmet
	---
	{ name = "emmet_vim" },

	--- Git
	---
	{ name = "git" },

	--- Ripgrep
	---
	{ name = "rg" },

	--- Path sources
	---
	{ name = "fuzzy_path" },
	{ name = "path" },

	--- Buffer sources
	---
	{ name = "fuzzy_buffer" },
	{ name = "buffer" },
}

return {

	"hrsh7th/nvim-cmp",

	event = "InsertEnter",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"dmitmel/cmp-cmdline-history",
		"hrsh7th/nvim-cmp",

		"saadparwaiz1/cmp_luasnip",
		"windwp/nvim-autopairs",
		"lukas-reineke/cmp-rg",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"petertriho/cmp-git",
		"ray-x/cmp-treesitter",
		"onsails/lspkind.nvim",
		"tzachar/fuzzy.nvim",
		"tzachar/cmp-fuzzy-buffer",
		"tzachar/cmp-fuzzy-path",

		--- Emmet
		---
		"mattn/emmet-vim",
		"dcampos/cmp-emmet-vim",

		--- Snippets
		---
		{
			"L3MON4D3/LuaSnip",
			branch = "master",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
	},

	config = function()
		--- Set up nvim-cmp.
		---
		local cmp = require("cmp")

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({

			snippet = {

				--- REQUIRED - you must specify a snippet engine
				---
				expand = function(args)
					--- For `luasnip` users.
					---
					local luasnip = require("luasnip")

					luasnip.lsp_expand(args.body)

					--- To use existing VS Code style snippets from a plugin
					---
					--- (eg. rafamadriz/friendly-snippets)
					---
					vim.tbl_map(function(type)
						require("luasnip.loaders.from_" .. type).lazy_load()
					end, { "vscode", "snipmate", "lua" })

					--- friendly-snippets - enable standardized comments snippets
					---
					luasnip.filetype_extend("typescript", { "tsdoc" })
					luasnip.filetype_extend("javascript", { "jsdoc" })
					luasnip.filetype_extend("lua", { "luadoc" })
					luasnip.filetype_extend("python", { "pydoc" })
					luasnip.filetype_extend("rust", { "rustdoc" })
					luasnip.filetype_extend("cs", { "csharpdoc" })
					luasnip.filetype_extend("java", { "javadoc" })
					luasnip.filetype_extend("c", { "cdoc" })
					luasnip.filetype_extend("cpp", { "cppdoc" })
					luasnip.filetype_extend("php", { "phpdoc" })
					luasnip.filetype_extend("kotlin", { "kdoc" })
					luasnip.filetype_extend("ruby", { "rdoc" })
					luasnip.filetype_extend("sh", { "shelldoc" })
				end,
			},

			window = {

				completion = cmp.config.window.bordered(),

				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({

				["<C-b>"] = cmp.mapping.scroll_docs(-4),

				["<C-f>"] = cmp.mapping.scroll_docs(4),

				["<C-Space>"] = cmp.mapping.complete(),

				["<C-e>"] = cmp.mapping.abort(),

				--- Accept currently selected item. Set `select` to `false` to
				---
				--- only confirm explicitly selected items.
				---
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
			}),

			sources = cmp_primary_sources,
		})

		--- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = {
				--- You can specify the `git` source if
				---
				--- [you were installed it](https://github.com/petertriho/cmp-git).
				---
				{ name = "git" },

				--- Buffer sources
				---
				{ name = "fuzzy_buffer" },
				{ name = "buffer" },
			},
		})

		--- Use buffer source for `/` and `?`
		---
		--- (if you enabled `native_menu`, this won't work anymore).
		---
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				--- Buffer sources
				---
				{ name = "fuzzy_buffer" },
				{ name = "buffer" },
			},
		})

		--- Use cmdline & path source for ':'
		---
		--- (if you enabled `native_menu`, this won't work anymore).
		---
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				--- Path sources
				---
				{ name = "fuzzy_path" },
				{ name = "path" },

				--- CMD sources
				---
				{ name = "cmdline" },
				{ name = "cmdline_history" },
			},
		})
	end,
}
