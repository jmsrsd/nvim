local peek = require 'peek'

peek.setup({
  --  whether to automatically load preview when entering another markdown buffer
  auto_load = true,

  -- close preview window on buffer delete
  close_on_bdelete = true,

  -- enable syntax highlighting, affects performance
  syntax = true,

  -- 'dark' or 'light'
  theme = 'dark',

  -- 'webview', 'browser', string or a table of strings explained below
  app = 'webview',

  -- list of filetypes to recognize as markdown
  filetype = { 'markdown' },

  update_on_change = true,

  -- configs below are relevant if update_on_change is true

  -- start throttling when file exceeds this amount of bytes in size
  throttle_at = 200000,

  -- minimum amount of time in milliseconds that has to pass before starting new render
  throttle_time = 'auto',
})

vim.api.nvim_create_user_command('PeekOpen', peek.open, {})
vim.api.nvim_create_user_command('PeekClose', peek.close, {})
