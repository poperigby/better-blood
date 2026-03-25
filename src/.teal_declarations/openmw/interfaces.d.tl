--[[
  local I = require('openmw.interfaces')
]]

local type scripts_omw_activationhandlers = require("scripts.omw.activationhandlers")
local type scripts_omw_ai = require("scripts.omw.ai")
local type scripts_omw_camera_camera = require("scripts.omw.camera.camera")
local type scripts_omw_combat_interface = require("scripts.omw.combat.interface")
local type scripts_omw_crimes = require("scripts.omw.crimes")
local type scripts_omw_mechanics_animationcontroller = require("scripts.omw.mechanics.animationcontroller")
local type scripts_omw_mwui_init = require("scripts.omw.mwui.init")
local type scripts_omw_settings_player = require("scripts.omw.settings.player")
local type scripts_omw_skillhandlers = require("scripts.omw.skillhandlers")
local type scripts_omw_ui = require("scripts.omw.ui")
local type scripts_omw_usehandlers = require("scripts.omw.usehandlers")
local record interfaces
  AI: scripts_omw_ai
  
  Activation: scripts_omw_activationhandlers
  
  AnimationController: scripts_omw_mechanics_animationcontroller
  
  Camera: scripts_omw_camera_camera
  
  Combat: scripts_omw_combat_interface
  
  Crimes: scripts_omw_crimes
  
  ItemUsage: scripts_omw_usehandlers
  
  MWUI: scripts_omw_mwui_init
  
  Settings: scripts_omw_settings_player
  
  SkillProgression: scripts_omw_skillhandlers
  
  UI: scripts_omw_ui
  
  metamethod __index: function(
    self: interfaces,
    key: string
  ): any
  
end
return interfaces