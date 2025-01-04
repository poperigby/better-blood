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
        print("Cannot find blood type of actor: ", self.object.recordId)
        return nil
    end

    -- Find highest priority match
    local best_match = matches[1]
    for match in ipairs(matches) do
        if matches[match].priority > best_match.priority then
            best_match = matches[match]
        end
    end

    return best_match.parent
end

local function onInit()
    bloodType = findBloodType()
    if bloodType ~= nil then
        print("Found", bloodType, "blood type for actor", self.object.recordId)
    end
end

local function onUpdate()
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
