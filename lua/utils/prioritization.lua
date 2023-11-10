local M = {}

M.of = function(index)
	return require("utils.number").maxFinite - index
end

return M
