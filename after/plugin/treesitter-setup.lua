require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  ignore_install = { "dart" },

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact',
      'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'css', 'xml', 'php', 'markdown'
    },
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

-- ensure autotag is enabled
vim.cmd.TSEnable('autotag')
