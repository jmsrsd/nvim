local M = {}

M.setup = function()
  local null_ls = require("null-ls")

  null_ls.setup({
    on_attach = require('plugin.lib.lsp-zero.keymap'),
  })
end

return M
