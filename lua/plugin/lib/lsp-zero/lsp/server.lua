local M = {}

M.setup = function(lsp, lspconfig, capabilities, on_attach)
  -- Each servers binaries must be installed
  local servers = {
    -- 'eslint',      -- npm i -g vscode-langservers-extracted
    'denols',      -- scoop install deno
    'tsserver',    -- npm install -g typescript typescript-language-server
    'html',        -- npm i -g vscode-langservers-extracted
    'cssls',       -- npm i -g vscode-langservers-extracted
    'tailwindcss', -- npm install -g @tailwindcss/language-server
    'jsonls',      -- npm i -g vscode-langservers-extracted
    -- 'lua_ls'       -- scoop install lua-language-server
  }

  for _, server in ipairs(servers) do
    lspconfig[server].setup({ capabilities = capabilities })
  end

  lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

  local flutter = require('plugin.lib.flutter.config')
  flutter.setup(capabilities, on_attach)
end

return M
