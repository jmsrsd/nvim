return {
  'akinsho/flutter-tools.nvim',

  lazy = false,

  dependencies = {

    { 'nvim-lua/plenary.nvim' },

    -- optional for vim.ui.select
    --
    { 'stevearc/dressing.nvim' },

    { 'hrsh7th/cmp-nvim-lsp' },
  },

  -- Configured on lsp-zero.lsp.lua
  --
  -- config = false,
}
