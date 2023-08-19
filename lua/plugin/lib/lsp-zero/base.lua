return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  lazy = true,
  config = function()
    -- This is where you modify the settings for lsp-zero
    -- Note: autocompletion settings will not take effect
    --
    local settings = require 'lsp-zero.settings'

    settings.preset {}
  end
}
