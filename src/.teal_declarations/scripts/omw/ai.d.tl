--[[
  Basic AI interface
  require('openmw.interfaces').AI
]]

local type openmw_core = require("openmw.core")
local type openmw_util = require("openmw.util")
local record AI
  --[[
    AI Package
  ]]
  interface Package
    --[[
      Destination point of the AI package.
    ]]
    destPosition: openmw_util.Vector3
    
    --[[
      Distance value (can be nil).
    ]]
    distance: number
    
    --[[
      Duration value (can be nil).
    ]]
    duration: number
    
    --[[
      Idle value (can be nil).
    ]]
    idle: table
    
    --[[
      Should this package be repeated (true or false).
    ]]
    isRepeat: boolean
    
    --[[
      Whether to help the target in combat (true or false).
    ]]
    sideWithTarget: boolean
    
    --[[
      Target (usually an actor) of the AI package (can be nil).
    ]]
    target: openmw_core.GameObject
    
    --[[
      Type of the AI package.
    ]]
    type: string
    
  end
  --[[
    Iterate over all packages starting from the active one and remove those where `filterCallback` returns false.
  ]]
  filterPackages: function(
    filterCallback: function
  )
  
  --[[
    Iterate over all packages and run `callback` for each starting from the active one.
    The same as `filterPackage`, but without removal.
  ]]
  forEachPackage: function(
    callback: function
  )
  
  --[[
    Return the currently active AI package (or `nil` if there are no AI packages).
  ]]
  getActivePackage: function(): AI.Package
  
  --[[
    Return the target of the active package if the package has given type
  ]]
  getActiveTarget: function(
    packageType: string
  ): openmw_core.GameObject
  
  --[[
    Get a list of targets from all packages of the given type.
  ]]
  getTargets: function(
    packageType: string
  ): { openmw_core.GameObject }
  
  --[[
    Return whether the actor is fleeing.
  ]]
  isFleeing: function(): boolean
  
  --[[
    Remove packages of given type (remove all packages if the type is not specified).
  ]]
  removePackages: function(
    packageType: string
  )
  
  --[[
    Start a new AI package.
  ]]
  startPackage: function(
    options: table
  )
  
  --[[
    Interface version
  ]]
  version: number
  
end
return AI