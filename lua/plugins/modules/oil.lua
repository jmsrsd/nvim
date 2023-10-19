return {

  'stevearc/oil.nvim',

  dependencies = {

    'nvim-tree/nvim-web-devicons'
  },

  config = function()
    local oil = require 'oil'

    oil.setup {
      view_options = {
        show_hidden = true
      }
    }

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
      noremap = true,
      silent = true,
      desc = "Open parent directory"
    })
  end,
}
