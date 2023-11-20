---@diagnostic disable: undefined-field
---

---@class InclineRenderProps
---@field buf number
---@field win number
---@field focused boolean
---

local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. ".modules." .. module
	end, function() end)
end

return function()
	local errors = {}

	local on_error = function(error)
		error = error .. ""

		for _, e in ipairs(errors) do
			if e == error then
				return
			end
		end

		table.insert(errors, error)

		vim.notify(error)
	end

	local incline = require("incline")

	incline.setup({
		debounce_threshold = {
			falling = 500,
			rising = 250,
		},

		---@param props InclineRenderProps
		---
		render = function(props)
			if not props.focused then
				return ""
			end

			local ok, view = xpcall(function()
				local search = import("search").render()

				local diagnostics = import("diagnostics").render(props)

				local view = {}

				for _, buf in ipairs(diagnostics) do
					table.insert(view, buf)
				end

				for _, buf in ipairs(search) do
					table.insert(view, buf)
				end

				return view
			end, on_error)

			return ok and view or ""
		end,

		window = {

			margin = { horizontal = 0 },

			padding = 0,
		},
	})
end
