local plugin = function(name)
  return require('plugin.lib.' .. name)
end

return {
  -- UIs
  plugin('gruvbox'),
  plugin('nvim-web-devicons'),
  plugin('nvim-tree'),
  plugin('indent-blankline'),
  plugin('telescope'),

  -- Git
  plugin('gitsigns'),

  -- Parsers
  plugin('nvim-treesitter'),
  plugin('nvim-autopairs'),
  plugin('nvim-ts-autotag'),

  -- LSPs
  plugin('lsp-zero'),

  -- Others
  plugin('which-key'),
}
