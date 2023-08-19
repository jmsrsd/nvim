return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { "nvim-telescope/telescope-github.nvim" },
    { 'nvim-telescope/telescope-media-files.nvim' },
    { 'gbrlsnchs/telescope-lsp-handlers.nvim' },
    { 'tsakirist/telescope-lazy.nvim' },
  },
  config = function()
    local telescope = require 'telescope'
    local themes = require 'telescope.themes'

    telescope.setup {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_ignore_patterns = { "node_modules", "undodir" },
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      },
      extensions = {
        notify = {},
        fzf = {
          -- false will only do exact matching
          --
          fuzzy = true,
          -- override the generic sorter
          --
          override_generic_sorter = true,
          -- override the file sorter
          --
          override_file_sorter = true,
          -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
          --
          case_mode = "smart_case",
        },
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = {
            "jpeg",
            "jpg",
            "png",
            "svg",
            "webp",
          },
          -- find command (defaults to `fd`)
          find_cmd = "rg"
        },
        lsp_handlers = {
          disable = {},
          location = {
            telescope = themes.get_dropdown {},
            no_results_message = 'No references found',
          },
          symbol = {
            telescope = themes.get_dropdown {},
            no_results_message = 'No symbols found',
          },
          call_hierarchy = {
            telescope = themes.get_dropdown {},
            no_results_message = 'No calls found',
          },
          code_action = {
            telescope = themes.get_dropdown {},
            no_results_message = 'No code actions available',
            prefix = '',
          },
        },
        lazy = {
          -- Optional theme (the extension doesn't set a default theme)
          theme = "ivy",
          -- theme = "ivy",
          -- Whether or not to show the icon in the first column
          show_icon = true,
          -- Mappings for the actions
          mappings = {
            open_in_browser = "<C-o>",
            open_in_file_browser = "<M-b>",
            open_in_find_files = "<C-f>",
            open_in_live_grep = "<C-g>",
            open_plugins_picker = "<C-b>", -- Works only after having called first another action
            open_lazy_root_find_files = "<C-r>f",
            open_lazy_root_live_grep = "<C-r>g",
          },
          -- Other telescope configuration options
        },
      }
    }

    telescope.load_extension 'notify'
    telescope.load_extension 'fzf'
    telescope.load_extension 'gh'
    telescope.load_extension 'media_files'
    telescope.load_extension 'lsp_handlers'
    telescope.load_extension 'lazy'
  end,
}
