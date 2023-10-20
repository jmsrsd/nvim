local path_util = require("utils.path")

local import = require("utils.import")

return function(name, use_parent_module_callback)
	local callback = use_parent_module_callback

	local dir_path = path_util.use_relative_module_path(name, callback)

	local result = {}

	local file_paths = vim.split(vim.fn.glob(dir_path .. "/*"), "\n")

	for _, file_path in ipairs(file_paths) do
		local module = path_util.to_module(file_path)

		result[module] = import(function(_)
			return module
		end)
	end

	return result
end
