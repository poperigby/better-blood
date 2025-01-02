local self = require("openmw.self")
local types = require("openmw.types")

local function onUpdate(_delta)
    types.DynamicStats.health(self.object)
end

return {
    engineHandlers = {
        onUpdate = onUpdate,
    }
}
