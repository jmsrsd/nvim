local lsp_zero = require 'lsp-zero'

local on_attach = require 'jmsrsd.plugin.lsp.lib.on-attach'

local filetypes = require 'jmsrsd.plugin.lsp.lib.filetypes'

local servers = require 'jmsrsd.plugin.lsp.lib.servers'

lsp_zero.preset({
  manage_nvim_cmp = {
    set_sources = 'recommended'
  },
})

lsp_zero.set_sign_icons({
  error = "",
  warn = "",
  hint = "",
  info = "",
})

lsp_zero.on_attach(on_attach)

lsp_zero.format_on_save({
  ['null-ls'] = filetypes,
})

lsp_zero.ensure_installed(servers)

-- Fix Undefined global 'vim'
-- require 'jmsrsd.plugin.lua' ()

-- flutter-tools setup
-- require 'jmsrsd.plugin.flutter'

lsp_zero.setup()

-- diagnostic setup
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})

-- Enable update on insert autotag setup
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 5,
      severity_limit = 'Warning',
    },
    update_in_insert = true,
  }
)
