local close_buffers = require("close_buffers")
local keymaps = require("keymaps.util")

local M = {}

M.wipe_hiddens = function()
	local fn = close_buffers.wipe
	local opts = { type = "hidden" }

	pcall(fn, opts)
end

M.wipe_hiddens_and_save = function()
	pcall(keymaps.save)
	pcall(M.wipe_hiddens)
end

return M
