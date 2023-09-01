local util = require("keymaps.util")
local bind = util.bind
local all_modes = util.all_modes
local save = util.save

-- Copy-related bindings
--
bind({
	mode = { "n" },
	lhs = "<leader>y",
	rhs = '"+y',
	opts = {
		noremap = true,
		desc = "Copy to the system clipboard",
	},
})

bind({
	mode = { "n" },
	lhs = "<leader>Y",
	rhs = '"+Y',
	opts = {
		noremap = true,
		desc = "Copy to the system clipboard",
	},
})

bind({
	mode = { "v" },
	lhs = "<leader>y",
	rhs = '"+y',
	opts = {
		noremap = true,
		desc = "Copy to the system clipboard",
	},
})

-- Delete-related bindings
--
bind({
	mode = { "n" },
	lhs = "x",
	rhs = '"_x',
	opts = {
		noremap = true,
		desc = "Delete current line and copy to the black hole register",
	},
})

bind({
	mode = { "n" },
	lhs = "dw",
	rhs = 'vb"_d',
	opts = {
		noremap = true,
		desc = "Delete current word without saving it to the default register",
	},
})

-- Disabled keymamps bindings
--
bind({
	mode = { "n" },
	lhs = "Q",
	rhs = "<nop>",
	opts = {
		noremap = true,
		desc = "Disabled",
	},
})

bind({
	mode = { "n" },
	lhs = "q",
	rhs = "<nop>",
	opts = {
		noremap = true,
		desc = "Disabled",
	},
})

-- Editing bindings
--
bind({
	mode = { "n" },
	lhs = "J",
	rhs = "mzJ`z",
	opts = {
		noremap = true,
		desc = "Remove newline at the end of the line",
	},
})

bind({
	mode = { "n" },
	lhs = "<C-a>",
	rhs = "gg<S-v>G",
	opts = {
		noremap = true,
		desc = "Select [a]ll",
	},
})

bind({
	mode = { "v" },
	lhs = "J",
	rhs = ":m '>+1<CR>gv=gv",
	opts = {
		noremap = true,
		desc = "Move down the selected line in visual mode",
	},
})

bind({
	mode = { "v" },
	lhs = "K",
	rhs = ":m '<-2<CR>gv=gv",
	opts = {
		noremap = true,
		desc = "Move up the selected line in visual mode",
	},
})

bind({
	mode = { "n" },
	lhs = "<leader>s",
	rhs = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	opts = {
		noremap = true,
		desc = "Replace all word occurrences",
	},
})

-- Escape keymaps bindings
--
bind({
	mode = all_modes,
	lhs = "<C-c>",
	rhs = "<ESC>",
	opts = {
		noremap = true,
		desc = "Escape key functionality in all modes",
	},
})

bind({
	mode = all_modes,
	lhs = "<C-;>",
	rhs = "<ESC>",
	opts = {
		noremap = true,
		desc = "Escape key functionality in all modes",
	},
})

bind({
	mode = { "i", "l" },
	lhs = "jj",
	rhs = "<ESC>",
	opts = {
		noremap = true,
		desc = "Escape key functionality in all modes",
	},
})

bind({
	mode = { "i", "l" },
	lhs = "jk",
	rhs = "<ESC>",
	opts = {
		noremap = true,
		desc = "Escape key functionality in all modes",
	},
})

-- Motion-related bindings
--
bind({
	mode = { "n" },
	lhs = "<C-d>",
	rhs = "<C-d>zz",
	opts = {
		noremap = true,
		desc = "Go to lowermost current screen line",
	},
})

bind({
	mode = { "n" },
	lhs = "<C-u>",
	rhs = "<C-u>zz",
	opts = {
		noremap = true,
		desc = "Go to uppermost current screen line",
	},
})

bind({
	mode = { "n" },
	lhs = "n",
	rhs = "nzzzv",
	opts = {
		noremap = true,
		desc = "Find next search occurences",
	},
})

bind({
	mode = { "n" },
	lhs = "N",
	rhs = "Nzzzv",
	opts = {
		noremap = true,
		desc = "Find previous search occurences",
	},
})

bind({
	mode = { "n" },
	lhs = "k",
	rhs = "v:count == 0 ? 'gk' : 'k'",
	opts = {
		noremap = true,
		expr = true,
		desc = "Smart up movement",
	},
})

bind({
	mode = { "n" },
	lhs = "j",
	rhs = "v:count == 0 ? 'gj' : 'j'",
	opts = {
		noremap = true,
		expr = true,
		desc = "Smart down movement",
	},
})

bind({
	mode = { "n", "x" },
	lhs = "H",
	rhs = "^",
	opts = {
		noremap = true,
		desc = "Go to the first letter of current line",
	},
})

bind({
	mode = { "n", "x" },
	lhs = "L",
	rhs = "$",
	opts = {
		noremap = true,
		desc = "Go to the last letter of current line",
	},
})

-- Pasting-related binndings
--
bind({
	mode = { "n" },
	lhs = "<C-v>",
	rhs = '"+P',
	opts = {
		noremap = true,
		silent = true,
		desc = "Paste on normal",
	},
})

bind({
	mode = { "v" },
	lhs = "<C-v>",
	rhs = '"+P',
	opts = {
		noremap = true,
		silent = true,
		desc = "Paste on visual",
	},
})

bind({
	mode = { "c" },
	lhs = "<C-v>",
	rhs = "<C-R>+",
	opts = {
		noremap = true,
		silent = true,
		desc = "Paste on command",
	},
})

-- Saving/Writing-related bindings
--
bind({
	mode = { "n" },
	lhs = "<leader>wq",
	rhs = function()
		pcall(save)
		pcall(function()
			vim.cmd("silent! !prettierd stop")
		end)

		if not pcall(vim.cmd.wqa) then
			pcall(function()
				vim.cmd("qa!")
			end)
		end
	end,
	opts = {
		noremap = true,
		desc = "[w]rite, [q]uit & close all",
	},
})

bind({
	mode = { "n" },
	lhs = "<CR>",
	rhs = save,
	opts = {
		noremap = true,
		desc = "Save all",
	},
})

bind({
	mode = { "n" },
	lhs = "<leader>ww",
	rhs = save,
	opts = {
		noremap = true,
		desc = "Save all",
	},
})