local core = require("openmw.core")
local I = require("openmw.interfaces")

local findBloodType = require("scripts.better_blood.actor.blood_type")

local bloodType

local function onInit()
    bloodType = findBloodType()
end

I.Combat.addOnHitHandler(function(attack)
    local position = attack.hitPos

    core.sendGlobalEvent("SpawnBlood", { position = position, bloodType = bloodType })
end)

return {
    engineHandlers = {
        onInit = onInit,
    },
}
