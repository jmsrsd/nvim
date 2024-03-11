--- @alias SourceCallback fun(result: string): string | nil

--- @class Path
--- @field lua string
---
local M = {}
M.__index = M

--- @param absolute_path string
---
M.normalize_absolute_path = function(absolute_path)
	local trim = require("jmsrsd.utils.string").trim

	absolute_path = vim.fs.normalize(absolute_path)

	absolute_path = trim(absolute_path)

	absolute_path = vim.fn.system("realpath " .. absolute_path)

	absolute_path = trim(absolute_path)

	return absolute_path
end

--- @param absolute_path string
---
M.relativized_path = function(absolute_path)
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
M.relative_path_to_module = function(relative_path)
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
M.absolute_path_to_module = function(absolute_path)
	local path = M.relativized_path(absolute_path)

	return M.relative_path_to_module(path)
end

--- @param source_callback SourceCallback
---
M.get_current_absolute_path = function(source_callback)
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
M.get_current_relative_path = function(source_callback)
	local path = M.get_current_absolute_path(source_callback)

	return M.relativized_path(path)
end

--- @param source_callback SourceCallback
---
M.get_current_module_path = function(source_callback)
	local path = M.get_current_relative_path(source_callback)

	return M.relative_path_to_module(path)
end

--- @param source_callback SourceCallback
---
M.get_parent_absolute_path = function(source_callback)
	local trim = require("jmsrsd.utils.string").trim

	local path = M.get_current_absolute_path(source_callback)

	path = vim.fn.system("dirname " .. path)

	path = trim(path)

	return path
end

--- @param source_callback SourceCallback
---
M.get_parent_relative_path = function(source_callback)
	local path = M.get_parent_absolute_path(source_callback)

	return M.relativized_path(path)
end

--- @param source_callback SourceCallback
---
M.get_parent_module_path = function(source_callback)
	local path = M.get_parent_relative_path(source_callback)

	return M.relative_path_to_module(path)
end

--- @param source_callback SourceCallback
--- @param middleware fun(parent: string): string
---
--- @return unknown
---
M.import = function(middleware, source_callback)
	local parent = M.get_parent_absolute_path(source_callback)

	local path = middleware(parent)

	path = M.normalize_absolute_path(path)

	local module = M.absolute_path_to_module(path)

	return require(module)
end

return M
