local bind = require 'util.bind'
local save = require 'util.save'

-- Open project pane
--
bind {
  mode = { 'n' },
  lhs = '<leader>pp',
  rhs = function()
    pcall(save)

    local using_netrw = vim.g.loaded_netrw ~= 1

    if using_netrw then
      pcall(vim.cmd.Ex)
    else
      pcall(function()
        local window_width = vim.api.nvim_get_option 'columns'

        vim.cmd.NvimTreeFindFile()
        vim.cmd.exe('"normal ' .. window_width .. '\\<C-W>>"')
      end)
    end

    -- pcall(function()
    --   local close_buffers = require 'close_buffers'
    --
    --   close_buffers.wipe {
    --     type = 'other'
    --   }
    -- end)
  end,
  opts = {
    noremap = true,
    desc = '[p]roject [p]ane',
  }
}
