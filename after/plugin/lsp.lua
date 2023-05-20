---@diagnostic disable: undefined-global, unused-local

local lsp = require("lsp-zero").preset("recommended")

lsp.set_preferences({
  sign_icons = {}
})

-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings,
-- })

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[]", function()
    vim.cmd.Telescope('diagnostics')
  end, opts)
  vim.keymap.set("n", "<leader>aa", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>hh", vim.lsp.buf.signature_help, opts)
  -- vim.keymap.set("n", "<CR><CR>", function()
  --   local prettier_file_extensions = {
  --     'css',
  --     'html',
  --     'js',
  --     'json',
  --     'jsx',
  --     'md',
  --     'scss',
  --     'ts',
  --     'tsx',
  --     'yaml',
  --   }

  --   local current_file = vim.fn.expand('%')
  --   local file_extension = vim.fn.fnamemodify(current_file, ':e')

  --   if vim.tbl_contains(prettier_file_extensions, file_extension) then
  --     pcall(require("prettier").format)
  --   else
  --     pcall(vim.cmd.LspZeroFormat)
  --     pcall(vim.cmd.w)
  --   end
  -- end, opts)
  -- vim.keymap.set("i", "<C-Space>", cmp.mapping.complete, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- nvim-cmp
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-Space>"] = cmp.mapping(function(fallback)
    pcall(function()
      vim.cmd.call('copilot#Suggest()')
    end)

    fallback()
  end, { "i", "s" }),
  -- ["<C-Space>"] = cmp.mapping.complete(),
  ["<Tab>"] = cmp.mapping(function(fallback)
    local copilot_keys = vim.fn['copilot#Accept']()

    if copilot_keys ~= '' and type(copilot_keys) == 'string' then
      vim.api.nvim_feedkeys(copilot_keys, 'i', true)
    end

    -- if cmp.visible() then
    --   cmp.select_next_item()
    -- elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
    --   vim.api.nvim_feedkeys(copilot_keys, 'i', true)
    -- else
    --   fallback()
    -- end
  end, { 'i', 's' }),
}

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),
  mapping = cmp_mappings,
})

-- Tell copilot to assume that <Tab> has been mapped with cmp
vim.g.copilot_assume_mapped = true

-- flutter-tools
local dart_lsp = lsp.build_options("dartls", {})

require("flutter-tools").setup({
  widget_guides = {
    enabled = true,
  },
  -- debugger = {
  --   enabled = true,
  --   run_via_dap = true,
  -- },
  ui = {
    decorations = {
      statusline = {
        -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
        -- this will show the current version of the flutter app from the pubspec.yaml file
        app_version = true,
        -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
        -- this will show the currently running device if an application was started with a specific
        -- device
        device = true,
        -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
        -- this will show the currently selected project configuration
        project_config = true,
      }
    }
  },
  lsp = {
    capabilities = dart_lsp.capabilities,
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

-- autotag
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
