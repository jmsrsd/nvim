local lazy = require 'lazy'

lazy.setup {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local tokyonight = require 'tokyonight'

      tokyonight.setup {
        style = 'night',
        transparent = true,
      }

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require 'oil'

      oil.setup {}

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  }
}
