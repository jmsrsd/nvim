local M = {}

M.use = function(plugin)
	return require("plugins.config." .. plugin)
end

return M
