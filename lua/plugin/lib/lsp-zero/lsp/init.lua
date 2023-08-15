return {
  'neovim/nvim-lspconfig',
  cmd = 'LspInfo',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { -- Mason
      'williamboman/mason.nvim',
      build = function()
        local update = function()
          vim.cmd.MasonUpdate()
        end

        pcall(update)
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' },
  },
  config = function()
    -- This is where all the LSP shenanigans will live
    --
    local lsp = require('lsp-zero')
    local lspconfig = require('lspconfig')

    -- Enable default capabitilies and autoformat
    --
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local on_attach = require('plugin.lib.lsp-zero.keymap')

    local server = require('plugin.lib.lsp-zero.lsp.server')
    server.setup(
      lsp,
      lspconfig,
      capabilities,
      on_attach
    )

    lsp.on_attach(function(client, bufnr)
      on_attach(client, bufnr)

      lsp.buffer_autoformat()
    end)

    lsp.setup()
  end
}
