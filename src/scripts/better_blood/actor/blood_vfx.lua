local types = require("openmw.types")
local self = require("openmw.self")
local core = require("openmw.core")
local storage = require("openmw.storage")

local isPlayer = self.type == types.Player


local settings = storage.globalSection('SettingsOMWCombat')
local spawnBloodEffectsOnPlayer = settings:get('spawnBloodEffectsOnPlayer')

local function spawnBloodVfx(position, minihit)
    if isPlayer and not settings:get('spawnBloodEffectsOnPlayer') then
        return
    end

    local scale = 1.0
    if minihit then scale = 0.5 end

    local modelInd = math.random(0, 2)

    -- 2 is a big ugly blood explosion, 0 and 1 are ok
    local bloodEffectModel = string.format('Blood_Model_%d', modelInd) -- randIntUniformClosed(0, 2)
    -- math.random(0, 2)


    -- TODO: implement a Misc::correctMeshPath equivalent instead?
    -- All it ever does it append 'meshes\\' though
    bloodEffectModel = 'meshes/' .. core.getGMST(bloodEffectModel)

    local record = self.object.type.record(self.object)
    local bloodTexture = string.format('Blood_Texture_%d', record.bloodType)
    bloodTexture = core.getGMST(bloodTexture)
    if not bloodTexture or bloodTexture == '' then
        bloodTexture = core.getGMST('Blood_Texture_0')
    end

    core.sendGlobalEvent('SpawnVfx', {
        model = bloodEffectModel,
        position = position,
        options = {
            mwMagicVfx = false,
            particleTextureOverride = bloodTexture,
            useAmbientLight = false,
            scale = scale
        },
    })
end

return spawnBloodVfx
