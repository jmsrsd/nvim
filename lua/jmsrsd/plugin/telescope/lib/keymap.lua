local M = {}

function M.set()
  local builtin = require('telescope.builtin')

  vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true })
  vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string { search = vim.fn.input('Grep > '), }
  end, { noremap = true })
end

return M
