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

lspzero.setup_servers({ 'dartls', force = true })

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

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

lspzero.setup_nvim_cmp({
  mapping = {
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-Space>"] = cmp.mapping(function(fallback)
      pcall(function()
        vim.cmd.call('copilot#Suggest()')
      end)

      fallback()
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      local copilot_keys = vim.fn['copilot#Accept']()

      if copilot_keys ~= '' and type(copilot_keys) == 'string' then
        vim.api.nvim_feedkeys(copilot_keys, 'i', true)
      end
    end, { 'i', 's' }),
  },
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

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

  vim.keymap.set("n", "[]", function()
    require('telescope.builtin').diagnostics({
      severity = vim.lsp.protocol.DiagnosticSeverity.Error
    })
  end, opts)

  vim.keymap.set("n", "<leader>aa", vim.lsp.buf.code_action, opts)

  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)

  vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, opts)

  vim.keymap.set("n", "<leader>hh", vim.lsp.buf.signature_help, opts)

  -- open lspzero log
  vim.keymap.set("n", "<leader>\\\\", function()
    vim.cmd("LspLog")
  end, opts)
end

lspzero.on_attach(on_attach)

lspzero.setup()

-- flutter-tools setup
require("flutter-tools").setup({
  flutter_path = vim.fn.expand(os.getenv('userprofile') .. '/scoop/apps/fvm/current/default/bin/flutter.bat'),
  widget_guides = {
    enabled = true,
  },
  lsp = {
    on_attach = on_attach,
    capabilities = lspzero.build_options('dartls', {}).capabilities,
    settings = {
      analysisExcludedFolders = {
        vim.fn.expand(os.getenv("localappdata") .. "/Pub/Cache"),
        vim.fn.expand(os.getenv("userprofile") .. "/scoop"),
      },
    },
    -- show the derived colours for dart variables
    color = {
      enabled = true,                                -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true,                             -- highlight the background
      background_color = { r = 28, g = 28, b = 28 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false,                            -- highlight the foreground
      virtual_text = true,                           -- show the highlight using virtual text
      virtual_text_str = "■",                      -- the virtual text character to highlight
    },
  }
})

-- diagnostic setup
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})

-- autotag setup
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
