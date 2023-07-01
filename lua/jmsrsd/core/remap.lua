-- NOTE: Map Modes
-- n = Normal
-- s = Select
-- x = Visual
-- o = Operator-pending
-- i = Insert
-- c = Command-line
-- t = Terminal

-- Open Telescope File Browser
vim.keymap.set('n', '<leader>oo', function()
	vim.cmd('Telescope file_browser')
end, {
	silent = true,
	noremap = true,
	desc = 'Open Telescope File Browser',
})

-- Open Nvim Tree
vim.keymap.set('n', '<leader>pp', function()
	vim.cmd('NvimTreeFindFile')
end, {
	silent = true,
	noremap = true,
	desc = 'Open Nvim Tree',
})

-- Move selected lines in visual mode down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })

-- Move selected lines in visual mode up
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Join lines and keep cursor position
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true })

-- Delete selected text in visual mode and copy to the black hole register
vim.keymap.set('x', '<leader>p', '"_dp', { noremap = true })

-- Delete current line and copy to the black hole register
vim.keymap.set('n', 'x', '"_x', { noremap = true })

-- Delete current word without saving it to the default register
vim.keymap.set('n', 'dw', 'vb"_d', { noremap = true })

-- Select the entire buffer
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { noremap = true })

-- Copy to the system clipboard
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>Y', '"+Y', { noremap = true })

-- Delete the current line without saving it to the default register
vim.keymap.set('n', '<leader>d', '"_d', { noremap = true })

-- Escape key functionality in various modes
vim.keymap.set({ 'n', 's', 'x', 'o', 'i', 'c', 't' }, '<C-c>', '<Esc>', { noremap = true, desc = 'Escape' })

-- Go to the next quickfix list item and center the cursor
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { noremap = true })
-- Go to the previous quickfix list item and center the cursor
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { noremap = true })
-- Go to the next location list item and center the cursor
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { noremap = true })
-- Go to the previous location list item and center the cursor
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { noremap = true })

-- Replace all occurrences of a word in the buffer
vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
	{ noremap = true, desc = 'Replace all word occurrences' })

-- Smart up and down movement
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Disable the default behavior of the Q key
vim.keymap.set('n', 'Q', '<nop>', { noremap = true })
-- Disable the default behavior of the q key
vim.keymap.set('n', 'q', '<nop>', { noremap = true })

-- Quick quit
vim.keymap.set('n', '<leader>wq', function()
	pcall(function() vim.cmd('exe "normal \\<CR>"') end)
	vim.cmd('wqa')
end, {
	silent = true,
	noremap = true,
	desc = 'Quick quit',
})

-- Save all
vim.keymap.set('n', '<CR>', function()
	local filepath = vim.fn.expand('%:p')
	vim.cmd('w ' .. filepath)
	vim.cmd('wa')
end, {
	noremap = true,
	desc = 'Save all',
})
