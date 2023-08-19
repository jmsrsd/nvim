local M = {}

M.setup = function(capabilities, on_attach)
  local ok, flutter_tools = pcall(function()
    return require 'flutter-tools'
  end)

  if not ok then
    return
  end

  local home_path = os.getenv 'HOME'

  local flutter_path = home_path .. '/fvm/versions/stable/bin/flutter'

  flutter_tools.setup {
    flutter_path = flutter_path,

    ui = {
      notification_style = 'plugin',
      -- notification_style = 'native',
    },

    lsp = {
      capabilities = capabilities,

      on_attach = on_attach,

      -- show the derived colours for dart variables
      --
      color = {

        -- whether or not to highlight color variables at all,
        -- only supported on flutter >= 2.10
        --
        enabled = true,

        -- highlight the background
        --
        background = false,

        -- required, when background is transparent
        -- (i.e. background_color = { r = 19, g = 17, b = 24},)
        --
        background_color = { r = 10, g = 10, b = 10 },

        -- highlight the foreground
        --
        foreground = false,

        -- show the highlight using virtual text
        --
        virtual_text = true,

        -- the virtual text character to highlight
        --
        virtual_text_str = "■",
      },
    },

    settings = {
      renameFilesWithClasses = "always",
      -- renameFilesWithClasses = "prompt", -- "always"
    },

    decorations = {
      statusline = {
        app_version = true,
        device = true,
        project_config = true,
      }
    },
  }
end

return M
