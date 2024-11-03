local this = function() end

local Context = require("jmsrsd.commons.context")

local context = Context({ target = this })

local Plugin = context.import("./internals/plugin")

local Props = context.import("./internals/props")

local Config = context.import("./internals/config")

--- @type Plugin
local plugin = Plugin()

--- @type PluginProps
local props = Props(context)

--- @type PluginConfig
local config = Config(props)

plugin.setup(config)
