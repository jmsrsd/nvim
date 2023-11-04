local sources = {
	--- LSP
	---
	"nvim_lsp",
	"nvim_lsp_signature_help",

	--- Lua
	---
	"nvim_lua",
	"luasnip",

	--- Treesitter
	---
	"treesitter",

	--- Emmet
	---
	"emmet_vim",

	--- Git
	---
	"git",

	--- Ripgrep
	---
	"rg",

	--- Path sources
	---
	"fuzzy_path",
	"path",

	--- Buffer sources
	---
	"fuzzy_buffer",
	"buffer",
}

local result = {}

for index, name in ipairs(sources) do
	table.insert(result, {
		["name"] = name,
		["priority"] = #sources - index + 1,
	})
end

return result
