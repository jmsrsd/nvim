return {
  'neovim/nvim-lspconfig',
  cmd = 'LspInfo',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
      'williamboman/mason.nvim',
      build = function()
        local update = function()
          vim.cmd.MasonUpdate()
        end

        pcall(update)
      end,
    },
  },
  config = function()
    -- This is where all the LSP shenanigans will live

    local lsp = require('lsp-zero')
    local lspconfig = require('lspconfig')

    local on_attach = require('plugin.lib.lsp-zero.keymap')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lsp.on_attach(on_attach)

    local server = require('plugin.lib.lsp-zero.lsp.server')
    server.setup(lsp, lspconfig, capabilities, on_attach)

    lsp.setup()
  end
}
