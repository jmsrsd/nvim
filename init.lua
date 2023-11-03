local modules = {
	"options",
	"keymaps",
	"plugins",
}

local import = function(module)
	require("configs." .. module)
end

vim.tbl_map(import, modules)
