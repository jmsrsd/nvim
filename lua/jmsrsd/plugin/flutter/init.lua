local on_attach = require 'jmsrsd.plugin.lsp.lib.on-attach'

-- This relative flutter path is hardcoded for now
local flutter_relative_path = '/scoop/apps/fvm/current/default/bin/flutter.bat'

return function(capabilities)
	local windows_home_path = ''

	if require 'jmsrsd.core.util'.is_on_windows then
		windows_home_path = tostring(os.getenv('userprofile'))
	else
		windows_home_path = '/mnt/c/Users/Jemal'
	end

	require "flutter-tools".setup {
		flutter_path = vim.fn.expand(windows_home_path .. flutter_relative_path),

		widget_guides = {
			enabled = true,
		},
		lsp = {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				analysisExcludedFolders = {
					vim.fn.expand(windows_home_path .. '/AppData/Local/Pub/Cache'),
					vim.fn.expand(windows_home_path .. "/scoop"),
				},
			},
			-- show the derived colours for dart variables
			color = {
				enabled = true,                            -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
				background = true,                         -- highlight the background
				background_color = { r = 28, g = 28, b = 28 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
				foreground = false,                        -- highlight the foreground
				virtual_text = true,                       -- show the highlight using virtual text
				virtual_text_str = "■",                  -- the virtual text character to highlight
			},
		}
	}

	require("telescope").load_extension("flutter")
end
