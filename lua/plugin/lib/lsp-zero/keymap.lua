local bind = function(key, action, desc)
  vim.keymap.set('n', key, action, {
    noremap = true,
    desc = desc,
  })
end

local check_telescope_supported = function()
  local unsupported = {
    'dart'
  }

  for _, filetype in ipairs(unsupported) do
    if vim.bo.filetype == filetype then
      return false
    end
  end

  return true
end

return function(client, bufnr)
  bind('K', vim.lsp.buf.hover, 'Display hover info')
  bind('gD', vim.lsp.buf.declaration, 'Jump to declaration')
  bind('gs', vim.lsp.buf.signature_help, 'Display signature info')
  bind('gd', function()
    if check_telescope_supported() then
      vim.cmd.Telescope('lsp_definitions')
    else
      vim.lsp.buf.definition()
    end
  end, 'Jump to definition')
  bind('go', function()
    if check_telescope_supported() then
      vim.cmd.Telescope('lsp_type_definitions')
    else
      vim.lsp.buf.type_definition()
    end
  end, 'Jump to type definition')
  bind('gi', function()
    if check_telescope_supported() then
      vim.cmd.Telescope('lsp_implementations')
    else
      vim.lsp.buf.implementation()
    end
  end, 'List all implementations')

  -- <LEADER> based bindings
  bind('<leader>re', vim.lsp.buf.rename, 'Rename all references')
  bind('<leader>aa', vim.lsp.buf.code_action, 'Display code actions')
  bind('<leader>rr', function()
    if check_telescope_supported() then
      vim.cmd.Telescope('lsp_references')
    else
      vim.lsp.buf.references()
    end
  end, 'List all references')

  -- Diagnostics
  bind('[d', vim.diagnostic.goto_prev, 'Move to previous diagnostic')
  bind(']d', vim.diagnostic.goto_next, 'Move to next diagnostic')

  require('plugin.lib.null-ls.keymap')(client, bufnr)
end
