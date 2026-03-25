--[[
  Allows to work with markup languages.
  local markup = require('openmw.markup')
]]

local record markup
  --[[
    Convert YAML data to a Lua object
    local result = markup.decodeYaml('{ "x": 1 }');
    -- prints 1
    print(result["x"])
  ]]
  decodeYaml: function(
    inputData: string
  ): any
  
  --[[
    Load a YAML file from the VFS to Lua object.
    Conventions are the same as in @{#markup.decodeYaml}.
    -- file contains '{ "x": 1 }' data
    local result = markup.loadYaml('test.yaml');
    -- prints 1
    print(result["x"])
  ]]
  loadYaml: function(
    fileName: string
  ): any
  
end
return markup