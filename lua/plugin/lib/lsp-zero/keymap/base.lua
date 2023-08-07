local bind = function(key, action, desc)
  vim.keymap.set('n', key, action, { noremap = true, desc = desc })
end

local telescope = function(fn)
  return pcall(function()
    vim.cmd.Telescope(fn)
  end)
end

return function(client, bufnr)
  bind('K', vim.lsp.buf.hover, 'Display hover info')

  bind('gD', vim.lsp.buf.declaration, 'Jump to declaration')

  bind('gs', vim.lsp.buf.signature_help, 'Display signature info')

  bind('gd', function()
    if not telescope('lsp_definitions') then
      pcall(vim.lsp.buf.definition)
    end
  end, 'Jump to definition')

  bind('go', function()
    if not telescope('lsp_type_definitions') then
      pcall(vim.lsp.buf.type_definition)
    end
  end, 'Jump to type definition')

  bind('gi', function()
    if not telescope('lsp_implementations') then
      pcall(vim.lsp.buf.implementation)
    end
  end, 'List all implementations')

  -- <LEADER> based bindings
  --
  bind('<leader>re', vim.lsp.buf.rename, 'Rename all references')

  bind('<leader>aa', vim.lsp.buf.code_action, 'Display code actions')

  bind('<leader>rr', function()
    if not telescope('lsp_references') then
      pcall(vim.lsp.buf.references)
    end
  end, 'List all references')

  -- Diagnostics
  --
  bind('[d', vim.diagnostic.goto_prev, 'Move to previous diagnostic')
  bind(']d', vim.diagnostic.goto_next, 'Move to next diagnostic')
end
