-- NOTE: Map Modes
-- n = Normal
-- s = Select
-- x = Visual
-- o = Operator-pending
-- i = Insert
-- c = Command-line
-- t = Terminal
--
-- local ALL_MODES = { 'n', 's', 'x', 'o', 'i', 'c', 't' }

-- Appearantly, you just define empty string to indicate that a keybinding
-- would be apply to all modes of neovim
--
local ALL_MODES = ""

-- Shorthand to vim.keymap.set
--
local bind = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, {
    expr = opts.expr,
    desc = opts.desc,
    noremap = true,
    silent = true,
  })
end

-- Escape key functionality in various modes
--
bind(ALL_MODES, '<C-c>', '<ESC>', { desc = 'Escape' })
bind(ALL_MODES, '<C-;>', '<ESC>', { desc = 'Escape' })

-- Move selected lines in visual mode down
--
bind('v', 'J', ':m \'>+1<CR>gv=gv', {
  desc = 'Move down the selected line in visual mode',
})

-- Move selected lines in visual mode up
--
bind('v', 'K', ':m \'<-2<CR>gv=gv', {
  desc = 'Move up the selected line in visual mode',
})

-- Remove newline at the end of the line
--
bind('n', 'J', 'mzJ`z', {
  desc = 'Remove newline at the end of the line'
})

-- Join lines and keep cursor position
--
bind('n', '<C-d>', '<C-d>zz', {})
bind('n', '<C-u>', '<C-u>zz', {})
bind('n', 'n', 'nzzzv', {})
bind('n', 'N', 'Nzzzv', {})

-- Go to first and last letter of current line
--
bind({ 'n', 'x' }, 'H', '^', {})
bind({ 'n', 'x' }, 'L', '$', {})

-- Delete selected text in visual mode and copy to the black hole register
--
bind('x', '<leader>p', '"_dp', {
  desc = 'Delete selected text in visual mode and copy to the black hole register',
})

-- Delete current line and copy to the black hole register
--
bind('n', 'x', '"_x', {
  desc = 'Delete current line and copy to the black hole register',
})

-- Delete current word without saving it to the default register
--
bind('n', 'dw', 'vb"_d', {
  desc = 'Delete current word without saving it to the default register',
})

-- Select the entire buffer
--
bind('n', '<C-a>', 'gg<S-v>G', {
  desc = 'Select all',
})

-- Copy to the system clipboard
--
bind('n', '<leader>y', '"+y', {})
bind('n', '<leader>Y', '"+Y', {})
bind('v', '<leader>y', '"+y', {})

-- Delete the current line without saving it to the default register
--
bind('n', '<leader>d', '"_d', {
  desc = 'Delete the current line without saving it to the default register',
})

-- Replace all occurrences of a word in the buffer
--
bind('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', {
  desc = 'Replace all word occurrences',
})

-- Smart up and down movement
--
bind('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
bind('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Disable the default behavior of the Q & q keys
--
bind('n', 'Q', '<nop>', {})
bind('n', 'q', '<nop>', {})

-- Quick exit insert mode
--
bind('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })
bind('i', 'jj', '<ESC>', { desc = 'Exit insert mode' })
bind('i', 'kk', '<ESC>', { desc = 'Exit insert mode' })

-- Write & Quit
--
bind('n', '<leader>wq', function()
  pcall(function() vim.cmd('exe "normal \\<CR>"') end)
  pcall(function() vim.cmd('silent! !prettierd stop') end)

  if pcall(vim.cmd.wqa) == false then
    pcall(function() vim.cmd('qa!') end)
  end
end, { desc = '[w]rite & [q]uit' })

-- Save all
--
bind('n', '<CR>', function()
  local filepath = vim.fn.expand('%:p')

  pcall(function() vim.cmd('w ' .. filepath) end)
  pcall(function() vim.cmd('wa') end)
end, { desc = 'Save all' })
