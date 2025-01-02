local self = require("openmw.self")
local types = require("openmw.types")

local base_health = types.Actor.stats.dynamic.health(self).base
local old_health = types.Actor.stats.dynamic.health(self).current

local function onUpdate(_delta)
    local new_health = types.Actor.stats.dynamic.health(self).current

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
