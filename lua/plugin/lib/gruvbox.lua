-- return {
--   'eddyekofo94/gruvbox-flat.nvim',
--   priority = 1000,
--   enabled = true,
--   config = function()
--     vim.g.gruvbox_flat_style = "dark"
--     vim.g.gruvbox_transparent = true
--
--     vim.cmd([[colorscheme gruvbox-flat]])
--   end,
-- }

return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,    -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
    })

    vim.o.background = "dark" -- or "light" for light mode

    vim.cmd('colorscheme gruvbox')
  end,
}
