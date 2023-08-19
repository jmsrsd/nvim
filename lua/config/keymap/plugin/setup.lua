return function(plugins)
  for _, plugin in ipairs(plugins) do
    require('plugin.lib.' .. plugin .. '.keymap')
  end
end
