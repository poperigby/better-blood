local markup = require("openmw.markup")
local vfs = require("openmw.vfs")

local actorSchema = {
    name = {
        required = true,
        type = "string",
    },
    pattern = {
        required = true,
        type = "string",
    },
    is_creature = {
        required = false,
        type = "boolean",
        default = true,
    },
    priority = {
        required = false,
        type = "number",
        validate = function(value)
            -- Ensure the priority is an integer within the range 0-1000
            local isValid = math.floor(value) == value and value >= 0 and value <= 1000
            if isValid ~= true then
                print("'priority' must be between 0 and 1000")
            end
            return isValid
        end,
        default = 900,
    },
}

local function validateEntry(entry)
    for key, rules in pairs(actorSchema) do
        local value = entry[key]

        -- Check for required keys
        if rules.required and value == nil then
            return false, string.format("Missing required key: '%s'", key)
        end

        -- If the key exists, validate its type
        if value ~= nil then
            if type(value) ~= rules.type then
                return false, string.format(
                    "Key '%s' should be of type '%s', got '%s'",
                    key, rules.type, type(value)
                )
            end

            -- Validate custom constraints (if provided)
            if rules.validate and not rules.validate(value) then
                return false, string.format("Key '%s' failed validation", key)
            end
        end
    end

    return true
end

local function mergeTables(target, source)
    local function setDefaults(entry)
        entry.is_creature = entry.is_creature == nil and true or entry.is_creature
        entry.priority = entry.priority or 500
    end

    for bloodType, entries in pairs(source) do
        -- Ensure the target has the blood type
        if not target[bloodType] then
            target[bloodType] = {}
        end

        -- Merge entries from the source
        for _, entry in ipairs(entries) do
            local isValid, errorMessage = validateEntry(entry)
            if isValid then
                setDefaults(entry)
                table.insert(target[bloodType], entry)
            else
                print("Validation Error:", errorMessage)
            end
        end
    end
end

local function loadConfig()
    local bloodTypes = {}

    -- Parse YAML definition files into Lua tables, and deep merge the tables,
    for configFile in vfs.pathsWithPrefix("scripts/better_blood/blood_types") do
        local config = markup.loadYaml(configFile)
        mergeTables(bloodTypes, config)
    end

    return bloodTypes
end

return loadConfig
