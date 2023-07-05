return function(client, bufnr)
  local describe = function(desc)
    return {
      buffer = bufnr,
      remap = false,
      desc = tostring(desc),
    }
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition,
    describe('[g]o to [d]efinition')
  )

  vim.keymap.set("n", "K", vim.lsp.buf.hover,
    describe('Displays hover information')
  )

  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev({
      severity = {
        min = vim.diagnostic.severity.HINT,
        -- min = vim.diagnostic.severity.WARN,
        -- min = vim.diagnostic.severity.ERROR,
        max = vim.diagnostic.severity.ERROR,
      },
    })
  end, describe('go to previous diagnostic'))

  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next({
      severity = {
        min = vim.diagnostic.severity.HINT,
        -- min = vim.diagnostic.severity.WARN,
        -- min = vim.diagnostic.severity.ERROR,
        max = vim.diagnostic.severity.ERROR,
      },
    })
  end, describe('go to next diagnostic'))

  vim.keymap.set("n", "[]", function()
    require('telescope.builtin').diagnostics({
      severity_limit = 'Hint',
      -- severity_limit = 'Warning',
    })
  end, describe('Open diagnostic floating window'))

  vim.keymap.set("n", "<leader>aa", vim.lsp.buf.code_action,
    describe('[a]pply code [a]ction')
  )

  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references,
    describe('Find [r]efe[r]ences')
  )

  vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename,
    describe('Apply [r][e]name')
  )

  vim.keymap.set("n", "<leader>hh", vim.lsp.buf.signature_help,
    describe('[h]over [h]elp')
  )

  -- open lsp_zero log
  vim.keymap.set("n", "<leader>\\\\", vim.cmd.LspLog,
    describe('LspLog')
  )

  -- Add format on save command
  local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = false })
  local event = 'BufWritePre' -- or "BufWritePost" for async code formatting
  local async = event == 'BufWritePost'

  if client.supports_method('textDocument/formatting') then
    vim.keymap.set('n', '<leader>fj', function()
      vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
    end, { buffer = bufnr, desc = 'Format buffer' })

    -- Format on save
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr, async = async }
      end,
      desc = 'Format on save',
    })
  end

  if client.supports_method('textDocument/rangeFormatting') then
    vim.keymap.set('x', '<leader>fj', function()
      vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
    end, { buffer = bufnr, desc = 'Format selection' })
  end
end
