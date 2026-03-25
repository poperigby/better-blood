--[[
  Allows for manipulation of the data loaded from content files while the game is first started.
  Records can be created and deleted using this package as if a content file had done so.
  local content = require('openmw.content')
]]

local type openmw_core = require("openmw.core")
local type openmw_types = require("openmw.types")
local record content
  interface DoorContent
    --[[
      A mutable list of all @{openmw.types#DoorRecord}s.
      content.doors.records.MyDoor = { template = content.doors.records['door_dwrv_double00'], mwscript = 'blockedDoor', name = 'Overly Heavy Dwemer Door' }
    ]]
    records: { openmw_types.DoorRecord }
    
  end
  interface PotionContent
    --[[
      A mutable list of all @{openmw.types#PotionRecord}s.
      content.potions.records.MyPotion = { template = content.potions.records['p_dispel_s'], name = 'Too Strong', effects = { { id = 'FireDamage', duration = 10, range = content.RANGE.Self, magnitudeMin = 100 } } }
    ]]
    records: { openmw_types.PotionRecord }
    
  end
  interface GlobalContent
    --[[
      A mutable list of all global mwscript variables.
      content.globals.records.MyVariable = 42
    ]]
    records: { string: number }
    
  end
  interface MiscContent
    --[[
      A mutable list of all @{openmw.types#MiscellaneousRecord}s.
      content.miscs.records.MyMisc = { template = content.miscs.records['gold_001'], mwscript = 'BILL_MarksSpiritSummon', weight = 5 }
    ]]
    records: { openmw_types.MiscellaneousRecord }
    
  end
  interface StaticContent
    --[[
      A mutable list of all @{openmw.types#StaticRecord}s.
      content.statics.records.MyStatic = { model = 'meshes/b/B_N_Wood Elf_M_Head_02.nif' }
    ]]
    records: { openmw_types.StaticRecord }
    
  end
  interface ActivatorContent
    --[[
      A mutable list of all @{openmw.types#ActivatorRecord}s.
      content.activators.records.MyActivator = { mwscript = 'float', model = 'meshes/w/w_chitin_arrow.nif', name = 'Quest marker' }
    ]]
    records: { openmw_types.ActivatorRecord }
    
  end
  --[[
    @{openmw.core#SpellRange}: Magic ranges
  ]]
  RANGE: openmw_core.SpellRange
  
  --[[
    @{#ActivatorContent}: Activator manipulation.
  ]]
  activators: content.ActivatorContent
  
  --[[
    @{#DoorContent}: Door manipulation.
  ]]
  doors: content.DoorContent
  
  --[[
    @{#GlobalContent}: Global variable manipulation.
  ]]
  globals: content.GlobalContent
  
  --[[
    @{#MiscContent}: Misc manipulation.
  ]]
  miscs: content.MiscContent
  
  --[[
    @{#PotionContent}: Potion manipulation.
  ]]
  potions: content.PotionContent
  
  --[[
    @{#StaticContent}: Static manipulation.
  ]]
  statics: content.StaticContent
  
end
return content