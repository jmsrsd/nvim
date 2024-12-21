local this = function() end

local Context = require("jmsrsd.common.context")

local context = Context({ target = this })

local setup = {

	Plugin = context.import("./setup/plugin"),

	Props = context.import("./setup/props"),

	Config = context.import("./setup/config"),
}

--- @type Plugin
local plugin = setup.Plugin()

--- @type PluginProps
local props = setup.Props(context)

--- @type PluginConfig
local config = setup.Config(props)

plugin.setup(config)
