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
      rhs = function()
        pcall(require 'util.save')

        pcall(function() vim.cmd 'Oil' end)

        pcall(function()
          local close_buffers = require 'close_buffers'

          close_buffers.wipe { type = 'other' }
        end)
      end,
      opts = {
        noremap = true,
        desc = "Open parent directory",
      }
    }
  end,
}
