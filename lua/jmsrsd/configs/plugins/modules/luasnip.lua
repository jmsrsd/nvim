return {
	"L3MON4D3/LuaSnip",

	build = "make install_jsregexp",

	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	config = function()
		local luasnip = require("luasnip")

		--- To use existing
		---
		--- VS Code style snippets from a plugin
		---
		--- (eg. rafamadriz/friendly-snippets)
		---
		vim.tbl_map(function(type)
			return require("luasnip.loaders.from_" .. type).lazy_load()
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
}
