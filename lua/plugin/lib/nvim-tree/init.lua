local config = require 'plugin.lib.nvim-tree.config'

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    { 'kazhala/close-buffers.nvim' },
  },
  config = function()
    -- Disable netrw at the very start of your init.lua
    --
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Set termguicolors to enable highlight groups
    --
    vim.opt.termguicolors = true

    -- Empty setup using defaults
    --
    local nvim_tree = require 'nvim-tree'

    nvim_tree.setup(config)

    require 'plugin.lib.nvim-tree.keymap'
  end,
}
