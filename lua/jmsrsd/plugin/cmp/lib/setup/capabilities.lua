local cmp_nvim_lsp = require 'cmp_nvim_lsp'

local lspconfig = require 'lspconfig'
local lspconfig_servers = require 'jmsrsd.plugin.lsp.lib.servers'

local default_capabilities = function()
  return cmp_nvim_lsp.default_capabilities()
end

for _, server in ipairs(lspconfig_servers) do
  lspconfig[server].setup {
    on_attach = require 'jmsrsd.plugin.lsp.lib.on-attach',
    capabilities = default_capabilities(),
  }
end

require 'jmsrsd.plugin.lsp-lua' (default_capabilities())
require 'jmsrsd.plugin.lsp-flutter' (default_capabilities())
