--- @class ContextProps
--- @field target fun()|nil

--- @alias ContextImport fun(module: string): any

--- @class Context
--- @field import ContextImport
--- @field source ContextSource

--- @class ContextSource
--- @field file fun(): string
--- @field directory fun(): string

local helper = {
	string = require("jmsrsd.helpers.string"),
	array = require("jmsrsd.helpers.array"),
	path = require("jmsrsd.helpers.path"),
}

--- @param props ContextProps
--- @return Context
return function(props)
	local self = {}

	self.source = {}

	self.source.file = function()
		return debug.getinfo(props.target, "S").source:sub(2)
	end

	self.source.directory = function()
		local file = self.source.file()

		local split = helper.string.split(file, "/")

		split = helper.array.remove_empty_strings(split)

		split = helper.array.slice(split, 1, #split - 1)

		return "/" .. table.concat(split, "/")
	end

	self.import = function(module)
		local directory = self.source.directory()

		local path = directory .. "/" .. module

		local normalized = helper.path.normalize(path)

		path = helper.string.trim(vim.fn.system("readlink -f " .. path))

		path = path ~= "" and path or normalized

		path = string.gsub(path, vim.fn.stdpath("config") .. "/lua/", "")

		local result, _ = string.gsub(path, "/", ".")

		return require(result)
	end

	return self
end
