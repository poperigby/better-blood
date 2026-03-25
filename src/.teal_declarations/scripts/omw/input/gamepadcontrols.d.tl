--[[
  Gamepad control interface
  require('openmw.interfaces').GamepadControls
]]

local record GamepadControls
  --[[
    Checks if the controller menu option is enabled.
    If true, UI is replaced with a more controller appropriate interface.
  ]]
  isControllerMenusEnabled: function(): boolean
  
  --[[
    Checks if the gamepad cursor is active.
    If it is active, the left stick can move the cursor, and A will be interpreted as a mouse click.
  ]]
  isGamepadCursorActive: function(): boolean
  
  --[[
    Sets if the gamepad cursor is active.
    If it is active, the left stick can move the cursor, and A will be interpreted as a mouse click.
  ]]
  setGamepadCursorActive: function(
    value: boolean
  )
  
  --[[
    Interface version
  ]]
  version: number
  
end
return GamepadControls