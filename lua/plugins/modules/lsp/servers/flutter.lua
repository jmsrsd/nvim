local lsp_util = require("utils.lsp")

local server_opts = lsp_util.check_server_availability({

	bin = "flutter",

	install = "fvm install stable",

	name = "",
})

local is_server_bin_exist = lsp_util.is_server_bin_exist(server_opts.bin)

local server_path = vim.fn.system("which " .. server_opts.bin) .. ""

return function(_, capabilities)
	local flutter = require("flutter-tools")

	flutter.setup({

		flutter_path = is_server_bin_exist and server_path or nil,

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
