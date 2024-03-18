--- @class LspModuleUtil
---
local M = {}
M.__index = M

M.stop_lsp_servers_on_web_filetypes = function()
	local web_filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"html",
		"astro",
	}

	local is_web_filetype = (function()
		for _, filetype in ipairs(web_filetypes) do
			if string.find(filetype, vim.bo.filetype) then
				return true
			end
		end

		return false
	end)()

	return pcall(function()
		local result = is_web_filetype and vim.cmd("LspStop ++force") or nil

		vim.wait(100)

		return result
	end)
end

return M
