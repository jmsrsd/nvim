local bind = require 'util.bind'

bind {
  mode = { 'n' },
  lhs = '<leader>wq',
  rhs = function()
    pcall(require 'util.save')
    pcall(function() vim.cmd('silent! !prettierd stop') end)

    if not pcall(vim.cmd.wqa) then
      pcall(function() vim.cmd('qa!') end)
    end
  end,
  opts = {
    noremap = true,
    desc = '[w]rite, [q]uit & close all',
  },
}

bind {
  mode = { 'n' },
  lhs = '<CR>',
  rhs = require 'util.save',
  opts = {
    noremap = true,
    desc = 'Save all',
  },
}

bind {
  mode = { 'n' },
  lhs = '<leader>ww',
  rhs = require 'util.save',
  opts = {
    noremap = true,
    desc = 'Save all',
  }
}
