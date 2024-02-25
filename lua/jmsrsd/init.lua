local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		local result = parent .. "configs." .. module

		return result
	end, function() end)
end

vim.tbl_map(import, {
	"options",
	"keymaps",
	"plugins",
})
