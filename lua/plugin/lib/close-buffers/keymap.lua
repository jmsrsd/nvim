vim.keymap.set('n', '<leader>qq', function()
  pcall(function() vim.cmd('exe "normal \\<CR>"') end)
  pcall(function() vim.cmd('NvimTreeOpen') end)
  pcall(function() require('close_buffers').wipe({ type = 'other' }) end)
end, {
  noremap = true,
  desc = 'Delete all buffers except the current focused (Nvim Tree)',
})
