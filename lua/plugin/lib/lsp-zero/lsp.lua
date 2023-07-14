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
    lsp.on_attach(on_attach)

    -- Each servers binaries must be installed
    local servers = {
      'cssls',       -- npm i -g vscode-langservers-extracted
      'eslint',      -- npm i -g vscode-langservers-extracted
      'html',        -- npm i -g vscode-langservers-extracted
      'tailwindcss', -- npm install -g @tailwindcss/language-server
      'tsserver',    -- npm install -g typescript typescript-language-server
      'lua_ls'       -- scoop install lua-language-server
    }

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    for _, server in ipairs(servers) do
      local config = lspconfig[server]

      if server == 'lua_ls' then
        -- (Optional) Configure lua language server for neovim
        config.setup(lsp.nvim_lua_ls())

        return
      end

      config.setup({
        capabilities = capabilities,
      })
    end

    lsp.setup()
  end
}
