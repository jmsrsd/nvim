local ALL_MODES = require 'util.all_modes'

local bind = require 'util.bind'

bind {
  mode = ALL_MODES,
  lhs = '<C-c>',
  rhs = '<ESC>',
  opts = {
    noremap = true,
    desc = 'Escape key functionality in all modes',
  },
}

bind {
  mode = ALL_MODES,
  lhs = '<C-;>',
  rhs = '<ESC>',
  opts = {
    noremap = true,
    desc = 'Escape key functionality in all modes',
  },
}
