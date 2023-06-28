local cmp = require 'cmp'

local border = {
  "╭",
  "─",
  "╮",
  "│",
  "╯",
  "─",
  "╰",
  "│",
}

return {
  completion = cmp.config.window.bordered {
    border = border,
  },
  documentation = cmp.config.window.bordered {
    border = border,
  },
}
