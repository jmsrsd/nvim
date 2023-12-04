local string = require("jmsrsd.utils.string")

local blacklisted_messages = {
	"",
	"No information available",
}

local M = {}

--- @param fidget { logger: table, notification: table, notify: function, progress: table, setup: unknown, spinner: table }
---
M.of = function(fidget)
	local instance = {}

	--- @param message string|string[]
	--- @param level integer|string|nil
	--- @param opts table|nil
	---
	instance.notify = function(message, level, opts)
		if type(message) ~= "string" then
			message = table.concat(message, " ")
		end

		--- Trim msg
		---
		message = string.trim(message)

		--- Should not notify when msg is empty
		---
		for _, blacklisted in ipairs(blacklisted_messages) do
			blacklisted = string.trim(blacklisted)

			if string.lower(message) == string.lower(blacklisted) then
				return nil
			end
		end

		local ok, result = pcall(function()
			return fidget.notify(message, level, opts)
		end)

		return ok and result or nil
	end

	return instance
end

return M
