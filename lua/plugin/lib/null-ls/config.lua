local M = {}

M.setup = function()
  local null_ls = require("null-ls")

  null_ls.setup({
    on_attach = require('plugin.lib.lsp-zero.keymap'),
    sources = {
      null_ls.builtins.code_actions.xo,
      null_ls.builtins.diagnostics.xo,
    }
  })
end

return M
