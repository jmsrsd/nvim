return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
  },
  filetypes = {
    "astro",
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
    local config = require('plugin.lib.null-ls.config')

    config.setup()
  end,
}
