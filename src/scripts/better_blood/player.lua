local camera = require("openmw.camera")
local nearby = require("openmw.nearby")
local self = require("openmw.self")
local types = require("openmw.types")
local util = require("openmw.util")

local health = types.Actor.stats.dynamic.health(self)
local oldHealth = health.current

local function onUpdate()
    if self.controls.use ~= self.ATTACK_TYPE.NoAttack then
        local rayCast = nearby.castRay(
            self.position,
            self.position + (self.rotation * util.vector3(0, 1, 0) * camera.getViewDistance())
        )

        print(rayCast)

        if rayCast.hitObject ~= nil then
            print(rayCast.hitObject)
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
    end
end

return {
    engineHandlers = {
        onUpdate = onUpdate,
    },
    eventHandlers = {
        onHit = onHit,
    }
}
