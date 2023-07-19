-- NOTE: Map Modes
-- n = Normal
-- s = Select
-- x = Visual
-- o = Operator-pending
-- i = Insert
-- c = Command-line
-- t = Terminal

local ALL_MODES = { 'n', 's', 'x', 'o', 'i', 'c', 't' }

-- Escape key functionality in various modes
vim.keymap.set(ALL_MODES, '<C-c>', '<ESC>', { noremap = true, desc = 'Escape' })
vim.keymap.set(ALL_MODES, '<C-;>', '<ESC>', { noremap = true, desc = 'Escape' })

-- Move selected lines in visual mode down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', {
  noremap = true,
  desc = 'Move down the selected line in visual mode',
})

-- Move selected lines in visual mode up
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', {
  noremap = true,
  desc = 'Move up the selected line in visual mode',
})

-- Remove newline at the end of the line
vim.keymap.set('n', 'J', 'mzJ`z', {
  noremap = true,
  desc = 'Remove newline at the end of the line'
})

-- Join lines and keep cursor position
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true })

-- Go to first and last letter of current line
vim.keymap.set({ 'n', 'x' }, 'H', '^', { noremap = true })
vim.keymap.set({ 'n', 'x' }, 'L', '$', { noremap = true })

-- Delete selected text in visual mode and copy to the black hole register
vim.keymap.set('x', '<leader>p', '"_dp', {
  noremap = true,
  desc = 'Delete selected text in visual mode and copy to the black hole register',
})

-- Delete current line and copy to the black hole register
vim.keymap.set('n', 'x', '"_x', {
  noremap = true,
  desc = 'Delete current line and copy to the black hole register',
})

-- Delete current word without saving it to the default register
vim.keymap.set('n', 'dw', 'vb"_d', {
  noremap = true,
  desc = 'Delete current word without saving it to the default register',
})

-- Select the entire buffer
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', {
  noremap = true,
  desc = 'Select all',
})

-- Copy to the system clipboard
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>Y', '"+Y', { noremap = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })

-- Delete the current line without saving it to the default register
vim.keymap.set('n', '<leader>d', '"_d', {
  noremap = true,
  desc = 'Delete the current line without saving it to the default register',
})

-- Replace all occurrences of a word in the buffer
vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', {
  noremap = true,
  desc = 'Replace all word occurrences',
})

-- Smart up and down movement
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Disable the default behavior of the Q & q keys
vim.keymap.set('n', 'Q', '<nop>', { noremap = true })
vim.keymap.set('n', 'q', '<nop>', { noremap = true })

-- Quick exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, desc = 'Exit insert mode' })
vim.keymap.set('i', 'jj', '<ESC>', { noremap = true, desc = 'Exit insert mode' })
vim.keymap.set('i', 'kk', '<ESC>', { noremap = true, desc = 'Exit insert mode' })

-- Write & Quit
vim.keymap.set('n', '<leader>wq', function()
  pcall(function() vim.cmd('exe "normal \\<CR>"') end)

  if pcall(vim.cmd.wqa) == false then
    pcall(function() vim.cmd('qa!') end)
  end
end, { noremap = true, desc = '[w]rite & [q]uit' })

-- Save all
vim.keymap.set('n', '<CR>', function()
  local filepath = vim.fn.expand('%:p')

  pcall(function() vim.cmd('w ' .. filepath) end)
  pcall(function() vim.cmd('wa') end)
end, { noremap = true, desc = 'Save all' })
