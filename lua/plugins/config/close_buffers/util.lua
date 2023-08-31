local M = {}

M.wipe_hiddens = function()
	pcall(function()
		require("keymaps.util").save()
	end)

	pcall(function()
		require("close_buffers").wipe({ type = "hidden" })
	end)
end

return M
