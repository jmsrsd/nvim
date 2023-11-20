--- @diagnostic disable: unused-local
---

local keymap = require("jmsrsd.utils.keymap")

local catch = require("jmsrsd.utils.catch")

local M = {}

M.on_attach = function(client, bufnr)
	--- Buffer local mappings.
	---
	--- See `:help vim.lsp.*` for documentation on any of the
	---
	--- below functions
	---

	local set = vim.keymap.set

	local lsp = vim.lsp.buf

	local describe = function(desc)
		return keymap.describeBuffer(bufnr, desc)
	end

	set("n", "gD", catch(lsp.declaration), describe("Jumps to the declaration of the symbol under the cursor."))

	set("n", "gd", catch(lsp.definition), describe("Jumps to the definition of the symbol under the cursor."))

	set(
		"n",
		"gt",
		catch(lsp.type_definition),
		describe("Jumps to the definition of the type of the symbol under the cursor.")
	)

	set(
		"n",
		"gi",
		catch(lsp.implementation),
		describe("Lists all the implementations for the symbol under the cursor in the quickfix window.")
	)

	set(
		"n",
		"gr",
		catch(lsp.references),
		describe("Lists all the references to the symbol under the cursor in the quickfix window.")
	)

	set(
		"n",
		"K",
		catch(lsp.hover),
		describe(
			"Displays hover information about the symbol under the "
				.. "cursor in a floating window. Calling the "
				.. "function twice will jump into the floating window."
		)
	)

	set(
		"n",
		"<leader>k",
		catch(lsp.signature_help),
		describe("Displays signature information about the symbol under the cursor in a floating window.")
	)

	set(
		{ "n", "v" },
		"<leader>a",
		catch(lsp.code_action),
		describe("Selects a code action available at the current cursor position.")
	)

	set("n", "<leader>r", catch(lsp.rename), describe("Renames all references to the symbol under the cursor."))
end

M.setup = function()
	--- Use LspAttach autocommand to only map the following keys
	---
	--- after the language server attaches to the current buffer
	---
	vim.api.nvim_create_autocmd("LspAttach", {

		group = vim.api.nvim_create_augroup("UserLspConfig", {}),

		callback = function(ev)
			--- Enable completion triggered by <c-x><c-o>
			---
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			M.on_attach(nil, ev.buf)
		end,
	})
end

return M
