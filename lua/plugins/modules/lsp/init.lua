--- @diagnostic disable: duplicate-set-field
---

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
    { 'folke/neoconf.nvim' },
    { 'folke/neodev.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    --- Configure default
    ---
    --- lua_ls configs for
    ---
    --- Neovim config development
    ---
    local neodev = require 'neodev'
    neodev.setup {}

    --- Implement mechanism of
    ---
    --- configuring lua_ls through
    ---
    --- JSON files
    ---
    local neoconf = require 'neoconf'
    neoconf.setup {}

    --- Override lsp functions
    ---
    local telescope = require 'telescope.builtin'

    vim.lsp.buf.definition = telescope.lsp_definitions
    vim.lsp.buf.type_definition = telescope.lsp_type_definitions
    vim.lsp.buf.implementation = telescope.lsp_implementations
    vim.lsp.buf.references = telescope.lsp_references

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(

      vim.lsp.handlers.hover, {

        --- Use a sharp border with `FloatBorder` highlights
        ---
        border = "rounded",
      }
    )

    --- Configure Neovim LSP client(s)
    ---
    setup 'lua_ls'

    --- Configure related keymaps
    ---
    keymap 'diagnostic'
    keymap 'lsp'
  end,
}
