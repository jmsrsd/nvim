local bind = require 'util.bind'

bind {
  mode = { 'n' },
  lhs = 'x',
  rhs = '"_x',
  opts = {
    noremap = true,
    desc = 'Delete current line and copy to the black hole register',
  },
}

bind {
  mode = { 'n' },
  lhs = 'dw',
  rhs = 'vb"_d',
  opts = {
    noremap = true,
    desc = 'Delete current word without saving it to the default register',
  },
}
