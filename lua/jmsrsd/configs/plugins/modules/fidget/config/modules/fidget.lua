local M = {}

M.setup = function()
	local fidget = require("fidget")

	fidget.setup({

		-- Options related to notification subsystem
		notification = {

			-- Options related to the notification window and buffer
			window = {

				normal_hl = "Comment", -- Base highlight group in the notification window

				winblend = 0, -- Background color opacity in the notification window

				border = "rounded", -- Border around the notification window

				border_hl = "NONE",

				zindex = 45, -- Stacking priority of the notification window

				max_width = 0, -- Maximum width of the notification window

				max_height = 0, -- Maximum height of the notification window

				x_padding = 0, -- Padding from right edge of window boundary

				y_padding = 0, -- Padding from bottom edge of window boundary

				relative = "editor", -- What the notification window position is relative to
			},
		},
	})

	return fidget
end

return M
