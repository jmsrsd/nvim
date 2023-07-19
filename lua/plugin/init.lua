local import = function(name)
  return require('plugin.lib.' .. name)
end

return {
  -- UIs
  import('color.gruvbox-material'),
  import('nvim-web-devicons'),
  import('nvim-tree'),
  import('lualine'),
  import('indent-blankline'),
  import('dressing'),
  import('telescope'),

  -- Git
  import('gitsigns'),

  -- Parsers
  import('nvim-treesitter'),
  import('nvim-autopairs'),
  import('nvim-ts-autotag'),

  -- Flutter
  import('flutter'),

  -- LSP
  import('lsp-zero.base'),
  import('lsp-zero.completion'),
  import('lsp-zero.lsp'),
  import('null-ls'),

  -- Prettier
  import('prettier'),

  -- Others
  import('which-key'),
  import('fidget'),
  import('comment'),
  import('close-buffers'),
}
