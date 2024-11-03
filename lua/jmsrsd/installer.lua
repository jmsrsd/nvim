--- @class Installer
--- @field install fun(): any[]

--- @param context Context
--- @return Installer
return function(context)
	local modules = { "options", "keymaps", "plugins" }

	local import = function(module)
		return context.import("./configs/" .. module)
	end

	local self = {}

	self.install = function()
		return vim.tbl_map(import, modules)
	end

	return self
end
