local cmp = require 'cmp'

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources {
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  },
  {
    { name = 'buffer' },
  }
})

require('cmp_git').setup()
