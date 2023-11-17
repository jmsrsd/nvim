---@diagnostic disable: undefined-field
---

local function get_diagnostic_label(props)
	local label_icons = {
		Error = "",
		Warn = "",
		Info = "",
		Hint = "",
	}

	local label = {}

	for severity, icon in pairs(label_icons) do
		local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })

		if n > 0 then
			local hl = vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)

			local fg = "#" .. string.format("%06x", hl["foreground"])

			table.insert(label, { icon .. " " .. n .. " ", guifg = fg })
		end
	end

	return label
end

return function()
	local incline = require("incline")

	local icons = require("nvim-web-devicons")

	local trim_string = require("jmsrsd.utils.string").trim

	incline.setup({
		debounce_threshold = {
			falling = 500,
			rising = 250,
		},

		---@class InclineRenderProps
		---@field buf number
		---@field win number
		---@field focused boolean
		---

		---@param props InclineRenderProps
		---
		render = function(props)
			if not props.focused then
				return ""
			end

			--- @type {current: number, total: number}
			---
			local search_count = vim.fn.searchcount({
				recompute = 1,
				maxcount = -1,
			}) or { current = 0, total = 0 }

			local search_contents = trim_string(vim.fn.getreg("/") .. "")

			local search_display = {
				{
					("  %s  "):format(trim_string((" %s"):format(search_contents))),
					group = "IncSearch",
				},
				{ " " },
				{
					(" %d/%d "):format(search_count.current, search_count.total),
					group = "dkoStatusValue",
				},
			}

			local bufname = vim.api.nvim_buf_get_name(props.buf)

			local filename = vim.fn.fnamemodify(bufname, ":t")

			local diagnostics = get_diagnostic_label(props)

			local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"

			local filetype_icon, filetype_color = icons.get_icon_color(filename)

			local display = {
				{ filetype_icon, guifg = filetype_color },
				{ "  " },
				{ filename, gui = modified },
				{ "  " },
			}

			if #diagnostics > 0 then
				table.insert(diagnostics, { "| ", guifg = "grey" })
			end

			for _, buf in ipairs(display) do
				table.insert(diagnostics, buf)
			end

			for _, buf in ipairs(search_display) do
				table.insert(diagnostics, buf)
			end

			return diagnostics
		end,

		window = {
			margin = { horizontal = 0 },
			padding = 0,
		},
	})
end
