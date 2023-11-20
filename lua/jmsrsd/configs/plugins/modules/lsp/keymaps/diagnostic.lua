local catch = require("jmsrsd.utils.catch")

local M = {}

M.setup = function()
	local describe = require("jmsrsd.utils.keymap").describe

	local diagnostic = vim.diagnostic

	local diagnostics = function()
		return require("telescope.builtin").diagnostics({
			bufnr = nil,
			severity_limit = vim.diagnostic.severity.WARN,
			sort_by = "severity",
		})
	end

	--- Global mappings.
	---
	--- See `:help vim.diagnostic.*` for documentation on any of the
	---
	--- below functions
	---

	local set = vim.keymap.set

	set("n", "[d", catch(diagnostic.open_float), describe("Show diagnostics in a floating window."))

	set("n", "]d", catch(diagnostics), describe("Lists diagnostics"))

	set("n", "[g", catch(diagnostic.goto_prev), describe("Move to the previous diagnostic in the current buffer."))

	set("n", "]g", catch(diagnostic.goto_next), describe("Move to the next diagnostic."))
end

return M
