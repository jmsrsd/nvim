local M = {}

M.setup = function(capabilities, on_attach)
  require('flutter-tools').setup({
    flutter_path = os.getenv('userprofile')
        .. '/scoop/persist/fvm/versions/3.10.5/bin/flutter.bat',
    lsp = {
      capabilities = capabilities,
      on_attach = on_attach,
      color = {                                        -- show the derived colours for dart variables
        enabled = true,                                -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        background = false,                            -- highlight the background
        background_color = { r = 10, g = 10, b = 10 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
        foreground = false,                            -- highlight the foreground
        virtual_text = true,                           -- show the highlight using virtual text
        virtual_text_str = "■",                      -- the virtual text character to highlight
      },
    },
    decorations = {
      statusline = {
        app_version = true,
        device = true,
        project_config = true,
      }
    },
  })
end

return M
