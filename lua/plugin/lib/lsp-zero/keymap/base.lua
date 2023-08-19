local bind = function(config)
  vim.keymap.set(
    'n',
    config.key,
    config.action,
    {
      noremap = true,
      desc = config.desc,
    }
  )
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
  bind {
    key = 'K',
    action = vim.lsp.buf.hover,
    desc = 'Display hover info',
  }

  bind {
    key = 'gD',
    action = vim.lsp.buf.declaration,
    desc = '[g]o to [D]eclaration',
  }

  bind {
    key = 'gs',
    action = vim.lsp.buf.signature_help,
    desc = '[g]o to [s]ignature info',
  }

  bind {
    key = 'gd',
    action = function()
      if not telescope('lsp_definitions') then
        vim.lsp.buf.definition()
      end
    end,
    desc = '[g]o to [d]efinition'
  }

  bind {
    key = 'go',
    action = function()
      if not telescope('lsp_type_definitions') then
        vim.lsp.buf.type_definition()
      end
    end,
    desc = '[go] to type definition'
  }

  bind {
    key = 'gi',
    action = function()
      if not telescope('lsp_implementations') then
        vim.lsp.buf.implementation()
      end
    end,
    desc = '[g]o to the all [i]mplementations'
  }

  -- <leader> based bindings
  --
  bind {
    key = '<leader>re',
    action = vim.lsp.buf.rename,
    desc = '[re]name all references'
  }

  bind {
    key = '<leader>aa',
    action = vim.lsp.buf.code_action,
    desc = 'Displ[a]y code [a]ctions'
  }

  bind {
    key = '<leader>rr',
    action = function()
      if not telescope('lsp_references') then
        vim.lsp.buf.references()
      end
    end,
    desc = 'List all [r]efe[r]ences'
  }

  -- Diagnostics
  --
  bind {
    key = '[d',
    action = vim.diagnostic.goto_prev,
    desc = 'Move to previous [d]iagnostic'
  }

  bind {
    key = ']d',
    action = vim.diagnostic.goto_next,
    desc = 'Move to next [d]iagnostic'
  }

  -- Browse media files
  --
  bind {
    key = '<leader>mf',
    action = function()
      vim.cmd.Telescope 'media_files'
    end,
    desc = 'Browse [m]edia [f]iles'
  }
end
