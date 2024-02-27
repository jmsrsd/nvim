--- @alias SourceCallback fun(result: string): string | nil
--
--- @class PathUtil
--- @field lua string
---
local PathUtil = {}
PathUtil.__index = PathUtil

local _instance = nil

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
	if _instance == nil then
		_instance = self:_new()
	end

	return _instance
end

--- @param absolute_path string
---
function PathUtil:normalize_absolute_path(absolute_path)
	local trim = require("jmsrsd.utils.string").trim

	absolute_path = vim.fs.normalize(absolute_path)

	absolute_path = trim(absolute_path)

	absolute_path = vim.fn.system("realpath " .. absolute_path)

	absolute_path = trim(absolute_path)

	return absolute_path
end

--- @param absolute_path string
---
function PathUtil:relativized_path(absolute_path)
	local trim = require("jmsrsd.utils.string").trim

	local path = absolute_path

	local base_path = vim.fn.system("realpath " .. vim.fn.stdpath("config"))

	base_path = trim(base_path)

	base_path = base_path .. "/lua"

	path = path:gsub(base_path, "")

	return path
end

--- @param relative_path string
---
function PathUtil:relative_path_to_module(relative_path)
	local trim = require("jmsrsd.utils.string").trim

	local path = relative_path

	path = path:gsub("%init.lua$", "")

	path = path:gsub("%.lua$", "")

	path = path:gsub("/", " ")

	path = trim(path)

	local module = path:gsub(" ", "%.")

	return module
end

--- @param absolute_path string
---
function PathUtil:absolute_path_to_module(absolute_path)
	local path = self:relativized_path(absolute_path)

	return self:relative_path_to_module(path)
end

--- @param source_callback SourceCallback
---
function PathUtil:get_current_absolute_path(source_callback)
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
function PathUtil:get_current_relative_path(source_callback)
	local path = self:get_current_absolute_path(source_callback)

	return self:relativized_path(path)
end

--- @param source_callback SourceCallback
---
function PathUtil:get_current_module_path(source_callback)
	local path = self:get_current_relative_path(source_callback)

	return self:relative_path_to_module(path)
end

--- @param source_callback SourceCallback
---
function PathUtil:get_parent_absolute_path(source_callback)
	local trim = require("jmsrsd.utils.string").trim

	local path = self:get_current_absolute_path(source_callback)

	path = vim.fn.system("dirname " .. path)

	path = trim(path)

	return path
end

--- @param source_callback SourceCallback
---
function PathUtil:get_parent_relative_path(source_callback)
	local path = self:get_parent_absolute_path(source_callback)

	return self:relativized_path(path)
end

--- @param source_callback SourceCallback
---
function PathUtil:get_parent_module_path(source_callback)
	local path = self:get_parent_relative_path(source_callback)

	return self:relative_path_to_module(path)
end

--- @param source_callback SourceCallback
--- @param middleware fun(parent: string): string
---
--- @return unknown
---
function PathUtil:import(middleware, source_callback)
	local parent = self:get_parent_absolute_path(source_callback)

	local path = middleware(parent)

	path = self:normalize_absolute_path(path)

	local module = self:absolute_path_to_module(path)

	return require(module)
end

return PathUtil
