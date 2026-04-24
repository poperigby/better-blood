local camera = require("openmw.camera")
local nearby = require("openmw.nearby")
local self = require("openmw.self")
local util = require("openmw.util")
local async = require("openmw.async")


local CenterVector = util.vector2(0.5, 0.5)


local function onGetHitPos(e)
    -- Get camera direction and position
    local lookDir = camera.viewportToWorldVector(CenterVector)
    local camPos = camera.getPosition()
    local activationDist = camera.getThirdPersonDistance() + 120

    local rayStart = camPos
    lookDir = lookDir:normalize()
    local rayEnd = camPos + lookDir * activationDist

    -- Cast regular ray first to check for collision with sender
    local regularRayResult = nearby.castRay(rayStart, rayEnd,
        { ignore = self, collisionType = nearby.COLLISION_TYPE.Actor })

    local rayResult = {}
    local isOnSurface = false
    if regularRayResult.hitObject == e.sender then
        rayResult = regularRayResult
        isOnSurface = false
    end

    -- Cast rendering ray from determined origin to target position
    local renderingRayCallback = async:callback(function(renderingResult)
        if renderingResult.hitObject == e.sender then
            rayResult = renderingResult
            isOnSurface = true
        end

        e.sender:sendEvent("BetterBlood_ReportHitPos", {
            sender = self,
            hitObject = rayResult.hitObject,
            hitPos = rayResult.hitPos,
            hitNormal = rayResult.hitNormal,
            isOnSurface = isOnSurface,
        })
    end)

    nearby.asyncCastRenderingRay(renderingRayCallback, rayStart, rayEnd,
        { ignore = self, collisionType = nearby.COLLISION_TYPE.Actor })
end

return {
    eventHandlers = {
        BetterBlood_GetHitPos = onGetHitPos
    }
}
