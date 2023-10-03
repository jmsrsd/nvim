local M = {}

M.formatters_by_ft = {
	["dart"] = { "dart_format" },
	["lua"] = { "stylua" },
	["astro"] = { "prettierd" },
	["css"] = { "prettierd" },
	["html"] = { "prettierd" },
	["javascript"] = { "prettierd" },
	["javascript.jsx"] = { "prettierd" },
	["javascriptreact"] = { "prettierd" },
	["svelte"] = { "prettierd" },
	["typescript"] = { "prettierd" },
	["typescript.tsx"] = { "prettierd" },
	["typescriptreact"] = { "prettierd" },
	["vue"] = { "prettierd" },
}

M.ft = {}

for key, _ in pairs(M.formatters_by_ft) do
	table.insert(M.ft, key)
end

return M
