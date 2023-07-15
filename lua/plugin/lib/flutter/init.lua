return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'stevearc/dressing.nvim' }, -- optional for vim.ui.select
    { 'hrsh7th/cmp-nvim-lsp' },
  },
  -- config = false, -- Configured on lsp-zero.lsp.lua
}
