local this = function() end

local Context = require("jmsrsd.commons.context")

local context = Context({ target = this })

local Installer = context.import("./installer")

--- @type Installer
local installer = Installer(context)

return installer.install()
