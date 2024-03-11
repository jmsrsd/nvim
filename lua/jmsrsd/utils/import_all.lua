local path = require("jmsrsd.utils.path") --[[@as Path]]

local string = require("jmsrsd.utils.string")

--- @param target string
--- @param source_callback SourceCallback
---
return function(target, source_callback)
	local result = {}

	local dir = path.get_parent_absolute_path(source_callback)

	dir = path.normalize_absolute_path(dir .. "/" .. target)

	local files = string.split(vim.fn.glob(dir .. "/*"), "\n")

	local modules = vim.tbl_map(function(file)
		return path.absolute_path_to_module(file)
	end, files)

	for _, module in pairs(modules) do
		local split = string.split(module, ".")

		local name = split[#split]

		result[name] = require(module)
	end

	return result
end
