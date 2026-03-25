--[[
  Provides an interface to the game world for global scripts.
  local world = require('openmw.world')
]]

local type openmw_core = require("openmw.core")
local type openmw_util = require("openmw.util")
local record world
  interface VFX
    --[[
      Remove all VFX with the given vfxId.
      Best invoked through the RemoveVfx global event
      -- Remove all VFX with vfxId "myvfx"
      core.sendGlobalEvent('RemoveVfx', "myvfx")
      
    ]]
    remove: function(
      vfxId: string
    )
    
    --[[
      Spawn a VFX at the given location in the world.
      Best invoked through the SpawnVfx global event
      -- Spawn a sanctuary effect near the player
      local effect = core.magic.effects.records[core.magic.EFFECT_TYPE.Sanctuary]
      local pos = self.position + util.vector3(0, 100, 0)
      local model = types.Static.records[effect.castStatic].model
      core.sendGlobalEvent('SpawnVfx', {model = model, position = pos, options = { useAmbientLight = false, vfxId = "myVfx" }})
      
    ]]
    spawn: function(
      model: string, --[[string model path (normally taken from a record such as @{openmw.types#StaticRecord.model} or similar)]]
      position: openmw_util.Vector3,
      options: table
    )
    
  end
  --[[
    Functions related to MWScript.
  ]]
  interface MWScriptFunctions
    --[[
      Returns global mwscript with given recordId.
      Returns `nil` if the script doesn't exist or is not started.
      Currently there can be only one instance of each mwscript, but in multiplayer it will be possible to have a separate instance per player.
    ]]
    getGlobalScript: function(
      recordId: string,
      player: openmw_core.GameObject
    ): world.MWScript | nil
    
    --[[
      Returns mutable global variables.
      In multiplayer, these may be specific to the provided player.
    ]]
    getGlobalVariables: function(
      player: openmw_core.GameObject
    ): world.MWScriptVariables
    
    --[[
      Returns local mwscript on ``object``.
      Returns `nil` if the script doesn't exist or is not started.
    ]]
    getLocalScript: function(
      object: openmw_core.GameObject,
      player: openmw_core.GameObject
    ): world.MWScript | nil
    
  end
  interface MWScriptVariables
    metamethod __index: function(self: world.MWScriptVariables, index: string): number
  end
  --[[
    for _, script in ipairs(world.mwscript.getLocalScripts(object)) do
      -- print the value of local variable 'something' (0 if there is no such variable)
      print(script.variables.something)
      -- set the variable 'something' (raises an error if there is no such variable)
      script.variables.something = 5
    end
  ]]
  interface MWScript
    --[[
      Whether the script is currently running
    ]]
    isRunning: boolean
    
    --[[
      The object the script is attached to.
    ]]
    object: openmw_core.GameObject
    
    --[[
      The player the script refers to.
    ]]
    player: openmw_core.GameObject
    
    --[[
      Id of the script
    ]]
    recordId: string
    
    --[[
      Local variables of the script (mutable)
    ]]
    variables: world.MWScriptVariables
    
  end
  --[[
    List of currently active actors.
  ]]
  activeActors: openmw_core.ObjectList
  
  --[[
    Advance the world time by a certain number of hours.
    This advances time, weather, and AI, but does not perform other functions associated with the passage of time, e.g., regeneration.
  ]]
  advanceTime: function(
    hours: number
  )
  
  --[[
    List of all cells
    for i, cell in ipairs(world.cells) do print(cell) end
  ]]
  cells: { openmw_core.Cell }
  
  --[[
    Create a new instance of the given record.
    After creation the object is in the disabled state. Use :teleport to place to the world or :moveInto to put it into a container or an inventory.
    Note that dynamically created creatures, NPCs, and container inventories will not respawn.
     -- put 100 gold on the ground at the position of `actor`
    money = world.createObject('gold_001', 100)
    money:teleport(actor.cell.name, actor.position)
  ]]
  createObject: function(
    recordId: string, --[[Record ID. String ids that came from ESM3 content files are lower-cased. If another ID is provided, it must be provided exactly as it is, case sensitive.]]
    count: number
  ): openmw_core.GameObject
  
  --[[
    Creates a custom record in the world database; string IDs that came from ESM3 content files are lower-cased.
    Eventually meant to support all records, but the current
    set of supported types is limited to:
    
    * @{openmw.types#ActivatorRecord},
    * @{openmw.types#ArmorRecord},
    * @{openmw.types#BookRecord},
    * @{openmw.types#ClothingRecord},
    * @{openmw.types#ContainerRecord},
    * @{openmw.types#CreatureRecord},
    * @{openmw.types#DoorRecord},
    * @{openmw.types#LightRecord},
    * @{openmw.types#MiscellaneousRecord},
    * @{openmw.types#NpcRecord},
    * @{openmw.types#PotionRecord},
    * @{openmw.types#StaticRecord},
    * @{openmw.types#WeaponRecord}
  ]]
  createRecord: function(
    record: any
  ): any
  
  --[[
    Loads a cell by ID provided
  ]]
  getCellById: function(
    cellId: string
  ): openmw_core.Cell
  
  --[[
    Loads a named cell
  ]]
  getCellByName: function(
    cellName: string
  ): openmw_core.Cell
  
  --[[
    Loads an exterior cell by grid indices
  ]]
  getExteriorCell: function(
    gridX: number,
    gridY: number,
    cellOrName: any
  ): openmw_core.Cell
  
  --[[
    Game time in seconds.
  ]]
  getGameTime: function(): number
  
  --[[
    The scale of game time relative to simulation time.
  ]]
  getGameTimeScale: function(): number
  
  --[[
    Return an object by RefNum/FormId.
    Note: the function always returns @{openmw.core#GameObject} and doesn't validate that
    the object exists in the game world. If it doesn't exist or not yet loaded to memory),
    then `obj:isValid()` will be `false`.
    local obj = world.getObjectByFormId(core.getFormId('Morrowind.esm', 128964))
  ]]
  getObjectByFormId: function(
    formId: string
  ): openmw_core.GameObject
  
  --[[
    The tags that are currently pausing the game.
  ]]
  getPausedTags: function(): table
  
  --[[
    Simulation time in seconds.
    The number of simulation seconds passed in the game world since starting a new game.
  ]]
  getSimulationTime: function(): number
  
  --[[
    The scale of simulation time relative to real time.
  ]]
  getSimulationTimeScale: function(): number
  
  --[[
    Whether the world is paused.
  ]]
  isWorldPaused: function(): boolean
  
  --[[
    Functions related to MWScript (see @{#MWScriptFunctions}).
  ]]
  mwscript: world.MWScriptFunctions
  
  --[[
    Pause the game starting from the next frame.
  ]]
  pause: function(
    tag: string
  )
  
  --[[
    List of players.
    Currently (since multiplayer is not yet implemented) always has one element.
  ]]
  players: openmw_core.ObjectList
  
  --[[
    Set the ratio of game time speed to simulation time speed.
  ]]
  setGameTimeScale: function(
    ratio: number
  )
  
  --[[
    Set the simulation time scale.
  ]]
  setSimulationTimeScale: function(
    scale: number
  )
  
  --[[
    Remove the given tag from the list of pause tags.
    Resume the game starting from the next frame if the list became empty.
  ]]
  unpause: function(
    tag: string
  )
  
  --[[
    @{#VFX}: Visual effects
  ]]
  vfx: world.VFX
  
end
return world