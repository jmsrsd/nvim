return function()
	local path = require("jmsrsd.utils.path") --[[@as Path]]

	local lazy = require("lazy")

	local paths = path.get_parent_absolute_path(function() end) .. "/modules"

	local modules = path.absolute_path_to_module(paths)

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
