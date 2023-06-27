return function(client, bufnr)
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

  -- open lsp_zero log
  vim.keymap.set("n", "<leader>\\\\", vim.cmd.LspLog, opts)
end
