local bind = require 'util.bind'

return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require 'oil'

    oil.setup {
      view_options = {
        show_hidden = true,
      },
    }

    bind {
      mode = { "n" },
      lhs = "-",
      rhs = function()
        pcall(require 'util.save')
        pcall(vim.cmd.Oil)
      end,
      opts = {
        noremap = true,
        desc = "Open parent directory",
      }
    }
  end,
}
