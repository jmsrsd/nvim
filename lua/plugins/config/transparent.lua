return {
	"xiyaowong/transparent.nvim",
	config = function()
		local transparent = require("transparent")

		transparent.setup({
			-- table: default groups
			--
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"EndOfBuffer",
			},

			-- table: additional groups that should be cleared
			--
			extra_groups = {
				-- plugins which have float panel such as Lazy, Mason, LspInfo
				--
				"NormalFloat",

				-- NvimTree
				--
				"NvimTreeNormal",
			},

			-- table: groups you don't want to clear
			--
			exclude_groups = {},
		})

		pcall(vim.cmd.TransparentEnable)
	end,
}
