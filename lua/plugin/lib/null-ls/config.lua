local M = {}

M.setup = function()
  local on_attach = require('plugin.lib.lsp-zero.keymap')
  -- local root_dir = require('null-ls.utils').root_pattern("package.json")
  -- local root_dir = require('null-ls.utils').root_pattern(".null-ls-root", "Makefile", ".git")
  -- local root_dir = vim.loop.cwd

  local root_dir  = require('null-ls.utils').root_pattern(
    'node_modules',
    'package.json'
  )

  require("null-ls").setup({
    -- update_in_insert = true,
    -- on_attach = require('plugin.lib.null-ls.keymap'),
    border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    root_dir = root_dir,
    on_attach = on_attach,
  })
end

return M
