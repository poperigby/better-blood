--[[
  Provides an interface to the engine debug utils.
  local debug = require('openmw.debug')
]]

--[[
  Navigation mesh rendering modes
]]
global interface NAV_MESH_RENDER_MODE
  AreaType: number
  
  UpdateFrequency: number
  
end
--[[
  Rendering modes
]]
global interface RENDER_MODE
  ActorsPaths: number
  
  CollisionDebug: number
  
  NavMesh: number
  
  Pathgrid: number
  
  RecastMesh: number
  
  Scene: number
  
  Water: number
  
  Wireframe: number
  
end
local record Debug
  --[[
    Navigation mesh rendering mode values
  ]]
  NAV_MESH_RENDER_MODE: NAV_MESH_RENDER_MODE
  
  --[[
    Rendering mode values
  ]]
  RENDER_MODE: RENDER_MODE
  
  --[[
    Is AI enabled
  ]]
  isAIEnabled: function(): boolean
  
  --[[
    Is player collision enabled
  ]]
  isCollisionEnabled: function(): boolean
  
  --[[
    Is god mode enabled
  ]]
  isGodMode: function(): boolean
  
  --[[
    Is MWScripts enabled
  ]]
  isMWScriptEnabled: function(): boolean
  
  --[[
    Reloads all Lua scripts
  ]]
  reloadLua: function()
  
  --[[
    Sets navigation mesh rendering mode
  ]]
  setNavMeshRenderMode: function(
    value: NAV_MESH_RENDER_MODE
  )
  
  --[[
    Enable/disable automatic reload of modified shaders
  ]]
  setShaderHotReloadEnabled: function(
    value: boolean
  )
  
  --[[
    Toggles AI
  ]]
  toggleAI: function()
  
  --[[
    Toggles collisions
  ]]
  toggleCollision: function()
  
  --[[
    Toggles god mode
  ]]
  toggleGodMode: function()
  
  --[[
    Toggles MWScripts
  ]]
  toggleMWScript: function()
  
  --[[
    Toggles rendering mode
  ]]
  toggleRenderMode: function(
    value: RENDER_MODE
  )
  
  --[[
    To reload modified shaders
  ]]
  triggerShaderReload: function()
  
end
return Debug