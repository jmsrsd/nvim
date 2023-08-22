local bind = require 'util.bind'

bind {
  mode = { 'n' },
  lhs = 'Q',
  rhs = '<nop>',
  opts = {
    noremap = true,
    desc = 'Disabled',
  },
}

bind {
  mode = { 'n' },
  lhs = 'q',
  rhs = '<nop>',
  opts = {
    noremap = true,
    desc = 'Disabled',
  },
}
