return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'L3MON4D3/LuaSnip' },

    -- Additionals
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
    { 'hrsh7th/cmp-calc' },
    { 'saadparwaiz1/cmp_luasnip' },
    {
      'petertriho/cmp-git',
      dependencies = {
        { 'nvim-lua/plenary.nvim' }
      }
    },
  },
  config = function()
    local cmp = require 'cmp'
    local cmp_git = require 'cmp_git'
    local cmp_lsp = require 'lsp-zero.cmp'

    local luasnip = require 'luasnip'

    -- Here is where you configure the autocompletion settings.
    -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
    --
    cmp_lsp.extend()

    -- And you can configure cmp even more, if you want to.
    --
    local cmp_select_opts = {
      behavior = cmp.SelectBehavior.Select,
    }

    local cmp_buffer_source = {
      name = 'buffer',
      option = {
        get_bufnrs = vim.api.nvim_list_bufs,
      }
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'calc' },
        cmp_buffer_source,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ['<TAB>'] = cmp.mapping.confirm { select = true },
        ['<ESC>'] = cmp.mapping.abort(),
        ['<C-;>'] = cmp.mapping.abort(),
        ['<C-c>'] = cmp.mapping.abort(),
        ['<C-p>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item(cmp_select_opts)
          else
            cmp.complete()
          end
        end),
        ['<C-n>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item(cmp_select_opts)
          else
            cmp.complete()
          end
        end),
      }
    }

    -- Set configuration for specific filetype.
    --
    cmp.setup.filetype(
      'gitcommit',
      {
        sources = cmp.config.sources(
          {
            -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            --
            { name = 'git' },
          },
          {
            cmp_buffer_source,
          }
        )
      }
    )

    cmp_git.setup()

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    --
    cmp.setup.cmdline(
      { '/', '?' },
      {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          cmp_buffer_source,
        }
      }
    )

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    --
    cmp.setup.cmdline(
      ':',
      {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {
            { name = 'path' }
          },
          {
            {
              name = 'cmdline',
              option = { ignore_cmds = { 'Man', '!' } }
            }
          }
        )
      }
    )
  end
}
