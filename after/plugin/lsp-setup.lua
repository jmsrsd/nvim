---@diagnostic disable: undefined-global, unused-local

local lsp = require("lsp-zero").preset("recommended")

lsp.set_preferences({
  sign_icons = {}
})

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
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

return lsp
