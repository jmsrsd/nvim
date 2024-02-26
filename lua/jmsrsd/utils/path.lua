--- @alias SourceCallback fun(result: string): string | nil
--
--- @class PathUtil
--- @field lua string
---
local PathUtil = {}
PathUtil.__index = PathUtil

local instanceOfPathUtil = nil

--- @return PathUtil
---
function PathUtil:_new(this)
	this = this or {}
	setmetatable(this, self)
	self.__index = self

	this.lua = vim.fn.stdpath("config") .. "/lua"

	return this
end

function PathUtil:new()
	if instanceOfPathUtil == nil then
		instanceOfPathUtil = PathUtil:_new()
	end

	return instanceOfPathUtil
end

--- @param source_callback SourceCallback
---
function PathUtil:_get_current_absolute_path(source_callback)
	local trim = require("jmsrsd.utils.string").trim

	local path = debug.getinfo(source_callback, "S").source

	local root_char_pos = string.find(path, "/")

	if root_char_pos then
		path = string.sub(path, root_char_pos)
	end

	path = vim.fn.system("realpath " .. path)

	path = trim(path)

	return path
end

--- @param source_callback SourceCallback
---
function PathUtil:_get_current_relative_path(source_callback)
	local trim = require("jmsrsd.utils.string").trim

	local path = self:_get_current_absolute_path(source_callback)

	local base_path = vim.fn.system("realpath " .. vim.fn.stdpath("config"))

	base_path = trim(base_path)

	base_path = base_path .. "/lua"

	path = path:gsub(base_path, "")

	return path
end

--- @param source_callback SourceCallback
---
function PathUtil:_get_current_module_path(source_callback)
	local trim = require("jmsrsd.utils.string").trim

	local path = self:_get_current_relative_path(source_callback)

	path = path:gsub("%init.lua$", "")

	path = path:gsub("%.lua$", "")

	path = path:gsub("/", " ")

	path = trim(path)

	local module = path:gsub(" ", "%.")

	return module
end

--- @param source_callback SourceCallback
---
function PathUtil:_get_parent_absolute_path(source_callback)
	local trim = require("jmsrsd.utils.string").trim

	local path = self:_get_current_absolute_path(source_callback)

	path = vim.fn.system("dirname " .. path)

	path = trim(path)

	return path
end

--- @param source_callback SourceCallback
---
function PathUtil:_get_parent_relative_path(source_callback)
	local trim = require("jmsrsd.utils.string").trim

	local path = self:_get_parent_absolute_path(source_callback)

	local base_path = vim.fn.system("realpath " .. vim.fn.stdpath("config"))

	base_path = trim(base_path)

	base_path = base_path .. "/lua"

	path = path:gsub(base_path, "")

	return path
end

--- @param source_callback SourceCallback
---
function PathUtil:_get_parent_module_path(source_callback)
	local trim = require("jmsrsd.utils.string").trim

	local path = self:_get_parent_relative_path(source_callback)

	path = path:gsub("%init.lua$", "")

	path = path:gsub("%.lua$", "")

	path = path:gsub("/", " ")

	path = trim(path)

	local module = path:gsub(" ", "%.")

	return module
end

--- @alias SourceCallback fun(result: string): string | nil

--- Get the parent directory of the
---
--- source file where
---
--- the `source_function` is defined.
---
--- @param source_function SourceCallback
---
--- @return string
---
function PathUtil:get_parent_module(source_function)
	local file = debug.getinfo(source_function, "S").source

	local parent = string.sub(vim.fn.fnamemodify(file, ":h") .. "", 2)

	parent = vim.fn.fnamemodify(parent, ":p")

	parent = parent:gsub(self.lua .. "/", ""):gsub("/", ".")

	return parent
end

--- @param source_function SourceCallback
---
function PathUtil:get_parent_module_path(source_function)
	local parent_module = self:get_parent_module(source_function)

	local result = parent_module:gsub("%.", "/")

	result = self.lua .. "/" .. result

	return vim.fn.fnamemodify(result, ":p")
end

--- @param module string
--- @param source_function SourceCallback
---
function PathUtil:get_relative_module_path(module, source_function)
	local parent_path = self:get_parent_module_path(source_function)

	local result = parent_path .. "/" .. module

	return vim.fn.fnamemodify(result, ":p")
end

--- @param path string
---
--- @return string
---
function PathUtil:to_module(path)
	local string = require("jmsrsd.utils.string")

	path = vim.fn.fnamemodify(path, ":p")

	while path:match("//") do
		path = path:gsub("//", "/")
	end

	local module = path:gsub(self.lua .. "/", ""):gsub("/", ".")

	--- Remove .lua extension
	---
	local split = string.split(module, ".")

	if split[#split] == "lua" then
		table.remove(split, #split)
	end

	local result = table.concat(split, ".")

	return result
end

function PathUtil:import(middleware, source_function)
	local module = self:get_parent_module_path(source_function)

	local path = middleware(module)

	path = vim.fn.fnamemodify(path, ":p")

	local before, after = string.match(path, "(.*)/nvim/lua/(.*)")

	local result = self:to_module(self.lua .. "/" .. after)

	return require(result)
end

return PathUtil
