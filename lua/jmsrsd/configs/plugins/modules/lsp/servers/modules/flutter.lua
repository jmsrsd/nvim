local string = require("jmsrsd.utils.string")

return function(capabilities, on_attach)
	local flutter = require("flutter-tools")

	--- @type string
	---
	local flutter_path = ""

	flutter_path = vim.fn.expand("$HOME") .. "/fvm/default"

	flutter_path = string.trim(vim.fn.system("realpath " .. flutter_path) .. "")

	flutter_path = flutter_path .. "/bin/flutter"

	flutter.setup({

		flutter_path = flutter_path,

		dev_log = {

			open_cmd = "vnew",

			notify_erros = true,
		},

		lsp = {

			capabilities = capabilities,

			on_attach = on_attach,

			color = {

				enabled = true,
			},
		},
	})
end
