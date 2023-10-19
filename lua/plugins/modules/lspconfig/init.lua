local import = function(name)
  return require 'utils.import' (function(base)
    return base .. '.' .. name
  end)
end

local keymap = function(name)
  return import('keymaps.' .. name)
end

local setup = function(server)
  return import('servers.' .. server)
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "folke/neoconf.nvim",
    "folke/neodev.nvim",
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    --- Configure default
    ---
    --- lua_ls configs for
    ---
    --- Neovim config development
    ---
    local neodev = require 'neodev'
    neodev.setup()

    --- Implement mechanism of
    ---
    --- configuring lua_ls through
    ---
    --- JSON files
    ---
    local neoconf = require 'neoconf'
    neoconf.setup()

    --- Configure Neovim LSP client(s)
    ---
    setup 'lua_ls'

    --- Configure related keymaps
    ---
    keymap 'diagnostic'
    keymap 'lsp'
  end,
}
