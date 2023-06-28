local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require 'lspconfig'

local lspconfig_servers = {
  lspconfig.cssls,
  lspconfig.eslint,
  lspconfig.grammarly,
  lspconfig.html,
  lspconfig.jsonls,
  -- lspconfig.lua_ls, -- Already configured
  lspconfig.prismals,
  lspconfig.tailwindcss,
  lspconfig.tsserver,
  lspconfig.vimls,
  lspconfig.yamlls,
}

for _, server in ipairs(lspconfig_servers) do
  server.setup { capabilities = capabilities }
end

require 'jmsrsd.plugin.lua' (capabilities)
