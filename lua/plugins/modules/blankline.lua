return {

  "lukas-reineke/indent-blankline.nvim",

  branch = 'master',

  main = 'ibl',

  config = function()
    local blankline = require "ibl"

    blankline.setup {}
  end,
}
