return function()
	local path = require("jmsrsd.utils.path"):new() --[[@as PathUtil]]

	local lazy = require("lazy")

	local paths = path:get_relative_module_path("modules", function() end)

	local modules = path:to_module(paths)

	local options = {
		ui = {
			border = "rounded",
		},
		change_detection = {
			notify = false,
		},
	}

	return lazy.setup(modules, options)
end
