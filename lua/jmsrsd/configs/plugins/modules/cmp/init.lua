--- @diagnostic disable: missing-fields
---

--- @param module string
---
local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. "/configs/" .. module
	end, function() end)
end

return {

	"hrsh7th/nvim-cmp",

	branch = "main",

	event = "VeryLazy",

	dependencies = import("dependencies"),

	config = function()
		--- Set up nvim-cmp.
		---
		local lspkind = require("lspkind")

		local cmp = require("cmp")

		local snippet = {

			--- REQUIRED - you must specify a snippet engine
			---
			expand = function(args)
				--- For `luasnip` users.
				---
				local luasnip = require("luasnip")

				luasnip.lsp_expand(args.body)
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
			local string = require("jmsrsd.utils.string")

			--- Assign symbol and type
			---

			local symbol_type = lspkind.symbolic(vim_item.kind, "symbol")

			symbol_type = string.split(symbol_type, " ")

			if #symbol_type < 2 then
				symbol_type = { " ", symbol_type[1] }
			end

			local symbol = string.trim(symbol_type[1])

			local type = symbol_type[2]

			vim_item.kind = symbol ~= "" and symbol or ""

			vim_item.menu = type

			--- Prevent duplicates
			---

			local dup = {
				nvim_lsp = 0,
				nvim_lsp_signature_help = 0,
				nvim_lua = 0,
				luasnip = 0,
				treesitter = 1,
				emmet_vim = 0,
				path = 1,
				buffer = 1,
			}

			vim_item.dup = dup --[[@as unknown]]

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

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({

			snippet = snippet,

			completion = completion,

			window = window,

			formatting = formatting,

			mapping = cmp.mapping.preset.insert(mapping),

			sources = import("sources"),

			view = view,
		})

		--- Set configuration for specific filetype.
		---
		cmp.setup.filetype("gitcommit", {

			snippet = snippet,

			completion = completion,

			window = window,

			formatting = formatting,

			mapping = cmp.mapping.preset.insert(mapping),

			sources = {
				--- You can specify the `git` source if
				---
				--- [you were installed it](https://github.com/petertriho/cmp-git).
				---
				{ name = "git" },

				--- Buffer sources
				---
				{ name = "buffer" },
			},

			view = view,
		})

		--- Use buffer source for `/` and `?`
		---
		--- (if you enabled `native_menu`, this won't work anymore).
		---
		cmp.setup.cmdline({ "/", "?" }, {

			snippet = snippet,

			completion = completion,

			window = window,

			formatting = formatting,

			mapping = cmp.mapping.preset.cmdline(mapping),

			sources = {
				--- Buffer sources
				---
				{ name = "buffer" },
			},

			view = view,
		})

		--- Use cmdline & path source for ':'
		---
		--- (if you enabled `native_menu`, this won't work anymore).
		---
		cmp.setup.cmdline(":", {

			snippet = snippet,

			completion = completion,

			window = window,

			formatting = formatting,

			mapping = cmp.mapping.preset.cmdline(mapping),

			sources = {
				--- CMD sources
				---
				{ name = "cmdline" },
				{ name = "cmdline_history" },

				--- Path sources
				---
				{ name = "path" },

				--- Buffer sources
				---
				{ name = "buffer" },
			},

			view = view,
		})
	end,
}
