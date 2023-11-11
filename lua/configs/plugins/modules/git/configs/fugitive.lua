local M = {}

M.setup = function()
	local keymap = require("utils.keymap")

	local describe = keymap.describe

	local set = vim.keymap.set

	set("n", "g;", "<CMD>Git<CR>", describe("Show fugitive"))
end

return M
