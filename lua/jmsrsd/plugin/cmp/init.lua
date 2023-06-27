local cmp = require "cmp"

local cmp_select = { behavior = cmp.SelectBehavior.Select }

local luasnip = require "luasnip"

local lspkind = require "lspkind"

require('luasnip.loaders.from_vscode').lazy_load()

local get_bufrns = function()
  local buf = vim.api.nvim_get_current_buf()
  local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
  if byte_size > 1024 * 1024 then -- 1 Megabyte max
    return {}
  end
  return { buf }
end

cmp.setup({
  preselect = cmp.PreselectMode.None,
  autocomplete = true,
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  view = cmp.WildmenuEntriesConfig,
  -- Where to look for auto-complete items.
  sources = {
    { name = "path",     keyword_length = 0, },
    { name = "buffer",   keyword_length = 0, option = { get_bufrns = get_bufrns } },
    { name = "nvim_lua", keyword_length = 0, },
    { name = "luasnip",  keyword_length = 0, },
    { name = "nvim_lsp", keyword_length = 0, },
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
      max_width = 50,
      ellipsis_char = '...',
      menu = {
        path = "[Path]",
        buffer = "[Buf]",
        nvim_lsp = "[Lsp]",
        luasnip = "[Snip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Lat]",
      },
    }),
  },
  mapping = {
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
      else
        cmp.complete({
          config = {
            sources = {
              { name = 'luasnip' }
            }
          }
        })
      end
    end, { "i", "s" }),
    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item(cmp_select)
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        cmp.complete({
          config = {
            sources = {
              { name = 'luasnip' }
            }
          }
        })
      end
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
})
