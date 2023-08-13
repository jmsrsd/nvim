local M = {}

M.setup = function()
  local on_attach = require('plugin.lib.lsp-zero.keymap')
  local root_dir = vim.loop.cwd

  require("null-ls").setup({
    -- update_in_insert = true,
    -- on_attach = require('plugin.lib.null-ls.keymap'),
    border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    on_attach = on_attach,
    root_dir = root_dir,
  })
end

return M
