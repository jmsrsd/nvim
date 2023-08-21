local bind = require 'util.bind'

return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require 'oil'

    oil.setup {}

    bind {
      mode = { "n" },
      lhs = "-",
      rhs = "<CMD>Oil<CR>",
      opts = {
        noremap = true,
        desc = "Open parent directory",
      }
    }
  end,
}
