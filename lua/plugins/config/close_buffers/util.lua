local M = {}

M.wipe_hiddens = function()
	pcall(require("keymaps.util").save)

	pcall(require("close_buffers").wipe, { type = "hidden" })
end

return M
