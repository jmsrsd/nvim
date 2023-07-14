return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'L3MON4D3/LuaSnip' },

    -- Additionals
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-cmdline' },
    {
      'petertriho/cmp-git',
      dependencies = {
        { 'nvim-lua/plenary.nvim' }
      }
    },
  },
  config = function()
    -- Here is where you configure the autocompletion settings.
    -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

    require('lsp-zero.cmp').extend()

    -- And you can configure cmp even more, if you want to.
    local cmp = require('cmp')
    local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end
      },
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
      }, {
        { name = 'buffer' },
      }
      ),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        -- ['<C-Space>'] = cmp.mapping.complete(),
        -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<TAB>'] = cmp.mapping.confirm({ select = true }),
        ['<BS>'] = cmp.mapping.abort(),
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
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      }
      )
    })

    require("cmp_git").setup()

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = { ignore_cmds = { 'Man', '!' } }
        }
      }
      )
    })
  end
}
