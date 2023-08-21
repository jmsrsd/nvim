local bind = require 'util.bind'

local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'

bind {
  mode = { 'n' },
  lhs = '<leader>ff',
  rhs = builtin.find_files,
  opts = {
    noremap = true,
    desc = '[f]ind [f]iles',
  }
}

bind {
  mode = { 'n' },
  lhs  = '<leader>fg',
  rhs  = builtin.live_grep,
  opts = {
    noremap = true,
    desc = '[f]ind [g]rep',
  }
}

bind {
  mode = { 'n' },
  lhs  = '<leader>fb',
  rhs  = builtin.buffers,
  opts = {
    noremap = true,
    desc = '[f]ind [b]uffers',
  }
}

bind {
  mode = { 'n' },
  lhs  = '<leader>fh',
  rhs  = builtin.help_tags,
  opts = {
    noremap = true,
    desc = '[f]ind [h]elp tags',
  }
}

bind {
  mode = { 'n' },
  lhs = '<leader>/',
  rhs = function()
    builtin.current_buffer_fuzzy_find(
      themes.get_dropdown {
        windblend = 0,
        previewer = false,
      }
    )
  end,
  opts = {
    noremap = true,
    desc = '[/] Fuzzily search in current buffer',
  }
}
