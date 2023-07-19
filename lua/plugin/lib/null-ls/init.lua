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
      on_attach = require('plugin.lib.lsp-zero.keymap'),
      -- on_attach = require('plugin.lib.null-ls.keymap'),
      -- sources = {
      --   -- npm install -g eslint_d
      --   null_ls.builtins.code_actions.eslint_d,
      --   null_ls.builtins.diagnostics.eslint_d,

      --   -- Doesn't need standalone binary
      --   null_ls.builtins.code_actions.refactoring,
      --   null_ls.builtins.completion.luasnip,

      --   -- luarocks install luacheck
      --   -- null_ls.builtins.diagnostics.luacheck,

      --   -- npm install -g jsonlint
      --   null_ls.builtins.diagnostics.jsonlint,

      --   -- npm install -g rustywind
      --   null_ls.builtins.formatting.rustywind,
      -- },
    })
  end,
}
