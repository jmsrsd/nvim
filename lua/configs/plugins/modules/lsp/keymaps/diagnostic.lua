local M = {}

M.setup = function()
	local telescope = require("telescope.builtin")

	local diagnostics = function()
		return telescope.diagnostics({
			bufnr = nil,
			severity_limit = vim.diagnostic.severity.WARN,
			sort_by = "severity",
		})
	end

	--- @param desc string
	---
	local describe = function(desc)
		--- @type { noremap: boolean, silent: boolean, desc: string }
		---
		return {
			noremap = true,
			silent = true,
			desc = desc,
		}
	end

	--- Global mappings.
	---
	--- See `:help vim.diagnostic.*` for documentation on any of the
	---
	--- below functions
	---

	vim.keymap.set("n", "[d", vim.diagnostic.open_float, describe("Show diagnostics in a floating window."))

	vim.keymap.set("n", "]d", diagnostics, describe("Lists diagnostics"))

	vim.keymap.set(
		"n",
		"[g",
		vim.diagnostic.goto_prev,
		describe("Move to the previous diagnostic in the current buffer.")
	)

	vim.keymap.set("n", "]g", vim.diagnostic.goto_next, describe("Move to the next diagnostic."))
end

return M
