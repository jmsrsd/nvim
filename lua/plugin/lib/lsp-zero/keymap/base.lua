local bind = function(key, action, desc)
  vim.keymap.set('n', key, action, { noremap = true, desc = desc })
end

local telescope = function(fn)
  local ignored_filetypes = {
    'dart',
    'java',
  }

  for _, filetype in ipairs(ignored_filetypes) do
    if filetype == vim.bo.filetype then
      return false
    end
  end

  vim.cmd.Telescope(fn)

  return true
end

return function(client, bufnr)
  bind('K', vim.lsp.buf.hover, 'Display hover info')

  bind('gD', vim.lsp.buf.declaration, '[g]o to [D]eclaration')

  bind('gs', vim.lsp.buf.signature_help, '[g]o to [s]ignature info')

  bind('gd', function()
    if not telescope('lsp_definitions') then
      vim.lsp.buf.definition()
    end
  end, '[g]o to [d]efinition')

  bind('go', function()
    if not telescope('lsp_type_definitions') then
      vim.lsp.buf.type_definition()
    end
  end, '[go] to type definition')

  bind('gi', function()
    if not telescope('lsp_implementations') then
      vim.lsp.buf.implementation()
    end
  end, '[g]o to the all [i]mplementations')

  -- <LEADER> based bindings
  --
  bind('<leader>re', vim.lsp.buf.rename, '[re]name all references')

  bind('<leader>aa', vim.lsp.buf.code_action, 'Displ[a]y code [a]ctions')

  bind('<leader>rr', function()
    if not telescope('lsp_references') then
      vim.lsp.buf.references()
    end
  end, 'List all [r]efe[r]ences')

  -- Diagnostics
  --
  bind('[d', vim.diagnostic.goto_prev, 'Move to previous [d]iagnostic')
  bind(']d', vim.diagnostic.goto_next, 'Move to next [d]iagnostic')
end
