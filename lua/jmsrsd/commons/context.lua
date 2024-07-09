local helper = {
	string = require("jmsrsd.helpers.string"),
	array = require("jmsrsd.helpers.array"),
	path = require("jmsrsd.helpers.path"),
}

local M = {}

M.new = function(props)
	if props == nil then
		props = {}
	end

	local instance = {}

	instance.source = {}

	instance.source.file = function()
		return debug.getinfo(props.target, "S").source:sub(2)
	end

	instance.source.directory = function()
		local file = instance.source.file()

		local split = helper.string.split(file, "/")

		split = helper.array.remove_empty_strings(split)

		split = helper.array.slice(split, 1, #split - 1)

		return "/" .. table.concat(split, "/")
	end

	instance.import = function(module)
		local directory = instance.source.directory()

		local path = directory .. "/" .. module

		local normalized = helper.path.normalize(path)

		path = helper.string.trim(vim.fn.system("readlink -f " .. path))

		path = path ~= "" and path or normalized

		path = string.gsub(path, vim.fn.stdpath("config") .. "/lua/", "")

		local result, _ = string.gsub(path, "/", ".")

		return require(result)
	end

	return instance
end

return M
