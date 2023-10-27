local server_bin = "flutter"

local server_install = "fvm install stable"

local server_path = table.concat({
	vim.fn.expand("$HOME"),
	"/fvm/default/bin/flutter",
})

local lsp_util = require("utils.lsp")

local is_server_bin_exist = lsp_util.is_server_bin_exist(server_bin)

if is_server_bin_exist == false then
	vim.notify(
		server_bin
			.. " doesn't exist."
			.. "\n\n"
			.. "Make sure its location is at `"
			.. server_path
			.. "` and it is installed via: "
			.. server_install
	)
end

return function(_, capabilities)
	local flutter = require("flutter-tools")

	flutter.setup({

		flutter_path = server_path,

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
