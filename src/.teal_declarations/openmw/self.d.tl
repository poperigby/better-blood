--[[
  Provides full access to the object the script is attached to.
  All fields and function of `GameObject` are also available for `openmw.self`.
  local self = require('openmw.self')
  local types = require('openmw.types')
  if self.type == types.Player then  -- All fields and functions of `GameObject` are available.
      self:sendEvent("something", self.position)
  end
]]

local type openmw_core = require("openmw.core")
local record Self
  interface ATTACK_TYPE
    Any: number
    
    Chop: number
    
    NoAttack: number
    
    Slash: number
    
    Thrust: number
    
  end
  --[[
    Allows to view and/or modify controls of an actor.
    All fields are mutable.
  ]]
  interface ActorControls
    --[[
      If true - initiate a jump
    ]]
    jump: boolean
    
    --[[
      +1 - move forward, -1 - move backward
    ]]
    movement: number
    
    --[[
      Look down (radians); if negative - look up
    ]]
    pitchChange: number
    
    --[[
      true - run, false - walk
    ]]
    run: boolean
    
    --[[
      +1 - move right, -1 - move left
    ]]
    sideMovement: number
    
    --[[
      If true - sneak
    ]]
    sneak: boolean
    
    --[[
      Activates the readied weapon/spell according to a provided value. For weapons, keeping this value modified will charge the attack until set to @{#ATTACK_TYPE.NoAttack}. If an @{#ATTACK_TYPE} not appropriate for a currently equipped weapon provided - an appropriate @{#ATTACK_TYPE} will be used instead.
    ]]
    use: Self.ATTACK_TYPE
    
    --[[
      Turn right (radians); if negative - turn left
    ]]
    yawChange: number
    
  end
  --[[
    Movement controls (only for actors)
  ]]
  controls: Self.ActorControls
  
  --[[
    Enables or disables standard AI (enabled by default).
  ]]
  enableAI: function(
    Self: any,
    v: boolean
  )
  
  --[[
    Returns true if the script isActive (the object it is attached to is in an active cell).
    If it is not active, then `openmw.nearby` can not be used.
  ]]
  isActive: function(
    Self: any
  ): boolean
  
  --[[
    The object the script is attached to (readonly)
  ]]
  object: openmw_core.GameObject
  
end
return Self