--- @diagnostic disable: missing-fields
---

--- @param module string
---
local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. ".configs." .. module
	end, function() end)
end

return {

	"hrsh7th/nvim-cmp",

	event = "VeryLazy",

	dependencies = import("dependencies"),

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

				--- Accept currently selected item.
				---
				--- Set `select` to `false` to
				---
				--- only confirm explicitly selected items.
				---
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
			}),

			sources = import("sources"),
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
