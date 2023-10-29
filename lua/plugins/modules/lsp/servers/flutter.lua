local lsp_util = require("utils.lsp")

local server_opts = lsp_util.check_server_availability({

	bin = "flutter",

	install = "fvm install stable",

	name = "",
})

return function(capabilities)
	local flutter = require("flutter-tools")

	local is_flutter_exist = lsp_util.is_server_bin_exist(server_opts.bin)

	local flutter_path = vim.fn.system("which " .. server_opts.bin) .. ""

	flutter.setup({

		flutter_path = is_flutter_exist and flutter_path or nil,

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
