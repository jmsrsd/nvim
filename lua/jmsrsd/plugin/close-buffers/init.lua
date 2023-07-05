local close_buffers = require 'close_buffers'

close_buffers.setup({
  filetype_ignore = {},                            -- Filetype to ignore when running deletions
  file_glob_ignore = {},                           -- File name glob pattern to ignore when running deletions (e.g. '*.md')
  file_regex_ignore = {},                          -- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
  preserve_window_layout = { 'this', 'nameless' }, -- Types of deletion that should preserve the window layout
  next_buffer_cmd = nil,                           -- Custom function to retrieve the next buffer when preserving window layout
})

vim.keymap.set('n', '<leader>qq', function()
  pcall(function() vim.cmd('exe "normal \\<CR>"') end)
  vim.cmd('NvimTreeOpen')
  close_buffers.wipe({ type = 'other' })
end, {
  noremap = true,
  desc = 'Delete all buffers except the current focused (Nvim Tree)',
})
