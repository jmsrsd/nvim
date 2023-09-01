local M = {}

--- Map Modes
---
--- n = Normal
--- v = Visual and Select
--- s = Select
--- x = Visual
--- o = Operator-pending
--- i = Insert
--- l = Insert, Command-line, Lang-Arg
--- c = Command-line
--- t = Terminal
---
M.all_modes = { "n", "v", "s", "x", "o", "i", "l", "c", "t" }

--- Bind a key mapping
---
--- @param params { mode: string|table, lhs: string, rhs: string|function, opts: table|nil }
---
M.bind = function(params)
	vim.keymap.set(params.mode, params.lhs, params.rhs, params.opts)
end

M.save = function()
	pcall(vim.cmd.w)
	pcall(vim.cmd.wa)
end

return M
