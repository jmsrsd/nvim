local M = {}

--- @param plugin string
--- @return table
M.use = function(plugin)
	return require("plugins.config." .. plugin)
end

return M
