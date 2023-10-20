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

--- Paste
---
vim.keymap.set({ "n", "v" }, "<C-v>", '"+P', {
	noremap = true,
	silent = true,
	desc = "Paste on normal, visual & select",
})

vim.keymap.set("l", "<C-V>", "<C-r>+", {
	noremap = true,
	silent = true,
	desc = "Paste on insert, command-line & lang-arg",
})

-- Navigation
--
vim.keymap.set("n", "<C-d>", "<C-d>zz", {
	noremap = true,
	silent = true,
	desc = "Go to lowermost current screen line",
})

vim.keymap.set("n", "<C-u>", "<C-u>zz", {
	noremap = true,
	silent = true,
	desc = "Go to uppermost current screen line",
})

vim.keymap.set("n", "n", "nzzzv", {
	noremap = true,
	silent = true,
	desc = "Find next search occurences",
})

vim.keymap.set("n", "N", "Nzzzv", {
	noremap = true,
	silent = true,
	desc = "Find previous search occurences",
})

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {
	noremap = true,
	expr = true,
	silent = true,
	desc = "Smart upward movement",
})

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {
	noremap = true,
	expr = true,
	silent = true,
	desc = "Smart downward movement",
})

vim.keymap.set("n", "<C-j>", "<Esc>:wincmd j<CR>", {
	noremap = true,
	silent = true,
	desc = "Moves to the window below the current one",
})

vim.keymap.set("n", "<C-k>", "<Esc>:wincmd k<CR>", {
	noremap = true,
	silent = true,
	desc = "Moves to the window above the current one",
})

vim.keymap.set("n", "<C-h>", "<Esc>:wincmd h<CR>", {
	noremap = true,
	silent = true,
	desc = "Moves to the window left the current one",
})

vim.keymap.set("n", "<C-l>", "<Esc>:wincmd l<CR>", {
	noremap = true,
	silent = true,
	desc = "Moves to the window right the current one",
})

--- Visual Mode
---
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
	noremap = true,
	silent = true,
	desc = "Move down the selected line in visual mode",
})

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
	noremap = true,
	silent = true,
	desc = "Move up the selected line in visual mode",
})

--- Search and Replace
---
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {
	noremap = true,
	silent = true,
	desc = "Replace all word occurrences",
})

--- Miscellaneous
---
vim.keymap.set("n", "J", "mzJ`z", {
	noremap = true,
	silent = true,
	desc = "Remove newline at the end of the line",
})

-- UNUSED: vim.keymap.set('n', '-', '<CMD>Ex<CR>', {
-- UNUSED:   noremap = true,
-- UNUSED:   silent = true,
-- UNUSED:   desc = 'Open netrw file explorer'
-- UNUSED: })

vim.keymap.set("n", "q", "", {
	noremap = true,
	silent = true,
	desc = "No-op",
})

vim.keymap.set("n", "Q", "", {
	noremap = true,
	silent = true,
	desc = "No-op",
})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {
	noremap = true,
	silent = true,
	desc = "Exit terminal mode",
})

vim.keymap.set("t", "jk", "<C-\\><C-n>", {
	noremap = true,
	silent = true,
	desc = "Exit terminal mode",
})

vim.keymap.set("t", "jj", "<C-\\><C-n>", {
	noremap = true,
	silent = true,
	desc = "Exit terminal mode",
})

vim.keymap.set("i", "jk", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Exit insert mode",
})

vim.keymap.set("i", "jj", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Exit insert mode",
})

vim.keymap.set({ "n", "v" }, "H", "^", {
	noremap = true,
	silent = true,
	desc = "Go to the first character of current line",
})

vim.keymap.set({ "n", "v" }, "L", "$", {
	noremap = true,
	silent = true,
	desc = "Go to the end character of current line",
})

vim.keymap.set("n", "<C-a>", "ggVG", {
	noremap = true,
	silent = true,
	desc = "Select all",
})

vim.keymap.set("n", "<leader>w", function()
	local cmds = { "w", "wa" }

	for _, cmd in ipairs(cmds) do
		xpcall(function()
			vim.cmd(cmd)
		end, function()
			vim.cmd(cmd .. "!")
		end)
	end
end, {
	noremap = true,
	silent = true,
	desc = "Save all buffers",
})

vim.keymap.set("n", "<leader>q", function()
	local cmds = { "w", "wa", "wqa", "q", "qa" }

	for _, cmd in ipairs(cmds) do
		xpcall(function()
			vim.cmd(cmd)
		end, function()
			vim.cmd(cmd .. "!")
		end)
	end
end, {
	noremap = true,
	silent = true,
	desc = "Save all and quit",
})

--- Window
---

vim.keymap.set("n", "T", "<Esc><C-w>s:wincmd j<CR>:term<CR>", {
	noremap = true,
	silent = false,
	desc = "Spawn terminal window",
})
