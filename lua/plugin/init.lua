local plugin = function(name)
  return require('plugin.lib.' .. name)
end

return {
  -- UIs
  plugin('color.gruvbox-material'),
  plugin('nvim-web-devicons'),
  plugin('nvim-tree'),
  plugin('lualine'),
  plugin('indent-blankline'),
  plugin('dressing'),
  plugin('telescope'),

  -- Git
  plugin('gitsigns'),

  -- Parsers
  plugin('nvim-treesitter'),
  plugin('nvim-autopairs'),
  plugin('nvim-ts-autotag'),

  -- LSPs
  plugin('lsp-zero.base'),
  plugin('lsp-zero.completion'),
  plugin('lsp-zero.lsp'),

  -- Prettier
  plugin('prettier'),

  -- Others
  plugin('which-key'),
  plugin('fidget'),
  plugin('comment'),
}
