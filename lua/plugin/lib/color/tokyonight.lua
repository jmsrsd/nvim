return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Setup tokyonight
    --
    local tokyonight = require 'tokyonight'

    tokyonight.setup {
      style = 'night',
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      sidebars = { "qf", "vista_kind", "terminal", "packer" },
      hide_inactive_statusline = true,
      lualine_bold = true,
    }

    -- Apply tokyonight
    --
    vim.cmd.colorscheme 'tokyonight'
  end,
}
