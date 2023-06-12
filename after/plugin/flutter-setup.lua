-- flutter-tools
return function(lsp)
  local dart_lsp = lsp.build_options("dartls", {})

  require("flutter-tools").setup({
    widget_guides = {
      enabled = true,
    },
    ui = {
      flutter_lookup_cmd = "where flutter",
      decorations = {
        statusline = {
          -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
          -- this will show the current version of the flutter app from the pubspec.yaml file
          app_version = true,
          -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
          -- this will show the currently running device if an application was started with a specific
          -- device
          device = true,
          -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
          -- this will show the currently selected project configuration
          project_config = true,
        }
      }
    },
    lsp = {
      capabilities = dart_lsp.capabilities,
      -- show the derived colours for dart variables
      color = {
        enabled = true,                                -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        background = true,                             -- highlight the background
        background_color = { r = 28, g = 28, b = 28 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
        foreground = false,                            -- highlight the foreground
        virtual_text = true,                           -- show the highlight using virtual text
        virtual_text_str = "■",                      -- the virtual text character to highlight
      },
    }
  })
end
