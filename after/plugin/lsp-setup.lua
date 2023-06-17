local lspzero = require("lsp-zero")

lspzero.preset("recommended")

lspzero.ensure_installed({
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
require('lspconfig').lua_ls.setup {
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

lspzero.setup_nvim_cmp({
  mapping = require('cmp-setup')(),
})

lspzero.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I',
  }
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)

  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev()
  end, opts)

  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next()
  end, opts)

  vim.keymap.set("n", "[]", function()
    -- vim.cmd.Telescope('diagnostics')
    require('telescope.builtin').diagnostics({
      severity = vim.lsp.protocol.DiagnosticSeverity.Error
    })
  end, opts)

  vim.keymap.set("n", "<leader>aa", function()
    vim.lsp.buf.code_action()
  end, opts)

  vim.keymap.set("n", "<leader>rr", function()
    vim.lsp.buf.references()
  end, opts)

  vim.keymap.set("n", "<leader>re", function()
    vim.lsp.buf.rename()
  end, opts)

  vim.keymap.set("n", "<leader>hh", function()
    vim.lsp.buf.signature_help()
  end, opts)

  -- open lspzero log
  vim.keymap.set("n", "<leader>\\\\", function()
    vim.cmd("edit " .. vim.lsp.get_log_path())
  end, opts)
end


lspzero.on_attach(on_attach)

lspzero.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})

require('flutter-setup')(on_attach)
require('autotag-setup')()
