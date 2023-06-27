package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/after/plugin/?.lua'

require('jmsrsd.core')
