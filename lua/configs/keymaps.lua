--- Common map modes keys can be looked
---
--- up on the code below:
---
--- local MAP_MODES = {
---
---   ['n'] = 'Normal',
---
---   ['i'] = 'Insert',
---
---   ['c'] = 'Command-line',
---
---   ['l'] = 'Insert, Command-line & Lang-Arg',
---
---   ['x'] = 'Visual',
---
---   ['s'] = 'Select',
---
---   ['v'] = 'Visual & Select',
---
---   ['t'] = 'Terminal'
---
--- }
---

local keymap = require("utils.keymap")

local describe = keymap.describe

local describeExpression = keymap.describeExpression

local set = function(mode, lhs, rhs, opts)
	pcall(function()
		vim.keymap.del(mode, lhs, opts)
	end)
	vim.keymap.set(mode, lhs, rhs, opts)
end

--- Paste
---

set({ "n", "v" }, "<C-v>", '"+P', describe("Paste on normal, visual & select"))

set("l", "<C-V>", "<C-r>+", describe("Paste on insert, command-line & lang-arg"))

-- Navigation
--

set("n", "<C-d>", "<C-d>zz", describe("Go to lowermost current screen line"))

set("n", "<C-u>", "<C-u>zz", describe("Go to uppermost current screen line"))

set("n", "n", "nzzzv", describe("Find next search occurences"))

set("n", "N", "Nzzzv", describe("Find previous search occurences"))

set("n", "k", "v:count == 0 ? 'gk' : 'k'", describeExpression("Smart upward movement"))

set("n", "j", "v:count == 0 ? 'gj' : 'j'", describeExpression("Smart downward movement"))

set("n", "<C-j>", "<Esc>:wincmd j<CR>", describe("Moves to the window below the current one"))

set("n", "<C-k>", "<Esc>:wincmd k<CR>", describe("Moves to the window above the current one"))

set("n", "<C-h>", "<Esc>:wincmd h<CR>", describe("Moves to the window left the current one"))

set("n", "<C-l>", "<Esc>:wincmd l<CR>", describe("Moves to the window right the current one"))

set({ "n", "v" }, "H", "^", describe("Go to the first character of current line"))

set({ "n", "v" }, "L", "$", describe("Go to the end character of current line"))

--- Visual Mode
---

set("v", "J", ":m '>+1<CR>gv=gv", describe("Move down the selected line in visual mode"))

set("v", "K", ":m '<-2<CR>gv=gv", describe("Move up the selected line in visual mode"))

set("n", "<C-a>", "ggVG", describe("Select all"))

--- Search and Replace
---

set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", describe("Replace all word occurrences"))

--- Editing
---

set("n", "J", "mzJ`z", describe("Remove newline at the end of the line"))

--- No-op
---

set({ "n", "v" }, "q", "", describe("No-op"))

set({ "n", "v" }, "Q", "", describe("No-op"))

--- Escape
---

local escape_keys = { "jj", "jk", "kk", "<C-[>" }

set("t", "<Esc>", "<C-\\><C-n>", describe("Exit terminal mode"))

vim.tbl_map(function(lhs)
	set("t", lhs, "<C-\\><C-n>", describe("Exit terminal mode"))
	set("i", lhs, "<Esc>", describe("Exit insert mode"))
end, escape_keys)

--- Buffer
---

local buffer = require("utils.buffer")

set("n", "<leader>w", buffer.save_all, describe("Save all"))

set("n", "<leader>q", buffer.quit_all, describe("Quit all"))

set("n", "<leader>d", buffer.close, describe("Close current buffer"))

--- Window
---

--- UNUSED: set("n", "T", "<Esc><C-w>s:wincmd j<CR>:term<CR>:wincmd J<CR>a", describe("Spawn terminal window"))
