-- Open project pane
--
vim.keymap.set(
  'n',
  '<leader>pp',
  function()
    pcall(function()
      vim.cmd.exe '"normal \\<CR>"'
    end)

    if vim.g.loaded_netrw ~= 1 then
      pcall(vim.cmd.Ex)
    else
      pcall(vim.cmd.NvimTreeFindFile)
    end

    -- pcall(function()
    --   local close_buffers = require 'close_buffers'
    --
    --   close_buffers.wipe {
    --     type = 'other'
    --   }
    -- end)
  end,
  {
    noremap = true,
    desc = '[p]roject [p]ane',
  }
)
