local self = require("openmw.self")
local types = require("openmw.types")
local aux_util = require("openmw_aux.util")
local load_config = require("scripts.better_blood.actor.config")

local health = types.Actor.stats.dynamic.health(self)
local old_health = health.current

local blood_types = {}

local function on_init()
    blood_types = load_config()
    print(aux_util.deepToString(blood_types))
end

local function on_update(_delta)
    local new_health = health.current

    local damage = old_health - new_health

    old_health = new_health

    if damage > 0 then
        print(damage)
    end
end

return {
    engineHandlers = {
        onLoad = on_init,
        onInit = on_init,
        onUpdate = on_update,
    }
}
