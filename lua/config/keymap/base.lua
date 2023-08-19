local bind = require 'util.bind'

-- Map Modes
-- n = Normal
-- i = Insert
-- c = Command-line
-- x = Visual
-- s = Select
-- o = Operator-pending
-- t = Terminal

-- Appearantly, you just define empty string to indicate that a keybinding
-- would be apply to all modes of neovim
--
local ALL_MODES = ""

bind {
  mode = { ALL_MODES },
  lhs = '<C-c>',
  rhs = '<ESC>',
  opts = {
    desc = 'Escape key functionality in all modes',
  },
}

bind {
  mode = { ALL_MODES },
  lhs = '<C-;>',
  rhs = '<ESC>',
  opts = {
    desc = 'Escape key functionality in all modes',
  },
}

bind {
  mode = { 'n' },
  lhs = 'J',
  rhs = 'mzJ`z',
  opts = {
    desc = 'Remove newline at the end of the line',
  },
}

bind {
  mode = { 'n' },
  lhs = '<C-d>',
  rhs = '<C-d>zz',
  opts = {
    desc = 'Go to lowermost current screen line',
  },
}

bind {
  mode = { 'n' },
  lhs = '<C-u>',
  rhs = '<C-u>zz',
  opts = {
    desc = 'Go to uppermost current screen line',
  },
}

bind {
  mode = { 'n' },
  lhs = 'n',
  rhs = 'nzzzv',
  opts = {
    desc = 'Find next search occurences',
  },
}

bind {
  mode = { 'n' },
  lhs = 'N',
  rhs = 'Nzzzv',
  opts = {
    desc = 'Find previous search occurences',
  },
}

bind {
  mode = { 'n' },
  lhs = 'x',
  rhs = '"_x',
  opts = {
    desc = 'Delete current line and copy to the black hole register',
  },
}

bind {
  mode = { 'n' },
  lhs = 'dw',
  rhs = 'vb"_d',
  opts = {
    desc = 'Delete current word without saving it to the default register',
  },
}

bind {
  mode = { 'n' },
  lhs = '<C-a>',
  rhs = 'gg<S-v>G',
  opts = {
    desc = 'Select all',
  },
}

bind {
  mode = { 'n' },
  lhs = '<leader>y',
  rhs = '"+y',
  opts = {
    desc = 'Copy to the system clipboard',
  },
}

bind {
  mode = { 'n' },
  lhs = '<leader>Y',
  rhs = '"+Y',
  opts = {
    desc = 'Copy to the system clipboard',
  },
}

bind {
  mode = { 'v' },
  lhs = '<leader>y',
  rhs = '"+y',
  opts = {
    desc = 'Copy to the system clipboard',
  },
}

bind {
  mode = { 'n' },
  lhs = '<leader>d',
  rhs = '"_d',
  opts = {
    desc = 'Delete the current line without saving it to the default register',
  },
}

bind {
  mode = { 'n' },
  lhs = 'Q',
  rhs = '<nop>',
  opts = {
    desc = 'Disabled',
  },
}

bind {
  mode = { 'n' },
  lhs = 'q',
  rhs = '<nop>',
  opts = {
    desc = 'Disabled', },
}

bind {
  mode = { 'i' },
  lhs = 'jk',
  rhs = '<ESC>',
  opts = {
    desc = 'Exit insert mode',
  },
}

bind {
  mode = { 'i' },
  lhs = 'jj',
  rhs = '<ESC>',
  opts = {
    desc = 'Exit insert mode',
  },
}

bind {
  mode = { 'i' },
  lhs = 'kk',
  rhs = '<ESC>',
  opts = {
    desc = 'Exit insert mode',
  },
}

bind {
  mode = { 'x' },
  lhs = '<leader>p',
  rhs = '"_dp',
  opts = {
    desc = 'Delete selected text in visual mode and copy to the black hole register',
  },
}

bind {
  mode = { 'v' },
  lhs = 'J',
  rhs = ':m \'>+1<CR>gv=gv',
  opts = {
    desc = 'Move down the selected line in visual mode',
  },
}

bind {
  mode = { 'v' },
  lhs = 'K',
  rhs = ':m \'<-2<CR>gv=gv',
  opts = {
    desc = 'Move up the selected line in visual mode',
  },
}

bind {
  mode = { 'n' },
  lhs = '<leader>s',
  rhs = ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
  opts = {
    desc = 'Replace all word occurrences',
  },
}

bind {
  mode = { 'n' },
  lhs = 'k',
  rhs = "v:count == 0 ? 'gk' : 'k'",
  opts = {
    expr = true,
    desc = 'Smart up movement'
  }
}

bind {
  mode = { 'n' },
  lhs = 'j',
  rhs = "v:count == 0 ? 'gj' : 'j'",
  opts = {
    expr = true,
    desc = 'Smart down movement'
  }
}

bind {
  mode = { 'n', 'x' },
  lhs = 'H',
  rhs = '^',
  opts = {
    desc = 'Go to the first letter of current line',
  },
}

bind {
  mode = { 'n', 'x' },
  lhs = 'L',
  rhs = '$',
  opts = {
    desc = 'Go to the last letter of current line',
  },
}

bind {
  mode = { 'n' },
  lhs = '<leader>wq',
  rhs = function()
    pcall(function() vim.cmd('exe "normal \\<CR>"') end)
    pcall(function() vim.cmd('silent! !prettierd stop') end)

    if not pcall(vim.cmd.wqa) then
      pcall(function() vim.cmd('qa!') end)
    end
  end,
  opts = {
    desc = '[w]rite & [q]uit',
  },
}

bind {
  mode = { 'n' },
  lhs = '<CR>',
  rhs = function()
    local filepath = vim.fn.expand('%:p')

    pcall(function() vim.cmd('w ' .. filepath) end)
    pcall(function() vim.cmd('wa') end)
  end,
  opts = {
    desc = 'Save all',
  },
}
