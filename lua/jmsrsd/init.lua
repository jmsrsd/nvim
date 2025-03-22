local ctx = function() end

local Context = require("jmsrsd.common.context")

local context = Context({ ctx = ctx })

local Installer = context.import("./installer")

--- @type Installer
local installer = Installer(context)

return installer.install()
