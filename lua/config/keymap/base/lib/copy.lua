local bind = require 'util.bind'

bind {
  mode = { 'n' },
  lhs = '<leader>y',
  rhs = '"+y',
  opts = {
    noremap = true,
    desc = 'Copy to the system clipboard',
  },
}

bind {
  mode = { 'n' },
  lhs = '<leader>Y',
  rhs = '"+Y',
  opts = {
    noremap = true,
    desc = 'Copy to the system clipboard',
  },
}

bind {
  mode = { 'v' },
  lhs = '<leader>y',
  rhs = '"+y',
  opts = {
    noremap = true,
    desc = 'Copy to the system clipboard',
  },
}
