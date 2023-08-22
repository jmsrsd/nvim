local bind = require 'util.bind'

bind {
  mode = { 'n' },
  lhs = '<C-v>',
  rhs = '"+P',
  opts = {
    noremap = true,
    silent = true,
    desc = 'Paste on normal'
  },
}

bind {
  mode = { 'v' },
  lhs = '<C-v>',
  rhs = '"+P',
  opts = {
    noremap = true,
    silent = true,
    desc = 'Paste on visual'
  },
}

bind {
  mode = { 'c' },
  lhs = '<C-v>',
  rhs = '<C-R>+',
  opts = {
    noremap = true,
    silent = true,
    desc = 'Paste on command'
  },
}

bind {
  mode = { 'i' },
  lhs = '<C-v>',
  rhs = '<ESC>l"+Pli',
  opts = {
    noremap = true,
    silent = true,
    desc = 'Paste on insert'
  },
}
