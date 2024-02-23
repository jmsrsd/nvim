local import = function(name)
	name = "jmsrsd.configs.plugins." .. name

	local module = require(name)
	local result = module()

	return result
end

return vim.tbl_map(import, {
	"install",
	"setup",
})
