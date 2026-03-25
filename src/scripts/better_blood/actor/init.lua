local core = require("openmw.core")
local self = require("openmw.self")
local I = require("openmw.interfaces")

local findBloodType = require("scripts.better_blood.actor.blood_type")

local bloodType

local function onInit()
    bloodType = findBloodType()
    print(self.object.recordId, ":", bloodType)
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
