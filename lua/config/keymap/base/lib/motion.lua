local bind = require 'util.bind'

bind {
  mode = { 'n' },
  lhs = '<C-d>',
  rhs = '<C-d>zz',
  opts = {
    noremap = true,
    desc = 'Go to lowermost current screen line',
  },
}

bind {
  mode = { 'n' },
  lhs = '<C-u>',
  rhs = '<C-u>zz',
  opts = {
    noremap = true,
    desc = 'Go to uppermost current screen line',
  },
}

bind {
  mode = { 'n' },
  lhs = 'n',
  rhs = 'nzzzv',
  opts = {
    noremap = true,
    desc = 'Find next search occurences',
  },
}

bind {
  mode = { 'n' },
  lhs = 'N',
  rhs = 'Nzzzv',
  opts = {
    noremap = true,
    desc = 'Find previous search occurences',
  },
}

bind {
  mode = { 'n' },
  lhs = 'k',
  rhs = "v:count == 0 ? 'gk' : 'k'",
  opts = {
    noremap = true,
    expr = true,
    desc = 'Smart up movement'
  }
}

bind {
  mode = { 'n' },
  lhs = 'j',
  rhs = "v:count == 0 ? 'gj' : 'j'",
  opts = {
    noremap = true,
    expr = true,
    desc = 'Smart down movement'
  }
}

bind {
  mode = { 'n', 'x' },
  lhs = 'H',
  rhs = '^',
  opts = {
    noremap = true,
    desc = 'Go to the first letter of current line',
  },
}

bind {
  mode = { 'n', 'x' },
  lhs = 'L',
  rhs = '$',
  opts = {
    noremap = true,
    desc = 'Go to the last letter of current line',
  },
}
