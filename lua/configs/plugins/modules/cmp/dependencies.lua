return {
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

		lazy = false,

		dependencies = {
			{ "rafamadriz/friendly-snippets", branch = "main", lazy = false },
		},

		config = function(_, opts)
			local luasnip = require("luasnip")

			if opts then
				luasnip.config.setup(opts)
			end

			--- To use existing
			---
			--- VS Code style snippets from a plugin
			---
			--- (eg. rafamadriz/friendly-snippets)
			---
			vim.tbl_map(function(type)
				require("luasnip.loaders.from_" .. type).lazy_load()
			end, { "vscode", "snipmate", "lua" })

			--- friendly-snippets
			---
			--- enable standardized
			---
			--- comments snippets
			---
			luasnip.filetype_extend("c", { "cdoc" })
			luasnip.filetype_extend("cpp", { "cppdoc" })
			luasnip.filetype_extend("cs", { "csharpdoc" })
			luasnip.filetype_extend("java", { "javadoc" })
			luasnip.filetype_extend("javascript", { "jsdoc" })
			luasnip.filetype_extend("kotlin", { "kdoc" })
			luasnip.filetype_extend("lua", { "luadoc" })
			luasnip.filetype_extend("php", { "phpdoc" })
			luasnip.filetype_extend("python", { "pydoc" })
			luasnip.filetype_extend("ruby", { "rdoc" })
			luasnip.filetype_extend("rust", { "rustdoc" })
			luasnip.filetype_extend("sh", { "shelldoc" })
			luasnip.filetype_extend("typescript", { "tsdoc" })

			--- friendly-snippets
			---
			--- enable custom
			---
			--- snippets
			---
			luasnip.filetype_extend("dart", { "flutter" })
		end,
	},
}