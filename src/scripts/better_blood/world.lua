local core = require("openmw.core")
local world = require("openmw.world")
local types = require("openmw.types")

local function spawnBlood(data)
    local position = data.position
    local effect = core.magic.effects.records[core.magic.EFFECT_TYPE.Sanctuary]
    local model = types.Static.records[effect.castStatic].model

    world.vfx.spawn(model, position, {})
end

return {
    eventHandlers = { SpawnBlood = spawnBlood }
}
