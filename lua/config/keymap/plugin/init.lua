local config = require 'config.keymap.plugin.config'

for _, plugin in ipairs(config) do
  require('plugin.lib.' .. plugin .. '.keymap')
end
