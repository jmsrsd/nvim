local M = {}

M.setup = function()
	require("lsp-notify").setup({
		notify = require("notify").notify,
	})
end

return M
