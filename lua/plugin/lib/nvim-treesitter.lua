return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { 'nvim-treesitter/playground' },
  },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({

      ensure_installed = {
        "astro",
        "html",
        "javascript",
        "json",
        "lua",
        "query",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      },

      -- List of parsers to ignore installing (for "all")
      ignore_install = { "dart" },

      sync_install = true,

      auto_install = false,

      highlight = {

        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },

      playground = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      },
    })
  end,
}
