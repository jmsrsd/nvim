local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. ".configs." .. module
	end, function() end)
end

vim.tbl_map(import, {
	"options",
	"keymaps",
	"plugins",
})
