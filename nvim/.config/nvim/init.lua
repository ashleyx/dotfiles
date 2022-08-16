-------- Imports
require('utils') -- ./lua/utils.lua
require('plugins') -- ./lua/plugins.lua
require('theme') -- ./lua/plugins.lua
require('config') -- ./lua/config.lua
require('keybinds') -- ./lua/keybinds.lua

---- RUNNING POST SETUP CONFIGS

local post_configs = require 'plug_config.post' -- source of custom_configs for plugins

for key,val in pairs(post_configs) do 
	val()
end

