require('neodev').setup({
  library = {
    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
    -- these settings will be used for your Neovim config directory
    runtime = true, -- runtime path
    types = true,   -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
  setup_cssls = true,
  setup_eslint = true,
  setup_grammarly = true,
  setup_html = true,
  setup_lua_ls = true,
  setup_prismals = true,
  setup_tailwindcss = true,
  setup_tsserver = true,
  setup_vimls = true,
  setup_yamlls = true,
  -- for your neovim config directory, the config.library settings will be used as is
  -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
  -- for any other directory, config.library.enabled will be set to false
  -- override = function(root_dir, options) end,
  -- With lspconfig, Neodev will automatically setup your lua-language-server
  -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
  -- in your lsp start options
  lspconfig = true,
  -- much faster, but needs a recent built of lua-language-server
  -- needs lua-language-server >= 3.6.0
  pathStrict = true,
})

local lspzero = require("lsp-zero")

lspzero.preset({
  manage_nvim_cmp = {
    set_sources = 'recommended'
  },
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev({
      severity = {
        min = vim.diagnostic.severity.ERROR,
        -- min = vim.diagnostic.severity.WARN,
        -- max = vim.diagnostic.severity.ERROR,
      },
    })
  end, opts)

  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next({
      severity = {
        min = vim.diagnostic.severity.ERROR,
        -- min = vim.diagnostic.severity.WARN,
        -- max = vim.diagnostic.severity.ERROR,
      },
    })
  end, opts)

  vim.keymap.set("n", "[]", function()
    require('telescope.builtin').diagnostics({
      severity_limit = 'Warning',
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

lspzero.set_sign_icons({
  error = "",
  warn = "",
  hint = "",
  info = "",
})

-- lspzero.set_preferences({
--   suggest_lsp_servers = false,
--   sign_icons = {
--     error = "",
--     warn = "",
--     hint = "",
--     info = "",
--     -- error = 'E',
--     -- warn = 'W',
--     -- hint = 'H',
--     -- info = 'I',
--   }
-- })

lspzero.on_attach(on_attach)

lspzero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 3600 * 1000,
  },
  ['null-ls'] = {
    "css",
    "html",
    "javascript",
    "json",
    "less",
    "lua",
    "markdown",
    "prisma",
    "scss",
    "text",
    "typescript",
    "yaml",
  },
  -- servers = {
  --   ['lua_ls'] = { 'lua' },
  --   ['rust_analyzer'] = { 'rust' },
  -- }
})

lspzero.ensure_installed({
  'cssls',
  'eslint',
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
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

-- flutter-tools setup
require("flutter-tools").setup({
  flutter_path = vim.fn.expand(os.getenv('userprofile') .. '/scoop/apps/fvm/current/default/bin/flutter.bat'),
  widget_guides = {
    enabled = true,
  },
  lsp = {
    on_attach = on_attach,
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

require("telescope").load_extension("flutter")


lspzero.setup()

-- null-ls setup
local null_ls = require("null-ls")
local null_ls_utils = require("null-ls.utils")

null_ls.setup({
  source = {
    root_dir = null_ls_utils.root_pattern("composer.json", "package.json", "Makefile", ".git"), -- Add composer
    diagnostics_format = "#{m} (#{c}) [#{s}]",                                                  -- Makes PHPCS errors more readeable
    sources = {
      null_ls.builtins.completion.spell,                                                        -- You still need to execute `:set spell`
      null_ls.builtins.diagnostics.eslint,                                                      -- Add eslint to js projects
      null_ls.builtins.diagnostics.phpcs.with({                                                 -- Change how the php linting will work
        prefer_local = "vendor/bin",
      }),
      null_ls.builtins.formatting.stylua,       -- You need to install stylua first: `brew install stylua`
      null_ls.builtins.formatting.phpcbf.with({ -- Use the local installation first
        prefer_local = "vendor/bin",
      }),
    },
  },
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

-- add external collection of snippets
-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_action = lspzero.cmp_action()
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- local has_words_before = function()
--   unpack = unpack or table.unpack
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

require('luasnip.loaders.from_vscode').lazy_load()

-- local tabnine = require('cmp_tabnine.config')

-- tabnine:setup({
--   max_lines = 1000,
--   max_num_results = 20,
--   sort = true,
--   run_on_every_keystroke = true,
--   snippet_placeholder = '..',
--   ignored_file_types = {
--     -- default is not to ignore
--     -- uncomment to ignore in lua:
--     -- lua = true
--   },
--   show_prediction_strength = false
-- })

cmp.setup({
  preselect = 'item',
  autocomplete = true,
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  view = cmp.WildmenuEntriesConfig,
  -- Where to look for auto-complete items.
  sources = {
    -- { name = 'cmp_tabnine', keyword_length = 0, priority = 1, },
    -- { name = "copilot",     keyword_length = 1, priority = 2, },
    { name = "path",     keyword_length = 1, priority = 1, },
    { name = "buffer",   keyword_length = 1, priority = 2, get_bufnrs = vim.api.nvim_list_bufs, },
    { name = "luasnip",  keyword_length = 1, priority = 3, },
    { name = "nvim_lua", keyword_length = 1, priority = 4, },
    { name = "nvim_lsp", keyword_length = 1, priority = 5, },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = lspkind.cmp_format({
      mode = "text",
      -- mode = "symbol",
      -- mode = "symbol_text",
      max_width = 50,
      ellipsis_char = '...',
      -- symbol_map = { Copilot = " " },
      menu = {
        buffer = "[Buf]",
        nvim_lsp = "[Lsp]",
        luasnip = "[Snip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Lat]",
        -- copilot = "[Cpt]",
        -- cmp_tabnine = "[Tab9]",
      },
    }),
  },
  mapping = {
    -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    -- ["<C-y>"] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- }),
    -- ["<C-Space>"] = cmp.mapping(function(fallback)
    --   fallback()

    --   -- local copilot_keys = vim.fn['copilot#Suggest']()

    --   -- if copilot_keys ~= '' and type(copilot_keys) == 'string' then
    --   --   vim.api.nvim_feedkeys(copilot_keys, 'i', true)
    --   --   vim.api.nvim_feedkeys(copilot_keys, 's', true)
    --   -- end
    -- end, { "i", "s" }),
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   -- local copilot_keys = vim.fn['copilot#Accept']()

    --   -- if copilot_keys ~= '' and type(copilot_keys) == 'string' then
    --   --   vim.api.nvim_feedkeys(copilot_keys, 'i', true)
    --   --   vim.api.nvim_feedkeys(copilot_keys, 's', true)
    --   -- end
    -- end, { 'i', 's' }),
    ["<C-Space>"] = cmp.mapping.complete({
      config = {
        sources = {
          { name = 'luasnip' }
        }
      }
    }),
    ["<C-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(cmp_select)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
        -- elseif has_words_before() then
        --   cmp.complete()
      else
        cmp.complete({
          config = {
            sources = {
              { name = 'luasnip' }
            }
          }
        })
        -- fallback()
      end
    end, { "i", "s" }),
    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item(cmp_select)
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
        -- elseif has_words_before() then
        --   cmp.complete()
      else
        cmp.complete({
          config = {
            sources = {
              { name = 'luasnip' }
            }
          }
        })
        -- fallback()
      end
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
})
