local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'

vim.keymap.set('n', '<leader>ff', builtin.find_files, {
  noremap = true,
  desc = '[f]ind [f]iles',
})

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
  noremap = true,
  desc = '[f]ind [g]rep',
})

vim.keymap.set('n', '<leader>fb', builtin.buffers, {
  noremap = true,
  desc = '[f]ind [b]uffers',
})

vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
  noremap = true,
  desc = '[f]ind [h]elp tags',
})

vim.keymap.set('n', '[]', function()
  vim.cmd.Telescope('diagnostics')
end, {
  noremap = true,
  desc = 'Show workspace diagnostics',
})

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(
    themes.get_dropdown {
      windblend = 0,
      previewer = false,
    }
  )
end, {
  noremap = true,
  desc = '[/] Fuzzily search in current buffer',
})
