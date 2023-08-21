local bind = require 'util.bind'

-- Map Modes
-- n = Normal
-- v = Visual and Select
-- s = Select
-- x = Visual
-- o = Operator-pending
-- i = Insert
-- l = Insert, Command-line, Lang-Arg
-- c = Command-line
-- t = Terminal

local ALL_MODES = { 'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't' }

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

bind {
  mode = { 'n' },
  lhs = '<leader>d',
  rhs = '"_d',
  opts = {
    noremap = true,
    desc = '[d]elete the current line without saving it to the default register',
  },
}

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

bind {
  mode = { 'x' },
  lhs = '<leader>p',
  rhs = '"_dp',
  opts = {
    noremap = true,
    desc = 'Delete selected text in visual mode and copy to the black hole register',
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

bind {
  mode = { 'n' },
  lhs = '<leader>wq',
  rhs = function()
    pcall(require 'util.save')
    pcall(function() vim.cmd('silent! !prettierd stop') end)

    if not pcall(vim.cmd.wqa) then
      pcall(function() vim.cmd('qa!') end)
    end
  end,
  opts = {
    noremap = true,
    desc = '[w]rite & [q]uit',
  },
}

bind {
  mode = { 'n' },
  lhs = '<CR>',
  rhs = require 'util.save',
  opts = {
    noremap = true,
    desc = 'Save all',
  },
}

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
