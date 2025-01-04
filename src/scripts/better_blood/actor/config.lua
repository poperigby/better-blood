local markup = require("openmw.markup")
local vfs = require("openmw.vfs")


local function deep_merge(target, source)
    for k, v in pairs(source) do
        if type(v) == "table" and type(target[k]) == "table" then
            deep_merge(target[k], v)
        else
            target[k] = v
        end
    end
end

local function load_config()
    local blood_types = {}

    -- Parse YAML definition files into Lua tables, and deep merge the tables
    for config_file in vfs.pathsWithPrefix("scripts/better_blood/blood_types") do
        local config = markup.loadYaml(config_file)
        deep_merge(blood_types, config)
    end

    return blood_types
end

return load_config
