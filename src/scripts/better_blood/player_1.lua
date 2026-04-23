local interfaces = require('openmw.interfaces')
local camera     = require('openmw.camera')
local core       = require('openmw.core')
local input      = require('openmw.input')
local nearby     = require('openmw.nearby')
local omwself = require('openmw.self')
local util       = require('openmw.util')

local ComboTracker      = require('scripts.MaxYari.ActiveAbilityFramework.comboTracker')
local SkillStateMachine = require('scripts.MaxYari.ActiveAbilityFramework.skillStateMachine')
local rapierLunge       = require('scripts.MaxYari.ActiveAbilityFramework.skills.rapierLunge')
local quickThrow        = require('scripts.MaxYari.ActiveAbilityFramework.skills.quickThrow')

local BLOOD_SPLATTER_NIF = 'meshes/blood_splatter/blood_splatter.nif'
local RAY_DISTANCE       = 10000

local time = 0
local lastSplatterTime = 0
local function spawnBloodSplatterAtCrosshair()
    if time - lastSplatterTime <= 0.1 then return end
    lastSplatterTime = time

    local from = camera.getPosition()
    local dir  = camera.viewportToWorldVector(util.vector2(0.5, 0.5))
    local hit  = nearby.castRay(from, from + dir * RAY_DISTANCE, { collisionType = nearby.COLLISION_TYPE.Default })
    if not hit.hit then return end
    
    core.sound.playSoundFile3d('Sounds/Blood Stuff/blood_gash.wav', omwself)
    
    core.sendGlobalEvent('SpawnVfx', {
        model    = BLOOD_SPLATTER_NIF,
        position = hit.hitPos,
        options  = { mwMagicVfx = false, useAmbientLight = false, scale = 8 },
    })
    print("spawning vfx")
end

local rapierLungeSM = SkillStateMachine.new(rapierLunge)
local quickThrowSM  = SkillStateMachine.new(quickThrow)

local allMachines = { rapierLungeSM, quickThrowSM }

-- One ComboTracker per machine, in matching order.
local allTrackers = {}
for _, machine in ipairs(allMachines) do
    allTrackers[#allTrackers + 1] = ComboTracker.new(machine._skillDef)
end

-- Register text key handler in the script body — runs on every load.
interfaces.AnimationController.addTextKeyHandler("", function(groupname, key)
    print(key)
    for _, machine in ipairs(allMachines) do
        machine:handleTextKey(groupname, key)
    end
    if key:find(' hit') then
        spawnBloodSplatterAtCrosshair()
    end
end)


local function anyMachineRunning()
    for _, machine in ipairs(allMachines) do
        if machine:isRunning() then return true end
    end
    return false
end


return {
    interfaceName = 'ActiveAbilityFramework',
    interface     = {},
    eventHandlers = {},
    engineHandlers = {
        onKeyPress = function(key)
            if key.code == input.KEY.H then
                spawnBloodSplatterAtCrosshair()
            end
        end,

        onKeyRelease = function(key)
            if anyMachineRunning() then return end
            for i, tracker in ipairs(allTrackers) do
                if tracker:onKeyRelease(key.code) then
                    allMachines[i]:start()
                    return
                end
            end
        end,

        onUpdate = function(dt)
            time = time + dt

            for _, machine in ipairs(allMachines) do
                machine:update(dt)
            end
            -- Only trigger a new skill if none is running.
            if anyMachineRunning() then return end
            for i = 1, #allTrackers do
                if allTrackers[i]:update(dt) then
                    allMachines[i]:start()
                    return
                end
            end
        end,

        onSave = function()
            local skills = {}
            for _, machine in ipairs(allMachines) do
                local data = machine:save()
                if data then skills[data.id] = data end
            end
            return { skills = skills }
        end,

        onLoad = function(data)
            if not data or not data.skills then return end
            for _, machine in ipairs(allMachines) do
                machine:load(data.skills[machine._skillDef.id])
            end
        end,
    },
}
