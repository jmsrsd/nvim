local path = require("jmsrsd.utils.path")

local string = require("jmsrsd.utils.string")

local array = require("jmsrsd.utils.array")

local catch = require("jmsrsd.utils.catch")

local import_all = function(name)
	local result = {}

	local curdir = path.get_parent_module_path(function() end)

	local curdir_split = string.split(curdir, "/")

	local basedir = "/" .. table.concat(array.slice(curdir_split, 1, #curdir_split - 1), "/")

	local files = string.split(vim.fn.glob(basedir .. "/" .. name .. "/*"), "\n")

	local modules = vim.tbl_map(path.to_module, files)

	for _, module in pairs(modules) do
		local module_split = string.split(module, ".")

		local module_name = module_split[#module_split]

		result[module_name] = require(module)
	end

	return result
end

local create_capabilities = function()
	local result = vim.lsp.protocol.make_client_capabilities()

	local cmp_nvim_lsp_installed, cmp_nvim_lsp = pcall(function()
		return require("cmp_nvim_lsp")
	end)

	if cmp_nvim_lsp_installed then
		result = cmp_nvim_lsp.default_capabilities() or result
	end

	result.textDocument.completion.completionItem.snippetSupport = true

	return result
end

local setup_servers = function(on_attach)
	local lspconfig = require("lspconfig")

	local capabilities = create_capabilities()

	--- UNUSED: local setups = import_all("servers")

	local skipped = { "flutter" }

	local setup = path.import(function(parent)
		return parent .. "../servers"
	end, function() end)

	local servers = setup(capabilities, on_attach)

	return vim.tbl_map(function(server)
		if table.concat(skipped, ","):match(server.name) == nil then
			return lspconfig[server.name].setup(server.opts)
		end

		return nil
	end, servers)

	--- UNUSED: for server, config in pairs(setups) do
	--- UNUSED: 	local opts = config(capabilities, on_attach)

	--- UNUSED: 	if table.concat(skipped, ","):match(server) == nil then
	--- UNUSED: 		lspconfig[server].setup(opts)
	--- UNUSED: 	end
	--- UNUSED: end
end

local override_lsp_functions = function()
	local telescope = require("telescope.builtin")

	vim.lsp.buf.definition = catch(telescope.lsp_definitions)
	vim.lsp.buf.type_definition = catch(telescope.lsp_type_definitions)
	vim.lsp.buf.implementation = catch(telescope.lsp_implementations)
	vim.lsp.buf.references = catch(telescope.lsp_references)
end

local override_float_borders = function()
	local handlers = vim.lsp.handlers

	local overrides = {
		["textDocument/hover"] = handlers.hover,
		["textDocument/signatureHelp"] = handlers.signature_help,
	}

	for method, handler in pairs(overrides) do
		handlers[method] = vim.lsp.with(handler, { border = "rounded" })
	end

	--- Apply rounded border shapes
	---
	vim.diagnostic.config({
		float = {
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},
		},
	})

	require("lspconfig.ui.windows").default_options.border = "rounded"
end

return function()
	--- Configure default
	---
	--- lua_ls configs for
	---
	--- Neovim config development
	---
	local neodev = require("neodev")

	neodev.setup({})

	--- Implement mechanism of
	---
	--- configuring lua_ls through
	---
	--- JSON files
	---
	local neoconf = require("neoconf")

	neoconf.setup({})

	override_lsp_functions()

	override_float_borders()

	local keymaps = import_all("keymaps")

	setup_servers(keymaps.lsp.on_attach)

	vim.tbl_map(function(keymap)
		return keymap.setup()
	end, keymaps)
end
