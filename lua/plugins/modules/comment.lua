--- @diagnostic disable: missing-fields
---

return {
  'numToStr/Comment.nvim',

  lazy = false,

  config = function()
    local comment = require 'Comment'

    comment.setup {}
  end,
}
