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

    local action_names = {
      'show_help',
      'select',
      'select_vsplit',
      'select_split',
      'select_tab',
      'preview',
      'close',
      'refresh',
      'parent',
      'open_cwd',
      'cd',
      'tcd',
      'toggle_hidden',
    }

    for _, name in ipairs(action_names) do
      local action = require 'oil.actions'[name]
      local callback = action.callback

      action.callback = function()
        pcall(require 'util.save')
        pcall(callback)
        pcall(close_other_buffers)
      end
    end

    oil.setup {
      -- keymaps = {
      --   ["<CR>"] = {
      --     callback = function()
      --       pcall(select.callback)
      --       pcall(close_other_buffers)
      --     end,
      --     desc = select.desc
      --   }
      -- },
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
