local helper = {
	string = require("jmsrsd.helper.string"),
}

return {
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

			symbol_type = helper.string.split(symbol_type, " ")

			if #symbol_type < 2 then
				symbol_type = { " ", symbol_type[1] }
			end

			local symbol = helper.string.trim(symbol_type[1])

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
}
