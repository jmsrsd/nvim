local lsp = require("utils.lsp")

local string = require("utils.string")

local server = lsp.check_server_availability({

	bin = "flutter",

	install = "fvm install stable",

	name = "",
})

return function(capabilities)
	local flutter = require("flutter-tools")

	--- @type string
	---
	local flutter_path = ""

	flutter_path = vim.fn.expand("$HOME") .. "/fvm/default"

	flutter_path = string.trim(vim.fn.system("realpath " .. flutter_path) .. "")

	flutter_path = flutter_path .. "/bin/" .. server.bin

	flutter.setup({

		flutter_path = flutter_path,

		dev_log = {

			open_cmd = "vnew",

			notify_erros = true,
		},

		lsp = {

			capabilities = capabilities,

			color = {

				enabled = true,
			},
		},
	})
end
