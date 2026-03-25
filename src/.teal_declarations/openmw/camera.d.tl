--[[
  Controls camera.
  local camera = require('openmw.camera')
]]

local type openmw_util = require("openmw.util")
--[[
  Camera mode; see @{openmw.camera#MODE} for possible values
]]
global interface Mode
end
global interface MODE
  --[[
    First person mode.
  ]]
  FirstPerson: Mode
  
  --[[
    Third person mode, but player character doesn't turn to the view direction.
  ]]
  Preview: Mode
  
  --[[
    Camera doesn't track player; player inputs doesn't affect camera; use `setStaticPosition` to move the camera.
  ]]
  Static: Mode
  
  --[[
    Third person mode; player character turns to the view direction.
  ]]
  ThirdPerson: Mode
  
  --[[
    Similar to Preview; camera slowly moves around the player.
  ]]
  Vanity: Mode
  
end
local record camera
  --[[
    Camera modes.
  ]]
  MODE: MODE
  
  --[[
    If set to true then after switching from Preview to ThirdPerson the player character turns to the camera view direction.
    Otherwise, the camera turns to the character view direction.
  ]]
  allowCharacterDeferredRotation: function(
    boolValue: boolean
  )
  
  --[[
    Return the base field of view vertical angle in radians
  ]]
  getBaseFieldOfView: function(): number
  
  --[[
    Return the base view distance.
  ]]
  getBaseViewDistance: function(): number
  
  --[[
    Get the current camera collision type (see @{openmw.nearby#COLLISION_TYPE}).
  ]]
  getCollisionType: function(): number
  
  --[[
    Additional summand for the pitch angle that is not affected by player input.
    Full pitch is `getPitch()+getExtraPitch()`.
  ]]
  getExtraPitch: function(): number
  
  --[[
    Additional summand for the roll angle that is not affected by player input.
    Full yaw is `getRoll()+getExtraRoll()`.
  ]]
  getExtraRoll: function(): number
  
  --[[
    Additional summand for the yaw angle that is not affected by player input.
    Full yaw is `getYaw()+getExtraYaw()`.
  ]]
  getExtraYaw: function(): number
  
  --[[
    Return the current field of view vertical angle in radians
  ]]
  getFieldOfView: function(): number
  
  --[[
    The offset between the characters head and the camera in first person mode (3d vector).
  ]]
  getFirstPersonOffset: function(): openmw_util.Vector3
  
  --[[
    Preferred offset between the tracked position (see `getTrackedPosition`) and the camera focal point (the center of the screen) in third person mode.
    See `setFocalPreferredOffset`.
  ]]
  getFocalPreferredOffset: function(): openmw_util.Vector2
  
  --[[
    The current speed coefficient of focal point (the center of the screen in third person mode) smooth transition.
  ]]
  getFocalTransitionSpeed: function(): number
  
  --[[
    Return the current @{openmw.camera#MODE}.
  ]]
  getMode: function(): Mode
  
  --[[
    Camera pitch angle (radians) without taking extraPitch into account.
    Full pitch is `getPitch()+getExtraPitch()`.
  ]]
  getPitch: function(): number
  
  --[[
    Current position of the camera.
  ]]
  getPosition: function(): openmw_util.Vector3
  
  --[[
    Return the mode the camera will switch to after the end of the current animation.
    Can be nil.
  ]]
  getQueuedMode: function(): Mode
  
  --[[
    Get the camera roll angle (radians).
  ]]
  getRoll: function(): number
  
  --[[
    The actual distance between the camera and the character in third person mode; can differ from the preferred one if there is an obstacle.
  ]]
  getThirdPersonDistance: function(): number
  
  --[[
    Current position of the tracked object (the characters head if there is no animation).
  ]]
  getTrackedPosition: function(): openmw_util.Vector3
  
  --[[
    Return the current view distance.
  ]]
  getViewDistance: function(): number
  
  --[[
    Get the world to local transform for the camera.
  ]]
  getViewTransform: function(): openmw_util.Transform
  
  --[[
    Camera yaw angle (radians) without taking extraYaw into account.
    Full yaw is `getYaw()+getExtraYaw()`.
  ]]
  getYaw: function(): number
  
  --[[
    Make instant the current transition of camera focal point and the current deferred rotation (see `allowCharacterDeferredRotation`).
  ]]
  instantTransition: function()
  
  --[[
    Set the camera collision type (see @{openmw.nearby#COLLISION_TYPE}).
  ]]
  setCollisionType: function(
    collisionType: number
  )
  
  --[[
    Additional summand for the pitch angle; useful for camera shaking effects.
    Setting extra pitch doesn't block player input.
    Full pitch is `getPitch()+getExtraPitch()`.
  ]]
  setExtraPitch: function(
    value: number
  )
  
  --[[
    Additional summand for the roll angle; useful for camera shaking effects.
    Full roll is `getRoll()+getExtraRoll()`.
  ]]
  setExtraRoll: function(
    value: number
  )
  
  --[[
    Additional summand for the yaw angle; useful for camera shaking effects.
    Full yaw is `getYaw()+getExtraYaw()`.
  ]]
  setExtraYaw: function(
    value: number
  )
  
  --[[
    Set the field of view
  ]]
  setFieldOfView: function(
    fov: number
  )
  
  --[[
    Set the offset between the characters head and the camera in first person mode (3d vector).
  ]]
  setFirstPersonOffset: function(
    offset: openmw_util.Vector3
  )
  
  --[[
    Set the preferred offset between the tracked position (see `getTrackedPosition`) and the camera focal point (the center of the screen) in third person mode.
    The offset is a 2d vector (X, Y) where X is horizontal (to the right from the character) and Y component is vertical (upward).
    The real offset can differ from the preferred one during smooth transition or if blocked by an obstacle.
    Smooth transition happens by default every time the preferred offset changes. Use `instantTransition()` to skip the current transition.
  ]]
  setFocalPreferredOffset: function(
    offset: openmw_util.Vector2
  )
  
  --[[
    Set the speed coefficient of focal point (the center of the screen in third person mode) smooth transition.
    Smooth transition happens by default every time the preferred offset changes. Use `instantTransition()` to skip the current transition.
  ]]
  setFocalTransitionSpeed: function(
    speed: number
  )
  
  --[[
    Change @{openmw.camera#MODE}; if the second (optional, true by default) argument is set to false, the switching can be delayed (see `getQueuedMode`).
  ]]
  setMode: function(
    mode: Mode,
    force: boolean
  )
  
  --[[
    Force the pitch angle to the given value (radians); player input on this axis is ignored in this frame.
  ]]
  setPitch: function(
    value: number
  )
  
  --[[
    Set preferred distance between the camera and the character in third person mode.
  ]]
  setPreferredThirdPersonDistance: function(
    distance: number
  )
  
  --[[
    Set the camera roll angle (radians).
  ]]
  setRoll: function(
    value: number
  )
  
  --[[
    Set the camera position; can be used only if camera is in Static mode.
  ]]
  setStaticPosition: function(
    pos: openmw_util.Vector3
  )
  
  --[[
    Set the view distance.
    - Takes effect on the next frame.
  ]]
  setViewDistance: function(
    distance: number
  )
  
  --[[
    Force the yaw angle to the given value (radians); player input on this axis is ignored in this frame.
  ]]
  setYaw: function(
    value: number
  )
  
  --[[
    Show/hide the crosshair.
  ]]
  showCrosshair: function(
    boolValue: boolean
  )
  
  --[[
    Get a vector from the camera to the world for the given point in the viewport.
    (0, 0) is the top left corner of the screen.
  ]]
  viewportToWorldVector: function(
    normalizedScreenPos: openmw_util.Vector2
  ): openmw_util.Vector3
  
  --[[
    Get a vector from the world to the viewport for the given point in the world space.
    (0, 0) is the top left corner of the screen.
    The z component of the return value holds the distance from the camera to the position, in world space
  ]]
  worldToViewportVector: function(
    worldPos: openmw_util.Vector3
  ): openmw_util.Vector3
  
end
return camera