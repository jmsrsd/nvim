local telescope = require 'telescope.builtin'

--- Use LspAttach autocommand to only map the following keys
---
--- after the language server attaches to the current buffer
---
vim.api.nvim_create_autocmd('LspAttach', {

  group = vim.api.nvim_create_augroup('UserLspConfig', {}),

  callback = function(ev)
    --- Enable completion triggered by <c-x><c-o>
    ---
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    --- Buffer local mappings.
    ---
    --- See `:help vim.lsp.*` for documentation on any of the
    ---
    --- below functions
    ---
    local describe = function(desc)
      return {
        buffer = ev.buf,
        noremap = true,
        silent = true,
        desc = desc
      }
    end

    vim.keymap.set('n', 'gD',
      vim.lsp.buf.declaration,
      describe 'Jumps to the declaration of the symbol under the cursor.'
    )

    vim.keymap.set('n', 'gd',
      telescope.lsp_definitions,
      -- UNUSED: vim.lsp.buf.definition,
      describe 'Jumps to the definition of the symbol under the cursor.'
    )

    vim.keymap.set('n', 'gt',
      telescope.lsp_type_definitions,
      -- UNUSED: vim.lsp.buf.type_definition,
      describe(
        'Jumps to the definition of ' ..
        'the type of the ' ..
        'symbol under the cursor.'
      )
    )

    vim.keymap.set('n', 'gi',
      telescope.lsp_implementations,
      -- UNUSED: vim.lsp.buf.implementation,
      describe(
        'Lists all the implementations for the ' ..
        'symbol under the cursor in the ' ..
        'quickfix window.'
      )
    )

    vim.keymap.set('n', 'gr',
      telescope.lsp_references,
      -- UNUSED: vim.lsp.buf.references,
      describe(
        'Lists all the references to the ' ..
        'symbol under the cursor in the ' ..
        'quickfix window.'
      )
    )

    vim.keymap.set('n', 'K', vim.lsp.buf.hover,
      describe(
        'Displays hover information about the symbol under the ' ..
        'cursor in a floating window. Calling the ' ..
        'function twice will jump into the floating window.'
      )
    )

    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
      describe(
        'Displays signature information about the ' ..
        'symbol under the cursor in a ' ..
        'floating window.'
      )
    )

    -- UNUSED: vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- UNUSED: vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- UNUSED: vim.keymap.set('n', '<leader>wl', function()
    -- UNUSED:   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- UNUSED: end, opts)

    vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action,
      describe(
        'Selects a code action available at ' ..
        'the current ' ..
        'cursor position.'
      )
    )

    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename,
      describe 'Renames all references to the symbol under the cursor.'
    )

    -- UNUSED: vim.keymap.set('n', '<leader>f', function()
    -- UNUSED:   vim.lsp.buf.format { async = false }
    -- UNUSED: end, opts)
  end,
})
