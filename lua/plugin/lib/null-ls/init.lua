return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
  },
  filetypes = {
    "css",
    "dart",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "lua",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      on_attach = require('plugin.lib.null-ls.keymap'),
    })
  end,
}
