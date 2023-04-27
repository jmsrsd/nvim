---@diagnostic disable: undefined-global

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>aa', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>tt', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, opts)
end)

lsp.format_on_save({
  servers = {
    ['lua_ls'] = { 'lua' },
    ['tsserver'] = { 'typescript' },
    ['jsonls'] = { 'json' },
    ['html'] = { 'html' },
    ['dartls'] = { 'dart' },
  }
})

-- require('lspconfig').dartls.setup {
--   cmd = (
--     vim.fn.has 'win32' == 1 and { 'cmd.exe', '/C', 'dart', 'language-server', '--protocol=lsp' }
--     or { 'dart', 'language-server', '--protocol=lsp' }
--   ),
-- }

lsp.setup()

local dart_lsp = lsp.build_options('dartls', {})

require('flutter-tools').setup({
  lsp = {
    capabilities = dart_lsp.capabilities
  }
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'buffer',     keyword_length = 3 },
    { name = 'lua_ls' },
    { name = 'tailwindcss' },
    { name = 'tsserver' },
    { name = 'jsonls' },
    { name = 'html' }
  },
  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }
})
