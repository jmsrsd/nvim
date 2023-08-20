local on_attach = require 'plugin.lib.nvim-tree.on_attach'

return {
  -- Custom keymappings
  --
  on_attach = on_attach,

  filters = {
    dotfiles = false,
  },

  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,

  -- Default:
  -- hijack_unnamed_buffer_when_opening = false,
  --
  hijack_unnamed_buffer_when_opening = true,

  sync_root_with_cwd = true,

  update_focused_file = {
    enable = true,
    update_root = false,
  },

  view = {
    adaptive_size = false,
    side = "left",
    preserve_window_proportions = true,
    width = function()
      local window_width = vim.api.nvim_get_option 'columns'

      -- The buffer width should be 80.
      -- But, appearantly, the additional 7 is necessary to whole buffer
      -- be seen from line number up to maximum column border line.
      --
      local main_width = 80 + 7

      local secondary_width = window_width - main_width

      local padding_width = secondary_width / 2

      local using_padding_width = secondary_width >= main_width

      local result = (using_padding_width)
          and (padding_width)
          or (secondary_width)

      return math.floor(result)
    end,
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_label = false,

    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}
