local markup = require("openmw.markup")
local vfs = require("openmw.vfs")

local function mergeTables(target, source)
    -- A helper function to ensure default values
    local function setDefaults(entry)
        entry.is_creature = entry.is_creature == nil and true or entry.is_creature
        entry.priority = entry.priority or 1000
    end

    -- Iterate through each category in the source table
    for category, entries in pairs(source) do
        -- Ensure the target has the category
        if not target[category] then
            target[category] = {}
        end

        -- Track seen entries for deduplication
        local seenEntries = {}
        for _, entry in ipairs(target[category]) do
            seenEntries[entry.name .. "|" .. entry.pattern] = true
        end

        -- Merge entries from the source
        for _, entry in ipairs(entries) do
            local key = entry.name .. "|" .. entry.pattern
            if not seenEntries[key] then
                setDefaults(entry)
                table.insert(target[category], entry)
                seenEntries[key] = true
            end
        end
    end
end

local function loadConfig()
    local bloodTypes = {}

    -- Parse YAML definition files into Lua tables, and deep merge the tables,
    -- eliminating duplicate definitions and setting default values.
    for configFile in vfs.pathsWithPrefix("scripts/better_blood/blood_types") do
        local config = markup.loadYaml(configFile)
        mergeTables(bloodTypes, config)
    end

    return bloodTypes
end

return loadConfig
