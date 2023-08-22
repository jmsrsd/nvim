local bind = require 'util.bind'

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-media-files.nvim' },
    { 'tsakirist/telescope-lazy.nvim' },
    { "nvim-telescope/telescope-file-browser.nvim" },
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
        notify = {
          -- This config is intentionally empty
          --
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
        lazy = {
          -- Optional theme (the extension doesn't set a default theme)
          theme = "dropdown",
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
        file_browser = {
          -- Default:
          -- theme = "ivy",
          --
          theme = 'dropdown',
          -- disables netrw and use telescope-file-browser in its place
          --
          hijack_netrw = true,
        },
      }
    }

    telescope.load_extension 'notify'
    telescope.load_extension 'media_files'
    telescope.load_extension 'lazy'

    telescope.load_extension 'file_browser'
    bind {
      mode = "n",
      lhs = "<space>pp",
      rhs = ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      opts = {
        noremap = true,
        desc = 'Open [p]roject [p]ane',
      },
    }
  end,
}
