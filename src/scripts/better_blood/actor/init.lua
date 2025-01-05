local self = require("openmw.self")
local types = require("openmw.types")
local aux_util = require("openmw_aux.util")
local loadConfig = require("scripts.better_blood.actor.config")

local bloodType

local health = types.Actor.stats.dynamic.health(self)
local oldHealth = health.current

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

local function onInit()
    bloodType = findBloodType()
    print(self.object.recordId, ":", bloodType)
end

local function onUpdate()
    -- TODO: Do a bigger blood splatter for hit that deals >50% of an actor's max health
    -- TODO: Allow post-mortem blood splatters
    local newHealth = health.current

    local damage = oldHealth - newHealth

    oldHealth = newHealth

    if damage > 0 then
        print(damage)
        print(bloodType)
    end
end

return {
    engineHandlers = {
        onLoad = onInit,
        onInit = onInit,
        onUpdate = onUpdate,
    }
}
