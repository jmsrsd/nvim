return {
  'sainnhe/gruvbox-material',
  config = function()
    -- Determines if 'termguicolors' should be set
    if vim.go['termguicolors'] then
      vim.o.termguicolors = true
    end

    -- Set background for dark version
    vim.o.background = 'dark'

    -- Sets the background for gruvbox-material
    vim.g.gruvbox_material_background = 'hard'

    -- The foreground color palette used in this color scheme.
    vim.g.gruvbox_material_foreground = 'mix'

    -- Determine the style of statusline/airline/lightline/lualine.
    vim.g.gruvbox_material_statusline_style = 'mix'

    -- Sets the performance configuration
    vim.g.gruvbox_material_better_performance = 1

    -- To use transparent background, set this option to `1`.
    -- If you want more ui components to be transparent
    -- (for example, status line background), set this option to `2`.
    vim.g.gruvbox_material_transparent_background = 2

    -- Loads the desired colorscheme
    vim.cmd [[colorscheme gruvbox-material]]
  end,
}
