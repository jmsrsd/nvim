return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			background_colour = "#000000",
			timeout = 700,
			top_down = false,
		})

		local notifier = function(msg, level, opts)
			--- Trim msg
			---
			msg = string.gsub(msg, "^%s*(.-)%s*$", "%1")

			local banned_messages = {
				"",
				"No information available",
			}

			--- Should not notify when msg is empty
			---
			for _, banned in ipairs(banned_messages) do
				if msg == banned then
					return
				end
			end

			return notify(msg, level, opts)
		end

		vim.notify = notifier
	end,
}
