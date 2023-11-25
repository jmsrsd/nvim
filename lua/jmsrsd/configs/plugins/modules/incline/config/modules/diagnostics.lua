--- @diagnostic disable: undefined-field
---

--- @class InclineDiagnosticsModule
--- @field get_filename function
--- @field render fun(props: InclineRenderProps): table
--- @field view fun(props: InclineRenderProps): table
--- @field view_icons table
---
local M = {}

M.view_icons = {
	Error = "",
	Warn = "",
	Info = "",
	Hint = "󰌵",
}

--- @param props InclineRenderProps
---
M.view = function(props)
	local label = {}

	for severity, icon in pairs(M.view_icons) do
		local n = #vim.diagnostic.get(props.buf, {
			severity = vim.diagnostic.severity[string.upper(severity)],
		})

		if n > 0 then
			local hl = vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)

			local fg = "#" .. string.format("%06x", hl["foreground"])

			table.insert(label, { icon .. " " .. n .. " ", guifg = fg })
		end
	end

	return label
end

M.get_filename = function(bufname)
	local string = require("jmsrsd.utils.string")

	local ok, result = pcall(function()
		local filename = vim.fn.fnamemodify(bufname, ":t")

		local filename_split = string.split(filename, ".")

		filename = filename_split[1]

		for i = 2, #filename_split - 1, 1 do
			filename = filename .. "." .. filename_split[i]
		end

		if #filename > 20 then
			filename = filename:sub(1, 19) .. "…"
		end

		local extension = filename_split[#filename_split]

		return filename .. "." .. extension
	end)

	return ok and result or ""
end

M.render = function(props)
	local icons = require("nvim-web-devicons")

	local bufname = vim.api.nvim_buf_get_name(props.buf)

	local filename = M.get_filename(bufname)

	local view = M.view(props)

	local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"

	local icon, color = icons.get_icon_color(filename)

	local default_view = {
		{ icon, guifg = color },
		{ " " },
		{ filename, gui = modified },
		{ "  " },
	}

	if #view > 0 then
		table.insert(view, { " |  ", guifg = "grey" })
	end

	for _, buf in ipairs(default_view) do
		table.insert(view, buf)
	end

	return view
end

return M
