--- @param opts table
---
return function(opts)
	local trouble = require("trouble")

	local keymaps = require("keymaps.util")

	local bind = keymaps.bind

	local buffer = opts.buffer

	local describe = function(desc)
		return {
			buffer = buffer,
			desc = desc,
		}
	end

	bind({
		mode = { "n" },
		lhs = "gD",
		rhs = vim.lsp.buf.declaration,
		opts = describe("Go to declaration"),
	})

	bind({
		mode = "n",
		lhs = "gd",
		rhs = function()
			trouble.open("lsp_definitions")
		end,
		opts = describe("Go to definitions"),
	})

	bind({
		mode = { "n" },
		lhs = "K",
		rhs = vim.lsp.buf.hover,
		opts = describe("Displays hover information"),
	})

	bind({
		mode = { "n" },
		lhs = "gi",
		rhs = function()
			trouble.open("lsp_implementations")
		end,
		opts = describe("Go to implementations"),
	})

	bind({
		mode = { "n" },
		lhs = "gh",
		rhs = vim.lsp.buf.signature_help,
		opts = describe("Displays signature information"),
	})

	-- bind({
	-- 	mode = { "n" },
	-- 	lhs = "<leader>wa",
	-- 	rhs = vim.lsp.buf.add_workspace_folder,
	-- 	opts = opts,
	-- })
	--
	-- bind({
	-- 	mode = { "n" },
	-- 	lhs = "<leader>wr",
	-- 	rhs = vim.lsp.buf.remove_workspace_folder,
	-- 	opts = opts,
	-- })
	--
	-- bind({
	-- 	mode = { "n" },
	-- 	lhs = "<space>wl",
	-- 	rhs = function()
	-- 		local workspace_folders = vim.lsp.buf.list_workspace_folders()
	-- 		local msg = vim.inspect(workspace_folders)
	-- 		local level = vim.log.levels.INFO
	--
	-- 		vim.notify(msg, level)
	--
	-- 		-- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- 	end,
	-- 	opts = opts,
	-- })

	bind({
		mode = { "n" },
		lhs = "gt",
		rhs = function()
			trouble.open("lsp_type_definitions")
		end,
		opts = describe("Go to type definitions"),
	})

	bind({
		mode = { "n" },
		lhs = "<leader>re",
		rhs = vim.lsp.buf.rename,
		opts = describe("Apply rename"),
	})

	bind({
		mode = { "n", "v" },
		lhs = "<leader>aa",
		rhs = vim.lsp.buf.code_action,
		opts = describe("Display code action"),
	})

	bind({
		mode = { "n" },
		lhs = "<leader>rr",
		rhs = function()
			trouble.open("lsp_references")
		end,
		opts = describe("Go to references"),
	})

	bind({
		mode = { "n" },
		lhs = "<leader>fi",
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
		opts = describe("Show diagnostics"),
	})

	bind({
		mode = { "n" },
		lhs = "]d",
		rhs = function()
			trouble.open("workspace_diagnostics")
		end,
		opts = describe("Show workspace diagnostics"),
	})

	bind({
		mode = { "n" },
		lhs = "[g",
		rhs = vim.diagnostic.goto_prev,
		opts = describe("Go to previous diagnostic"),
	})

	bind({
		mode = { "n" },
		lhs = "]g",
		rhs = vim.diagnostic.goto_next,
		opts = describe("Go to next diagnostic"),
	})
end
