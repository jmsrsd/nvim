local bind = require 'util.bind'

local close_other_buffers = function()
  local close_buffers = require 'close_buffers'

  close_buffers.wipe { type = 'other' }
end

return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require 'oil'

    local actions = require 'oil.actions'
    local select = actions.select

    oil.setup {
      keymaps = {
        ["<CR>"] = {
          callback = function()
            pcall(select.callback)
            pcall(close_other_buffers)
          end,
          desc = select.desc
        }
      },
    }

    bind {
      mode = { "n" },
      lhs = "-",
      rhs = function()
        pcall(require 'util.save')

        pcall(function() vim.cmd 'Oil' end)

        pcall(close_other_buffers)
      end,
      opts = {
        noremap = true,
        desc = "Open parent directory",
      }
    }
  end,
}
