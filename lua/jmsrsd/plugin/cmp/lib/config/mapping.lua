return function(cmp, cmp_select, luasnip)
  return {
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
  }
end
