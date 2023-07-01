local cmp = require "cmp"
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local luasnip = require "luasnip"
local lspkind = require "lspkind"

require 'luasnip.loaders.from_vscode'.lazy_load {
	include = require 'jmsrsd.plugin.lsp.lib.filetypes'
}

luasnip.filetype_extend('dart', { 'flutter' })
luasnip.filetype_extend("all", { "_" })

cmp.setup({
	-- Keymappings
	mapping = require 'jmsrsd.plugin.cmp.lib.config.mapping' (cmp, cmp_select, luasnip),
	-- Behaviours
	preselect = cmp.PreselectMode.None,
	autocomplete = true,
	completion = {
		completeopt = 'menu,menuone',
	},
	-- UIs
	view = cmp.WildmenuEntriesConfig,
	window = require 'jmsrsd.plugin.cmp.lib.config.window',
	-- Completions
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp", keyword_length = 0, },
		{ name = "luasnip",  keyword_length = 0, },
		{
			name = "buffer",
			keyword_length = 0,
			option = { get_bufrns = require 'jmsrsd.plugin.cmp.lib.util.get-bufrns' }
		},
		{ name = "nvim_lua", keyword_length = 0, },
		{ name = "path",     keyword_length = 0, },
		{ name = "git",      keyword_length = 0, },
	},
	formatting = {
		fields = { 'menu', 'abbr', 'kind' },
		format = lspkind.cmp_format({
			mode = "text",
			max_width = 50,
			ellipsis_char = '...',
			menu = {
				nvim_lsp = "[Lsp]",
				luasnip = "[Snip]",
				buffer = "[Buf]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				git = "[Git]",
			},
		}),
	},
})
