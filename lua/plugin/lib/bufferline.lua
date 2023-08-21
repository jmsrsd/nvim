return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true

    local bufferline = require 'bufferline'

    bufferline.setup {
      options = {
        -- Alternatives:
        -- style_preset = bufferline.style_preset.default,
        -- style_preset = bufferline.style_preset.minimal,
        --
        style_preset = bufferline.style_preset.minimal,
        themable = true,
        numbers = "buffer_id",
        indicator = {
          style = 'underline',
        },
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "right",
            separator = true,
          },
        },
        color_icons = true,
        separator_style = "thick",
        always_show_bufferline = false,
      }
    }
  end,
}
