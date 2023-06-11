require("lsp-setup")

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
  ["<Tab>"] = cmp.mapping(function(fallback)
    local copilot_keys = vim.fn['copilot#Accept']()

    if copilot_keys ~= '' and type(copilot_keys) == 'string' then
      vim.api.nvim_feedkeys(copilot_keys, 'i', true)
    end
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
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  }),
  mapping = cmp_mappings,
})
