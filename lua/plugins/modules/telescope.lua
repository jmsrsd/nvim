return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  branch = 'master',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'
    local sorters = require 'telescope.sorters'
    local previewers = require 'telescope.previewers'
    local load_extension = telescope.load_extension

    local create_buffer_previewer_maker = function()
      local Job = require "plenary.job"

      return function(filepath, bufnr, opts)
        filepath = vim.fn.expand(filepath) .. ''

        Job:new {
          command = "file",
          args = { "--mime-type", "-b", filepath },
          on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]

            if mime_type == "text" then
              previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
              --- Maybe we want to write something to the buffer here
              ---
              vim.schedule(function()
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {
                  "   No preview available"
                })
              end)
            end
          end
        }:sync()
      end
    end

    telescope.setup {
      defaults = {
        mappings = {
          n = {
            ['<ESC>'] = false,
            ['q'] = actions.close,
          },
        },

        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim"
        },

        prompt_prefix = "   ",

        selection_caret = "  ",

        entry_prefix = "  ",

        initial_mode = "insert",

        selection_strategy = "reset",

        sorting_strategy = "ascending",

        --- Can be set with:
        --- "vertical", or "horizontal"
        ---
        layout_strategy = "vertical",

        layout_config = {
          vertical = {
            preview_height = 0.6,
            results_height = 0.4,
          },

          -- horizontal = {
          -- 	prompt_position = "top",
          -- 	preview_width = 0.55,
          -- 	results_width = 0.8,
          -- },

          -- vertical = {
          -- 	mirror = false,
          -- },

          -- width = 0.87,

          -- height = 0.80,

          -- preview_cutoff = 120,
        },

        file_sorter = sorters.get_fuzzy_file,

        file_ignore_patterns = { "node_modules" },

        generic_sorter = sorters.get_generic_fuzzy_sorter,

        path_display = { "truncate" },

        winblend = 0,

        border = {},

        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

        color_devicons = true,

        --- default = nil,
        ---
        set_env = { ["COLORTERM"] = "truecolor" },

        file_previewer = previewers.vim_buffer_cat.new,

        grep_previewer = previewers.vim_buffer_vimgrep.new,

        qflist_previewer = previewers.vim_buffer_qflist.new,

        buffer_previewer_maker = create_buffer_previewer_maker(),
      },
      pickers = {
        find_files = {
          --- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          ---
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      }
    }

    load_extension 'fzf'

    vim.keymap.set('n', '<leader>f', builtin.find_files, {
      noremap = true,
      silent = true,
      desc = 'Search for files (respecting .gitignore)',
    })

    vim.keymap.set('n', '<leader>g', builtin.live_grep, {
      noremap = true,
      silent = true,
      desc = 'Search for a string and get '
          .. 'results live as '
          .. 'you type, respects .gitignore'
    })

    vim.keymap.set('n', '<leader>b', builtin.buffers, {
      noremap = true,
      silent = true,
      desc = 'Lists open buffers in '
          .. 'current neovim instance, opens '
          .. 'selected buffer on `<cr>`'
    })

    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {
      noremap = true,
      silent = true,
      desc = 'Live fuzzy search inside of the currently open buffer'
    })
  end,
}
