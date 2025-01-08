HIT_DISTANCE = 8000

local nearby = require("openmw.nearby")
local self = require("openmw.self")
local types = require("openmw.types")
local util = require("openmw.util")
local findBloodType = require("scripts.better_blood.actor.blood_type")

local bloodType

local health = types.Actor.stats.dynamic.health(self)
local oldHealth = health.current


local function onInit()
    bloodType = findBloodType()
    print(self.object.recordId, ":", bloodType)
end

local function onUpdate()
    if self.controls.use ~= self.ATTACK_TYPE.NoAttack then
        local rayCast = nearby.castRay(self.position,
            self.position + (self.rotation * util.vector3(0, 1, 0) * HIT_DISTANCE))

        if rayCast.hitObject ~= nil then
            rayCast.hitObject:sendEvent("onHit", {})
        end
    end
end

local function onHit()
    local newHealth = health.current

    local damage = oldHealth - newHealth

    oldHealth = newHealth

    if damage > 0 then
        print(damage)
        print(bloodType)
        -- TODO: Do a bigger blood splatter for hit that deals >50% of an actor's max health
        -- TODO: Allow post-mortem blood splatters
    end
end


return {
    engineHandlers = {
        onLoad = onInit,
        onInit = onInit,
        onUpdate = onUpdate,
    },
    eventHandlers = {
        onHit = onHit,
    }
}
