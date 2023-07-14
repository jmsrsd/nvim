local builtin = require('telescope.builtin')

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
