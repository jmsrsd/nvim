local import = require 'plugin.import'

return {
  -- Colorscheme
  --
  import 'color.tokyonight',

  -- UIs
  --
  import 'icons',
  import 'nvim-tree',
  import 'lualine',
  import 'bufferline',
  import 'indent-blankline',
  import 'dressing',
  import 'notify',
  import 'telescope',

  -- Git
  --
  import 'gitsigns',
  import 'gitblame',

  -- Parsers
  --
  import 'treesitter',
  import 'autopairs',
  import 'autotag',

  -- Languages
  --
  import 'flutter',
  import 'kitty',

  -- LSP
  --
  import 'lsp-zero.base',
  import 'lsp-zero.completion',
  import 'null-ls',
  import 'lsp-zero.lsp',

  -- TS/JS
  --
  import 'prettier',
  import 'eslint',

  -- Others
  --
  import 'which-key',
  import 'fidget',
  import 'comment',
  import 'close-buffers',
}
