local markup = require("openmw.markup")
local vfs = require("openmw.vfs")
local aux_util = require('openmw_aux.util')

local blood_types = {}

local function deep_merge(target, source)
    for k, v in pairs(source) do
        if type(v) == "table" and type(target[k]) == "table" then
            deep_merge(target[k], v)
        else
            target[k] = v
        end
    end
end

local function onInit()
    -- Parse YAML definition files into Lua tables, and deep merge the tables
    for config_file in vfs.pathsWithPrefix("scripts/better_blood/blood_types") do
        local config = markup.loadYaml(config_file)
        deep_merge(blood_types, config)
    end

    print(aux_util.deepToString(blood_types, 3))
end

return {
    engineHandlers = {
        onLoad = onInit,
        onInit = onInit,
    }
}
