require('nvim-treesitter.configs').setup({
  -- A list of parser names, or 'all' (the five listed parsers should always be installed)
  ensure_installed = {
    'astro',
    'c',
    'comment',
    'css',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'php',
    'phpdoc',
    'prisma',
    'python',
    'query',
    'scss',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  ignore_install = { 'dart' },

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = require('jmsrsd.plugin.lsp.lib.filetypes'),
    skip_tags = {
      'area',
      'base',
      'br',
      'col',
      'command',
      'embed',
      'hr',
      'img',
      'slot',
      'input',
      'keygen',
      'link',
      'meta',
      'param',
      'source',
      'track',
      'wbr',
      'menuitem'
    }
  },

  incremental_selection = {
    enable = true,
  },

  textobjects = {
    enable = true,
  },

  indent = {
    enable = true,
  },
})
