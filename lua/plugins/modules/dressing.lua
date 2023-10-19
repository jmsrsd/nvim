return {
  'stevearc/dressing.nvim',

  config = function()
    local dressing = require 'dressing'

    dressing.setup {

      input = {

        mappings = {

          n = {

            ['<ESC>'] = false,

            ['q'] = 'Close',
          }
        }

      }
    }
  end,
}
