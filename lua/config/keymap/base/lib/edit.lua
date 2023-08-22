local bind = require 'util.bind'

bind {
  mode = { 'n' },
  lhs = 'J',
  rhs = 'mzJ`z',
  opts = {
    noremap = true,
    desc = 'Remove newline at the end of the line',
  },
}

bind {
  mode = { 'n' },
  lhs = '<C-a>',
  rhs = 'gg<S-v>G',
  opts = {
    noremap = true,
    desc = 'Select [a]ll',
  },
}

bind {
  mode = { 'v' },
  lhs = 'J',
  rhs = ':m \'>+1<CR>gv=gv',
  opts = {
    noremap = true,
    desc = 'Move down the selected line in visual mode',
  },
}

bind {
  mode = { 'v' },
  lhs = 'K',
  rhs = ':m \'<-2<CR>gv=gv',
  opts = {
    noremap = true,
    desc = 'Move up the selected line in visual mode',
  },
}

bind {
  mode = { 'n' },
  lhs = '<leader>s',
  rhs = ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
  opts = {
    noremap = true,
    desc = 'Replace all word occurrences',
  },
}
