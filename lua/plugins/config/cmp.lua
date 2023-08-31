return {
	"hrsh7th/nvim-cmp",
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
		{ "amarakon/nvim-cmp-buffer-lines" },
		{ "roobert/tailwindcss-colorizer-cmp.nvim" },
	},
	config = function()
		-- Set up nvim-cmp.
		--
		local cmp_colorizer = require("tailwindcss-colorizer-cmp")

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		local cmp = require("cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp_colorizer.setup({
			color_square_width = 2,
		})

		cmp.config.formatting = {
			format = cmp_colorizer.formatter,
		}

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				--
				expand = function(args)
					-- For `luasnip` users.
					--
					require("luasnip").lsp_expand(args.body)
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
				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				--
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ priority = 109, name = "nvim_lsp" },
				{ priority = 108, name = "nvim_lsp_signature_help" },
				{ priority = 107, name = "nvim_lua" },
				{ priority = 106, name = "luasnip" },
				{ priority = 105, name = "treesitter" },
				{ priority = 104, name = "git" },
				{ priority = 103, name = "path" },
				{ priority = 102, name = "rg" },
				{ priority = 101, name = "buffer-lines" },
				{ priority = 100, name = "buffer" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				-- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				--
				{ name = "git" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		--
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		--
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
				{ name = "cmdline_history" },
			}),
		})
	end,
}
