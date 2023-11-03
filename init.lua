local import = function(module)
	return require("configs." .. module)
end

vim.tbl_map(import, {
	"options",
	"keymaps",
	"plugins",
})
