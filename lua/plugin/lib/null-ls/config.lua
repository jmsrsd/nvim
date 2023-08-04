local M = {}

M.setup = function()
  local null_ls = require("null-ls")

  null_ls.setup({
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
    -- update_in_insert = true,
    on_attach = require('plugin.lib.lsp-zero.keymap'),
    -- on_attach = require('plugin.lib.null-ls.keymap'),
  })
end

return M
