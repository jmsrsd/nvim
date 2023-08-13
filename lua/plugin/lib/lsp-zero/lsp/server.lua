local M = {}

M.setup = function(lsp, lspconfig, capabilities, on_attach)
  lsp.skip_server_setup({
    'denols',
    -- 'lua_ls',
    -- 'eslint',
  })

  -- Each servers binaries must be installed
  --
  local servers = {
    -- 'denols',      -- scoop install deno
    -- 'lua_ls',      -- brew install lua-language-server

    -- npm i -g vscode-langservers-extracted
    --
    -- 'tsserver',
    -- 'eslint',
    'html',
    'cssls',
    'jsonls',

    -- npm i -g @tailwindcss/language-server
    --
    'tailwindcss',

    -- npm install -g @astrojs/language-server
    --
    'astro',
  }

  for _, server in ipairs(servers) do
    lspconfig[server].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end

  lspconfig.tsserver.setup({
    on_attach = on_attach,
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    cmd = { "typescript-language-server", "--stdio" }
  })

  -- brew install lua-language-server
  --
  local lua_ls_config = lsp.nvim_lua_ls()
  lua_ls_config.on_attach = on_attach
  lspconfig.lua_ls.setup(lua_ls_config)

  local flutter = require('plugin.lib.flutter.config')
  flutter.setup(capabilities, on_attach)
end

return M
