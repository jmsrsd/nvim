return {
	"hrsh7th/nvim-cmp",

	event = "InsertEnter",

	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "dmitmel/cmp-cmdline-history" },
		{ "hrsh7th/nvim-cmp" },
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "windwp/nvim-autopairs" },
		{ "lukas-reineke/cmp-rg" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "petertriho/cmp-git" },
		{ "ray-x/cmp-treesitter" },
		{ "onsails/lspkind.nvim" },
		{ "tzachar/fuzzy.nvim" },
		{ "tzachar/cmp-fuzzy-buffer" },
		{ "tzachar/cmp-fuzzy-path" },

		--- Emmet
		---
		{ "mattn/emmet-vim" },
		{ "dcampos/cmp-emmet-vim" },

		--- Codeium
		---
		{
			"Exafunction/codeium.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim" },
				{ "hrsh7th/nvim-cmp" },
			},
			config = function()
				local codeium = require("codeium")

				codeium.setup({})
			end,
		},
	},

	config = function()
		local util = require("util")

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		local cmp_primary_sources = {
			--- Codeium
			---
			{ name = "codeium" },

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

		local cmp_sort_sources = function(sources)
			return util.map_table(sources, function(k, v)
				v.priority = #sources - k - 1

				return v
			end)
		end

		--- Set up nvim-cmp.
		---
		local cmp = require("cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({
			formatting = require("plugins.config.cmp.config.formatting"),

			snippet = {
				--- REQUIRED - you must specify a snippet engine
				---
				expand = function(args)
					--- For `luasnip` users.
					---
					local luasnip = require("luasnip")

					luasnip.lsp_expand(args.body)
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
				--- only confirm explicitly selected items.
				---
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp_sort_sources(cmp_primary_sources),
		})

		--- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp_sort_sources({
				--- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				---
				{ name = "git" },

				--- Buffer sources
				---
				{ name = "fuzzy_buffer" },
				{ name = "buffer" },
			}),
		})

		--- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		---
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp_sort_sources({
				--- Buffer sources
				---
				{ name = "fuzzy_buffer" },
				{ name = "buffer" },
			}),
		})

		--- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		---
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp_sort_sources({
				--- Path sources
				---
				{ name = "fuzzy_path" },
				{ name = "path" },

				--- CMD sources
				---
				{ name = "cmdline" },
				{ name = "cmdline_history" },
			}),
		})
	end,
}