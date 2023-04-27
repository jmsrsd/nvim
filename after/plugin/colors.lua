
function SetColors()
	local colors = require('onedark')

	colors.setup {
		style = 'warmer',
		transparent = true,
	}

	colors.load()

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColors()
