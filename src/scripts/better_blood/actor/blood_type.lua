local types = require("openmw.types")
local self = require("openmw.self")
local loadConfig = require("scripts.better_blood.actor.config")

local function findBloodType()
    local bloodTypes = loadConfig()
    local recordId = self.object.recordId
    local isCreature = types.Creature.objectIsInstance(self.object)

    local matches = {}

    for parent, entries in pairs(bloodTypes) do
        for _, entry in ipairs(entries) do
            if recordId:match(entry.pattern) and isCreature == entry.is_creature then
                entry.parent = parent
                table.insert(matches, entry)
            end
        end
    end

    if next(matches) == nil then
        return nil
    end

    -- Find highest priority match
    local highestPriorityMatch = matches[1]
    for _, match in ipairs(matches) do
        -- A lower priority number means a higher priority
        if match.priority < highestPriorityMatch.priority then
            highestPriorityMatch = match
        end
    end

    -- The parent is the blood type
    return highestPriorityMatch.parent
end

return findBloodType
