--- @param opts table
---
return function(opts)
	local keymaps = require("keymaps.util")

	local bind = keymaps.bind

	--- @type number
	local buffer = opts.buffer

	--- @param desc string
	--- @return { buffer: number, desc: string, silent: boolean }
	local describe = function(desc)
		return {
			buffer = buffer,
			desc = desc,
			silent = true,
		}
	end

	vim.diagnostic.config({
		virtual_text = true,
		severity_sort = true,
		float = {
			border = "rounded",
			source = "always",
		},
	})

	-- bind({
	-- 	mode = { "n" },
	-- 	lhs = "gD",
	-- 	rhs = vim.lsp.buf.declaration,
	-- 	opts = describe("Go to declaration"),
	-- })

	bind({
		mode = "n",
		lhs = "gd",
		rhs = ":Lspsaga finder def<CR>",
		-- rhs = function()
		-- 	trouble.open("lsp_definitions")
		-- end,
		opts = describe("Go to definitions"),
	})

	bind({
		mode = { "n" },
		lhs = "gi",
		rhs = ":Lspsaga finder imp<CR>",
		-- rhs = function()
		-- 	trouble.open("lsp_implementations")
		-- end,
		opts = describe("Go to implementations"),
	})

	bind({
		mode = { "n" },
		lhs = "K",
		rhs = ":Lspsaga hover_doc<CR>",
		-- rhs = vim.lsp.buf.hover,
		opts = describe("Displays hover information"),
	})

	bind({
		mode = { "n" },
		lhs = "<leader>k",
		-- lhs = "gh",
		rhs = vim.lsp.buf.signature_help,
		opts = describe("Displays signature information"),
	})

	bind({
		mode = { "n" },
		lhs = "gt",
		rhs = ":Telescope lsp_type_definitions<CR>",
		-- rhs = function()
		-- 	trouble.open("lsp_type_definitions")
		-- end,
		opts = describe("Go to type definitions"),
	})

	bind({
		mode = { "n" },
		lhs = "<leader>r",
		rhs = vim.lsp.buf.rename,
		-- rhs = '"Lspsaga lsp_rename ++project<CR>',
		opts = describe("Apply rename"),
	})

	bind({
		mode = { "n", "v" },
		lhs = "<leader>a",
		-- rhs = ":Lspsaga code_action<CR>",
		rhs = vim.lsp.buf.code_action,
		opts = describe("Display code action"),
	})

	bind({
		mode = { "n" },
		lhs = "<leader>e",
		rhs = ":Lspsaga finder ref<CR>",
		-- rhs = function()
		-- 	trouble.open("lsp_references")
		-- end,
		opts = describe("Go to references"),
	})

	bind({
		mode = { "n" },
		lhs = "<leader>i",
		rhs = function()
			local conform = require("conform")

			conform.format({
				buf = vim.api.nvim_get_current_buf(),
				timeout_ms = 10000,
				async = false,
				lsp_fallback = true,
			})

			-- vim.lsp.buf.format({ async = false })
		end,
		opts = describe("Apply format"),
	})

	--- See `:help vim.diagnostic.*` for documentation on any of the below functions
	---
	bind({
		mode = { "n" },
		lhs = "[d",
		rhs = vim.diagnostic.open_float,
		-- rhs = ":Lspsaga show_line_diagnostics<CR>",
		opts = describe("Show diagnostics"),
	})

	bind({
		mode = { "n" },
		lhs = "]d",
		rhs = ":Telescope diagnostics severity_limit=WARN",
		-- rhs = ":Lspsaga show_workspace_diagnostics<CR>",
		-- rhs = function()
		-- 	trouble.open("workspace_diagnostics")
		-- end,
		opts = describe("Show workspace diagnostics"),
	})

	bind({
		mode = { "n" },
		lhs = "[g",
		rhs = ":Lspsaga diagnostic_jump_prev<CR>",
		-- rhs = vim.diagnostic.goto_prev,
		opts = describe("Go to previous diagnostic"),
	})

	bind({
		mode = { "n" },
		lhs = "]g",
		rhs = ":Lspsaga diagnostic_jump_next<CR>",
		-- rhs = vim.diagnostic.goto_next,
		opts = describe("Go to next diagnostic"),
	})
end
