---@diagnostic disable: undefined-field
---

local function get_diagnostic_label(props)
	local icons = {
		Error = "",
		Warn = "",
		Info = "",
		Hint = "",
	}

	local label = {}

	for severity, icon in pairs(icons) do
		local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })

		if n > 0 then
			local hl = vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)

			local fg = "#" .. string.format("%06x", hl["foreground"])

			table.insert(label, { icon .. " " .. n .. " ", guifg = fg })
		end
	end

	return label
end

return {
	"b0o/incline.nvim",

	event = "VeryLazy",

	dependencis = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local incline = require("incline")

		local icons = require("nvim-web-devicons")

		incline.setup({
			debounce_threshold = { falling = 500, rising = 250 },

			---@class InclineRenderProps
			---@field buf number
			---@field win number
			---@field focused boolean
			---

			---@param props InclineRenderProps
			---
			render = function(props)
				local trim = require("jmsrsd.utils.string").trim

				if not props.focused then
					return ""
				end

				--- @type any
				---
				local search_count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })

				local search_contents = trim(vim.fn.getreg("/") .. "")

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
					{
						("  %s  "):format(trim((" %s"):format(search_contents))),
						group = "IncSearch",
					},
					{ " " },
					{
						(" %d/%d "):format(search_count.current, search_count.total),
						group = "dkoStatusValue",
					},
				}

				if #diagnostics > 0 then
					table.insert(diagnostics, { "| ", guifg = "grey" })
				end

				for _, value in ipairs(display) do
					table.insert(diagnostics, value)
				end

				return diagnostics
			end,

			window = {
				margin = { horizontal = 0 },
				padding = 0,
			},
		})
	end,
}
