local helper = {
	string = require("jmsrsd.helper.string"),
}

return {

	"j-hui/fidget.nvim",

	lazy = false,

	config = function()
		--- Setup fidget.nvim
		---
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

		--- Override vim.notify
		---

		local blacklisted_messages = {
			"",
			"No information available",
		}

		vim.notify = function(message, level, opts)
			if type(message) ~= "string" then
				message = table.concat(message, " ")
			end

			--- Trim msg
			---
			message = helper.string.trim(message)

			--- Should not notify when msg is empty
			---
			for _, blacklisted in ipairs(blacklisted_messages) do
				blacklisted = helper.string.trim(blacklisted)

				if string.lower(message) == string.lower(blacklisted) then
					return nil
				end
			end

			local ok, result = pcall(function()
				return fidget.notify(message, level, opts)
			end)

			return ok and result or nil
		end
	end,
}
