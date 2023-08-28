local util = require 'keymaps.util'
local bind = util.bind

-- Copy-related bindings
-- 
bind {
  mode = {'n'},
  lhs = '<leader>y',
  rhs = '"+y',
  opts = {
    noremap = true,
    desc = 'Copy to the system clipboard',
  }
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

-- Delete-related bindings
-- 
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
