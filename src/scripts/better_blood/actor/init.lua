local I = require("openmw.interfaces")
local types = require("openmw.types")
local self = require("openmw.self")

local findBloodType = require("scripts.better_blood.actor.blood_type")
local spawnBloodVfx = require("scripts.better_blood.actor.blood_vfx")
local gutils = require("scripts.better_blood.gutils")

local bloodType

local function onInit()
    bloodType = findBloodType()
    print(bloodType)
end


local function onReportHitPos(e)
    if e.hitObject then
        spawnBloodVfx(e.hitPos)
    end
    -- TO DO: Maybe introduce a fallback for when no hit position was found
end

I.Combat.addOnHitHandler(function(a)
    if not a.attacker then return end

    local stance = gutils.getDetailedStance(a.attacker)
    local isRangedAttacker = (stance == gutils.Actor.DET_STANCE.Marksman)

    if a.attacker.type == types.Player then
        -- The hitPos of melee attacks is random, so we'll have to have the attacker
        -- perform a ray cast to get the correction position of the hit.
        if not isRangedAttacker then
            -- Disable the randomly placed vanilla blood
            a.hitPos = nil

            a.attacker:sendEvent("BetterBlood_GetHitPos", { sender = self })
        else
            -- The hitPos for a ranged attack is accurate
            spawnBloodVfx(a.hitPos)
        end
    end
end)

return {
    engineHandlers = {
        onInit = onInit,
    },
    eventHandlers = {
        BetterBlood_ReportHitPos = onReportHitPos
    }
}
