local M = {}

M.setup = function()
	local keymap = require("jmsrsd.utils.keymap")

	local describe = keymap.describe

	local set = vim.keymap.set

	set("n", "g;", "<CMD>Git<CR><C-w>L<C-w>=", describe("Show fugitive"))
end

return M
