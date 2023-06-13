local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'cssls',
  'grammarly',
  'html',
  'jsonls',
  'lua_ls',
  'prismals',
  'tailwindcss',
  'tsserver',
  'vimls',
  'yamlls',
})

-- Fix Undefined global 'vim'
require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),

        -- Prevent language server from showing configure work environment dialog
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local cmp_mappings = require('cmp-setup')()

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I',
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[]", function()
    -- vim.cmd.Telescope('diagnostics')
    require('telescope.builtin').diagnostics({
      severity = vim.lsp.protocol.DiagnosticSeverity.Error
    })
  end, opts)
  vim.keymap.set("n", "<leader>aa", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>hh", vim.lsp.buf.signature_help, opts)
end)

require('flutter-setup')(lsp)
require('autotag-setup')()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
