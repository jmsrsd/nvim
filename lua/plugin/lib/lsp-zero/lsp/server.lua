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
    'lua_ls', -- brew install lua-language-server
    -- 'efm',    -- brew install efm-langserver
    'jdtls',  -- brew install jdtls

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

  local web_dev_on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    pcall(function() vim.cmd('silent! !prettierd stop') end)
    pcall(function() vim.cmd('silent! !prettierd start') end)
  end

  local web_dev_filetypes = {
    "javascript",
    "javascript.jsx",
    "javascriptreact",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  }

  lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = web_dev_on_attach,
    filetypes = web_dev_filetypes,
    cmd = { "typescript-language-server", "--stdio" }
  })

  -- Eslint through EFM
  --
  -- local function eslint_config_exists()
  --   local eslintrc = vim.fn.glob(".eslintrc*", false, true)
  --
  --   if not vim.tbl_isempty(eslintrc) then
  --     return true
  --   end
  --
  --   if vim.fn.filereadable("package.json") then
  --     if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
  --       return true
  --     end
  --   end
  --
  --   return false
  -- end
  --
  -- local eslint = {
  --   lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  --   lintStdin = true,
  --   lintFormats = { "%f:%l:%c: %m" },
  --   lintIgnoreExitCode = true,
  --   formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  --   formatStdin = true
  -- }
  --
  -- lspconfig.efm.setup({
  --   capabilities = capabilities,
  --   on_attach = web_dev_on_attach,
  --   root_dir = function()
  --     if not eslint_config_exists() then
  --       return nil
  --     end
  --
  --     return vim.fn.getcwd()
  --     -- return vim.fn.expand("%:p:h")
  --   end,
  --   settings = {
  --     languages = {
  --       javascript = { eslint },
  --       javascriptreact = { eslint },
  --       ["javascript.jsx"] = { eslint },
  --       typescript = { eslint },
  --       ["typescript.tsx"] = { eslint },
  --       typescriptreact = { eslint }
  --     }
  --   },
  --   filetypes = web_dev_filetypes,
  -- })

  -- brew install lua-language-server
  --
  local lua_ls_config = lsp.nvim_lua_ls()
  lua_ls_config.on_attach = on_attach
  lua_ls_config.capabilities = capabilities
  lspconfig.lua_ls.setup(lua_ls_config)

  local flutter = require 'plugin.lib.flutter.config'
  flutter.setup(capabilities, on_attach)
end

return M
