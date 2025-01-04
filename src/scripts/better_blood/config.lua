local markup = require("openmw.markup")
local vfs = require("openmw.vfs")

local blood_types = {}

local function onInit()
    for config_file in vfs.pathsWithPrefix("scripts/better_blood/blood_types") do
        local config = markup.loadYaml(config_file)
        print(config["insect"][1]["pattern"])
    end
end

return {
    engineHandlers = {
        onLoad = onInit,
        onInit = onInit,
    }
}
