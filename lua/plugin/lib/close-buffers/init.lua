return {
  'kazhala/close-buffers.nvim',
  dependencies = {
    { 'nvim-tree/nvim-tree.lua' },
  },
  config = function()
    require('close_buffers').setup({
      -- Filetype to ignore when running deletions
      --
      filetype_ignore = {},

      -- File name glob pattern to ignore when running deletions (e.g. '*.md')
      --
      file_glob_ignore = {},

      -- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
      --
      file_regex_ignore = {},

      -- Types of deletion that should preserve the window layout
      --
      preserve_window_layout = { 'this', 'nameless' },

      -- Custom function to retrieve the next buffer when preserving window layout
      --
      next_buffer_cmd = nil,
    })
  end,
}
