local priority = require("jmsrsd.utils.priority")

local sources = {
	--- LSP
	---
	"nvim_lsp",
	"nvim_lsp_signature_help",

	--- Lua
	---
	"nvim_lua",
	"luasnip",

	--- Emmet
	---
	"emmet_vim",

	--- Git
	---
	--- "git",

	--- Ripgrep
	---
	--- "rg",

	--- Path sources
	---
	"path",

	--- Treesitter
	---
	"treesitter",

	--- Buffer sources
	---
	"buffer",
}

local result = {}

for index, name in ipairs(sources) do
	local source = {
		["name"] = name,
		["priority"] = priority.order(index),
		--- UNUSED: ["group_index"] = index,
	}

	if name == "emmet_vim" then
		source.option = {
			filetypes = {
				"astro",
				"css",
				"heex",
				"html",
				"javascript",
				"javascript.jsx",
				"javascriptreact",
				"jsx",
				"less",
				"sass",
				"scss",
				"tsx",
				"typescript",
				"typescript.tsx",
				"typescriptreact",
				"xml",
			},
		}
	end

	table.insert(result, source)
end

return result
