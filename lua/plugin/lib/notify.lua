return {
  'rcarriga/nvim-notify',
  config = function()
    vim.opt.termguicolors = true

    local notify = require 'notify'

    notify.setup {
      background_colour = "NotifyBackground",
      fps = 30,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      timeout = 5000,
      top_down = true
    }

    vim.notify = notify
  end,
}
