vim.keymap.set('n', '<leader>qq', function()
  pcall(function() vim.cmd('exe "normal \\<CR>"') end)
  vim.cmd('NvimTreeOpen')
  require('close_buffers').wipe({ type = 'other' })
end, {
  noremap = true,
  desc = 'Delete all buffers except the current focused (Nvim Tree)',
})
