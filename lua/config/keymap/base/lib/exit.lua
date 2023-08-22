local bind = require 'util.bind'

bind {
  mode = { 'i' },
  lhs = 'jk',
  rhs = '<ESC>',
  opts = {
    noremap = true,
    desc = 'Exit insert mode',
  },
}

bind {
  mode = { 'i' },
  lhs = 'jj',
  rhs = '<ESC>',
  opts = {
    noremap = true,
    desc = 'Exit insert mode',
  },
}

bind {
  mode = { 'i' },
  lhs = 'kk',
  rhs = '<ESC>',
  opts = {
    noremap = true,
    desc = 'Exit insert mode',
  },
}
