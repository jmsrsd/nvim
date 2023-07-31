local M = {}

M.setup = function(lsp, lspconfig, capabilities, on_attach)
  lsp.skip_server_setup({
    'denols',
    -- 'lua_ls',
    -- 'eslint',
  })

  -- Each servers binaries must be installed
  local servers = {
    -- 'denols',      -- scoop install deno
    -- 'lua_ls',      -- brew install lua-language-server
    -- 'eslint',      -- npm i -g vscode-langservers-extracted
    'tsserver',    -- npm i -g typescript typescript-language-server
    'html',        -- npm i -g vscode-langservers-extracted
    'cssls',       -- npm i -g vscode-langservers-extracted
    'jsonls',      -- npm i -g vscode-langservers-extracted
    'tailwindcss', -- npm i -g @tailwindcss/language-server
  }

  for _, server in ipairs(servers) do
    lspconfig[server].setup({ capabilities = capabilities })
  end

  lspconfig.lua_ls.setup(
    lsp.nvim_lua_ls() -- brew install lua-language-server
  )

  local flutter = require('plugin.lib.flutter.config')
  flutter.setup(capabilities, on_attach)
end

return M
