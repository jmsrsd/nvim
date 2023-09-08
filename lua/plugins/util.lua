local M = {}

--- @param plugin string
--- @return unknown, unknown
M.use = function(plugin)
	return require("plugins.config." .. plugin)
end

return M
