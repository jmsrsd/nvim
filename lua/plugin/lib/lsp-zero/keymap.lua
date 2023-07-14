return function(client, bufnr)
  -- lsp.default_keymaps({buffer = bufnr})

  local bind = function(key, action, desc)
    vim.keymap.set('n', key, action, {
      noremap = true,
      desc = desc,
    })
  end

  bind('K', vim.lsp.buf.hover, 'Display hover info')
  bind('gd', function()
    -- vim.lsp.buf.definition()
    vim.cmd.Telescope('lsp_definitions')
  end, 'Jump to definition')
  bind('go', function()
    -- vim.lsp.buf.type_definition()
    vim.cmd.Telescope('lsp_type_definitions')
  end, 'Jump to type definition')
  bind('gD', vim.lsp.buf.declaration, 'Jump to declaration')
  bind('gi', function()
    -- vim.lsp.buf.implementation()
    vim.cmd.Telescope('lsp_implementations')
  end, 'List all implementations')
  bind('gs', vim.lsp.buf.signature_help, 'Display signature info')

  bind('<leader>rr', function()
    -- vim.lsp.buf.references()
    vim.cmd.Telescope('lsp_references')
  end, 'List all references')
  bind('<leader>re', vim.lsp.buf.rename, 'Rename all references')
  bind('<leader>aa', vim.lsp.buf.code_action, 'Display code actions')

  -- Diagnostics
  bind('[d', vim.diagnostic.goto_prev, 'Move to previous diagnostic')
  bind(']d', vim.diagnostic.goto_next, 'Move to next diagnostic')

  -- Autoformat
  local group = vim.api.nvim_create_augroup("lsp_format_on_save", {
    clear = false,
  })
  local event = "BufWritePre" -- or "BufWritePost"
  local async = event == "BufWritePost"

  if client.supports_method("textDocument/formatting") then
    vim.keymap.set("n", "<Leader>fj", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })

    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end,
      desc = "[lsp] format on save",
    })
  end

  if client.supports_method("textDocument/rangeFormatting") then
    vim.keymap.set("x", "<Leader>fj", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })
  end
end
