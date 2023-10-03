return {
  "akinsho/flutter-tools.nvim",

  lazy = false,

  ft = { "dart" },

  dependencies = {
    { "nvim-lua/plenary.nvim" },

    --- optional for vim.ui.select
    ---
    { "stevearc/dressing.nvim" },

    { "hrsh7th/nvim-cmp" },
  },

  config = function()
    local flutter = require("flutter-tools")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    flutter.setup({
      flutter_path = vim.fn.expand("$HOME") .. "/fvm/default/bin/flutter",

      fvm = true,

      ui = {
        border = "rounded",
      },

      dev_log = {
        notify_errors = false,
        open_cmd = "vnew",
      },

      decorations = {
        statusline = {
          app_version = true,
          device = true,
          project_config = true,
        },
      },
      lsp = {
        capabilities = cmp_nvim_lsp.default_capabilities(),
      },
    })
  end,
}
