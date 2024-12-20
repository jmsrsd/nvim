--- @alias PluginConfig LazyConfig

local helper = {
	array = require("jmsrsd.helper.array"),
}

--- @param props PluginProps
--- @return PluginConfig
return function(props)
	--- @type PluginConfig
	local self = {}

	self.ui = {
		border = "rounded",
	}

	self.change_detection = {
		notify = false,
	}

	self.spec = helper.array.entries(props.specs, function(index, name)
		local plugin = props.import("./specs/" .. name)

		plugin.priority = 1000 - index

		return plugin
	end)

	return self
end
