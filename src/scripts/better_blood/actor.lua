local self = require("openmw.self")
local types = require("openmw.types")

local healthObj = types.Actor.stats.dynamic.health(self)
local base_health = healthObj.base
local old_health = healthObj.current

local function onUpdate(_delta)
    local new_health = healthObj.current

    local damage = old_health - new_health

    old_health = new_health

    if damage > 0 then
        print(damage)
    end
end

return {
    engineHandlers = {
        onUpdate = onUpdate,
    }
}
