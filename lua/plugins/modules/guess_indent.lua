return {
	"NMAC427/guess-indent.nvim",
	config = function()
		local guess_indent = require("guess-indent")

		guess_indent.setup({
			auto_cmd = false,
		})

		vim.keymap.set("n", "<leader>=", "<CMD>GuessIndent<CR>", {
			noremap = true,
			silent = true,
			desc = "Detect and apply indentation style",
		})
	end,
}
