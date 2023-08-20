return {
  'rcarriga/nvim-notify',
  config = function()
    vim.opt.termguicolors = true

    local notify = require 'notify'

    notify.setup {
      level = 2,
      timeout = 1000,

      max_width = math.floor(87 / 2),
      minimum_width = math.floor(87 / 3),

      background_colour = "NotifyBackground",
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },

      -- Default:
      -- stages = "fade_in_slide_out",
      --
      stages = "slide",
      render = "default",

      fps = 30,
      top_down = false,
    }

    vim.notify = notify
  end,
}
