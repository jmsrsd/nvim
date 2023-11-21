local M = {}

M.setup = function()
	local notify = function(message, level, opts)
		local ok, result = pcall(function()
			return require("notify").notify(message, level, opts)
		end)

		return ok and result or nil
	end

	require("lsp-notify").setup({
		notify = notify,
	})
end

return M
