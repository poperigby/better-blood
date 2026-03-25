--[[
  Defines functions for specific types of game objects.
  local types = require('openmw.types')
]]

local type openmw_core = require("openmw.core")
local type openmw_util = require("openmw.util")
global interface ESM4Book
end
--[[
  Functions for items that can be placed to an inventory or container
]]
global interface Item
  --[[
    (DEPRECATED, use itemData(item).enchantmentCharge) Get this item's current enchantment charge.
  ]]
  getEnchantmentCharge: function(
    item: openmw_core.GameObject
  ): number
  
  --[[
    Whether the object is supposed to be carriable.
    It is true for all items except
    lights without the Carry flag. Non-carriable lights can still be put into
    an inventory with an explicit `object:moveInto` call.
  ]]
  isCarriable: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Checks if the item restocks.
    Returns true if the object restocks, and false otherwise.
  ]]
  isRestocking: function(
    item: openmw_core.GameObject
  ): boolean
  
  --[[
    Set of properties that differentiates one item from another of the same record type; can be used by any script, but only global and self scripts can change values.
  ]]
  itemData: function(
    item: openmw_core.GameObject
  ): types.ItemData
  
  --[[
    Whether the object is an item.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    (DEPRECATED, use itemData(item).enchantmentCharge) Set this item's enchantment charge.
  ]]
  setEnchantmentCharge: function(
    item: openmw_core.GameObject,
    charge: number
  )
  
end
--[[
  Door.STATE
]]
global interface DoorSTATE
  --[[
    The door is in the process of closing.
  ]]
  Closing: number
  
  --[[
    The door is either closed or open (usually closed).
  ]]
  Idle: number
  
  --[[
    The door is in the process of opening.
  ]]
  Opening: number
  
end
global interface ESM4Light
end
global interface ESM4Miscellaneous
end
global interface ESM4ItemMod
end
global interface ESM4Ammunition
end
global interface Static
  --[[
    Creates a @{#StaticRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
  ]]
  createRecordDraft: function(
    static: types.StaticRecord
  ): types.StaticRecord
  
  --[[
    Whether the object is a Static.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#StaticRecord} of a Static
  ]]
  record: function(
    objectOrRecordId: any
  ): types.StaticRecord
  
  --[[
    A read-only list of all @{#StaticRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #StaticRecord.
    local record = types.Static.records['example_recordid']
  ]]
  records: { types.StaticRecord }
  
end
--[[
  Clothing.TYPE
]]
global interface ClothingTYPE
  Amulet: number
  
  Belt: number
  
  LGlove: number
  
  Pants: number
  
  RGlove: number
  
  Ring: number
  
  Robe: number
  
  Shirt: number
  
  Shoes: number
  
  Skirt: number
  
end
global interface ESM4Weapon
end
global interface ESM4Armor
end
global interface ESM4Flora
end
global interface DynamicStats
  --[[
    Fatigue (returns @{#DynamicStat})
  ]]
  fatigue: function(
    actor: openmw_core.GameObject
  ): types.DynamicStat
  
  --[[
    Health (returns @{#DynamicStat})
  ]]
  health: function(
    actor: openmw_core.GameObject
  ): types.DynamicStat
  
  --[[
    Magicka (returns @{#DynamicStat})
  ]]
  magicka: function(
    actor: openmw_core.GameObject
  ): types.DynamicStat
  
end
global interface Miscellaneous is Item
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Creates a @{#MiscellaneousRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
  ]]
  createRecordDraft: function(
    miscellaneous: types.MiscellaneousRecord
  ): types.MiscellaneousRecord
  
  --[[
    (DEPRECATED, use itemData(item).soul) Returns the read-only soul of a miscellaneous item
  ]]
  getSoul: function(
    object: openmw_core.GameObject
  ): string
  
  --[[
    Whether the object is a Miscellaneous.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#MiscellaneousRecord} of a miscellaneous item
  ]]
  record: function(
    objectOrRecordId: any
  ): types.MiscellaneousRecord
  
  --[[
    A read-only list of all @{#MiscellaneousRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #MiscellaneousRecord.
    local record = types.Miscellaneous.records['example_recordid']
  ]]
  records: { types.MiscellaneousRecord }
  
  --[[
    (DEPRECATED, use itemData(item).soul) Sets the soul of a miscellaneous item, intended for soul gem objects; Must be used in a global script.
  ]]
  setSoul: function(
    object: openmw_core.GameObject,
    soulId: string
  )
  
end
global interface SkillStats
  --[[
    Acrobatics (returns @{#SkillStat})
  ]]
  acrobatics: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Alchemy (returns @{#SkillStat})
  ]]
  alchemy: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Alteration (returns @{#SkillStat})
  ]]
  alteration: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Armorer (returns @{#SkillStat})
  ]]
  armorer: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Athletics (returns @{#SkillStat})
  ]]
  athletics: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Axe (returns @{#SkillStat})
  ]]
  axe: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Block (returns @{#SkillStat})
  ]]
  block: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Blunt Weapon (returns @{#SkillStat})
  ]]
  bluntweapon: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Conjuration (returns @{#SkillStat})
  ]]
  conjuration: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Destruction (returns @{#SkillStat})
  ]]
  destruction: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Enchant (returns @{#SkillStat})
  ]]
  enchant: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Hand To Hand (returns @{#SkillStat})
  ]]
  handtohand: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Heavy Armor (returns @{#SkillStat})
  ]]
  heavyarmor: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Illusion (returns @{#SkillStat})
  ]]
  illusion: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Light Armor (returns @{#SkillStat})
  ]]
  lightarmor: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Long Blade (returns @{#SkillStat})
  ]]
  longblade: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Marksman (returns @{#SkillStat})
  ]]
  marksman: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Medium Armor (returns @{#SkillStat})
  ]]
  mediumarmor: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Mercantile (returns @{#SkillStat})
  ]]
  mercantile: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Mysticism (returns @{#SkillStat})
  ]]
  mysticism: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Restoration (returns @{#SkillStat})
  ]]
  restoration: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Security (returns @{#SkillStat})
  ]]
  security: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Short Blade (returns @{#SkillStat})
  ]]
  shortblade: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Sneak (returns @{#SkillStat})
  ]]
  sneak: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Spear (returns @{#SkillStat})
  ]]
  spear: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Speechcraft (returns @{#SkillStat})
  ]]
  speechcraft: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
  --[[
    Unarmored (returns @{#SkillStat})
  ]]
  unarmored: function(
    actor: openmw_core.GameObject
  ): types.SkillStat
  
end
global interface EQUIPMENT_SLOT
  Ammunition: number
  
  Amulet: number
  
  Belt: number
  
  Boots: number
  
  CarriedLeft: number
  
  CarriedRight: number
  
  Cuirass: number
  
  Greaves: number
  
  Helmet: number
  
  LeftGauntlet: number
  
  LeftPauldron: number
  
  LeftRing: number
  
  Pants: number
  
  RightGauntlet: number
  
  RightPauldron: number
  
  RightRing: number
  
  Robe: number
  
  Shirt: number
  
  Skirt: number
  
end
--[[
  Value modification is delayed
]]
global interface ReputationStat
  --[[
    Current reputation value.
  ]]
  current: number
  
end
global interface Lockpick is Item
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Whether the object is a Lockpick.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#LockpickRecord} of a lockpick
  ]]
  record: function(
    objectOrRecordId: any
  ): types.LockpickRecord
  
  --[[
    A read-only list of all @{#LockpickRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #LockpickRecord.
    local record = types.Lockpick.records['example_recordid']
  ]]
  records: { types.LockpickRecord }
  
end
global interface AttributeStats
  --[[
    Agility (returns @{#AttributeStat})
  ]]
  agility: function(
    actor: openmw_core.GameObject
  ): types.AttributeStat
  
  --[[
    Endurance (returns @{#AttributeStat})
  ]]
  endurance: function(
    actor: openmw_core.GameObject
  ): types.AttributeStat
  
  --[[
    Intelligence (returns @{#AttributeStat})
  ]]
  intelligence: function(
    actor: openmw_core.GameObject
  ): types.AttributeStat
  
  --[[
    Luck (returns @{#AttributeStat})
  ]]
  luck: function(
    actor: openmw_core.GameObject
  ): types.AttributeStat
  
  --[[
    Personality (returns @{#AttributeStat})
  ]]
  personality: function(
    actor: openmw_core.GameObject
  ): types.AttributeStat
  
  --[[
    Speed (returns @{#AttributeStat})
  ]]
  speed: function(
    actor: openmw_core.GameObject
  ): types.AttributeStat
  
  --[[
    Strength (returns @{#AttributeStat})
  ]]
  strength: function(
    actor: openmw_core.GameObject
  ): types.AttributeStat
  
  --[[
    Willpower (returns @{#AttributeStat})
  ]]
  willpower: function(
    actor: openmw_core.GameObject
  ): types.AttributeStat
  
end
global interface AIStats
  --[[
    Alarm (returns @{#AIStat})
  ]]
  alarm: function(
    actor: openmw_core.GameObject
  ): types.AIStat
  
  --[[
    Fight (returns @{#AIStat})
  ]]
  fight: function(
    actor: openmw_core.GameObject
  ): types.AIStat
  
  --[[
    Flee (returns @{#AIStat})
  ]]
  flee: function(
    actor: openmw_core.GameObject
  ): types.AIStat
  
  --[[
    Hello (returns @{#AIStat})
  ]]
  hello: function(
    actor: openmw_core.GameObject
  ): types.AIStat
  
end
--[[
  Apparatus.TYPE
]]
global interface ApparatusTYPE
  Alembic: number
  
  Calcinator: number
  
  MortarPestle: number
  
  Retort: number
  
end
--[[
  Book.SKILL
]]
global interface BookSKILL
  --[[
    "acrobatics"
  ]]
  acrobatics: string
  
  --[[
    "alchemy"
  ]]
  alchemy: string
  
  --[[
    "alteration"
  ]]
  alteration: string
  
  --[[
    "armorer"
  ]]
  armorer: string
  
  --[[
    "athletics"
  ]]
  athletics: string
  
  --[[
    "axe"
  ]]
  axe: string
  
  --[[
    "block"
  ]]
  block: string
  
  --[[
    "bluntweapon"
  ]]
  bluntWeapon: string
  
  --[[
    "conjuration"
  ]]
  conjuration: string
  
  --[[
    "destruction"
  ]]
  destruction: string
  
  --[[
    "enchant"
  ]]
  enchant: string
  
  --[[
    "handtohand"
  ]]
  handToHand: string
  
  --[[
    "heavyarmor"
  ]]
  heavyArmor: string
  
  --[[
    "illusion"
  ]]
  illusion: string
  
  --[[
    "lightarmor"
  ]]
  lightArmor: string
  
  --[[
    "longblade"
  ]]
  longBlade: string
  
  --[[
    "marksman"
  ]]
  marksman: string
  
  --[[
    "mediumarmor"
  ]]
  mediumArmor: string
  
  --[[
    "mercantile"
  ]]
  mercantile: string
  
  --[[
    "mysticism"
  ]]
  mysticism: string
  
  --[[
    "restoration"
  ]]
  restoration: string
  
  --[[
    "security"
  ]]
  security: string
  
  --[[
    "shortblade"
  ]]
  shortBlade: string
  
  --[[
    "sneak"
  ]]
  sneak: string
  
  --[[
    "spear"
  ]]
  spear: string
  
  --[[
    "speechcraft"
  ]]
  speechcraft: string
  
  --[[
    "unarmored"
  ]]
  unarmored: string
  
end
global interface LOCKABLE
  --[[
    Returns the key record of a lockable object(door, container)
  ]]
  getKeyRecord: function(
    object: openmw_core.GameObject
  ): types.MiscellaneousRecord
  
  --[[
    Returns the lock level of a lockable object(door, container).
    Does not determine if an object is locked or not, if an object is locked while this is set above 0, this value will be used if no other value is specified.
  ]]
  getLockLevel: function(
    object: openmw_core.GameObject
  ): number
  
  --[[
    Returns the trap spell of a lockable object(door, container)
  ]]
  getTrapSpell: function(
    object: openmw_core.GameObject
  ): openmw_core.Spell
  
  --[[
    Returns true if the lockable object is locked, and false if it is not.
  ]]
  isLocked: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Sets the lock level level of a lockable object(door, container);Locks if not already locked; Must be used in a global script.
  ]]
  lock: function(
    object: openmw_core.GameObject,
    lockLevel: number
  )
  
  --[[
    Whether the object is a Lockable.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Sets the key of a lockable object(door, container); removes it if empty string is provided.
    Must be used in a global script.
  ]]
  setKeyRecord: function(
    object: openmw_core.GameObject,
    miscOrId: any
  )
  
  --[[
    Sets the trap spell of a lockable object(door, container); removes it if empty string is provided.
    Must be used in a global script.
  ]]
  setTrapSpell: function(
    object: openmw_core.GameObject,
    spellOrId: any
  )
  
  --[[
    Unlocks the lockable object.
    Does not change the lock level, it can be kept for future use.
  ]]
  unlock: function(
    object: openmw_core.GameObject
  )
  
end
global interface Classes
  --[[
    Returns a read-only @{#ClassRecord}
  ]]
  record: function(
    recordId: string
  ): types.ClassRecord
  
  --[[
    A read-only list of all @{#ClassRecord}s in the world database, may be indexed by recordId.
    Implements [iterables#List](iterables.html#List) of #ClassRecord.
    local class = types.NPC.classes.records['class id']  -- get by id
  ]]
  records: { types.ClassRecord }
  
end
global interface Clothing is Item
  --[[
    @{#ClothingTYPE}
  ]]
  TYPE: ClothingTYPE
  
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Creates a @{#ClothingRecord} without adding it to the world database, for the clothing to appear correctly on the body, make sure to use a template as described below.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
    local clothingTemplate = types.Clothing.record('exquisite_robe_01')
    local clothingTable = {name = "Better Exquisite Robe",template = clothingTemplate,enchantCapacity = clothingTemplate.enchantCapacity + 10}
     --This is the new record we want to create, with a record provided as a template.
    local recordDraft = types.Clothing.createRecordDraft(clothingTable)--Need to convert the table into the record draft
    local newRecord = world.createRecord(recordDraft)--This creates the actual record
    world.createObject(newRecord.id):moveInto(playerActor)--Create an instance of this object, and move it into the player's inventory
  ]]
  createRecordDraft: function(
    clothing: types.ClothingRecord
  ): types.ClothingRecord
  
  --[[
    Whether the object is a Clothing.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#ClothingRecord} of a Clothing
  ]]
  record: function(
    objectOrRecordId: any
  ): types.ClothingRecord
  
  --[[
    A read-only list of all @{#ClothingRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #ClothingRecord.
    local record = types.Clothing.records['example_recordid']
  ]]
  records: { types.ClothingRecord }
  
end
global interface Apparatus is Item
  --[[
    @{#ApparatusTYPE}
  ]]
  TYPE: ApparatusTYPE
  
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Whether the object is an Apparatus.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#ApparatusRecord} of an apparatus
  ]]
  record: function(
    objectOrRecordId: any
  ): types.ApparatusRecord
  
  --[[
    A read-only list of all @{#ApparatusRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #ApparatusRecord.
    local record = types.Apparatus.records['example_recordid']
  ]]
  records: { types.ApparatusRecord }
  
end
global interface Light is Item
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Creates a @{#LightRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
  ]]
  createRecordDraft: function(
    light: types.LightRecord
  ): types.LightRecord
  
  --[[
    Whether the object is a Light.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#LightRecord} of a Light
  ]]
  record: function(
    objectOrRecordId: any
  ): types.LightRecord
  
  --[[
    A read-only list of all @{#LightRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #LightRecord.
    local record = types.Light.records['example_recordid']
  ]]
  records: { types.LightRecord }
  
end
global interface Ingredient is Item
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Whether the object is an Ingredient.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#IngredientRecord} of a Ingredient
  ]]
  record: function(
    objectOrRecordId: any
  ): types.IngredientRecord
  
  --[[
    A read-only list of all @{#IngredientRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #IngredientRecord.
    local record = types.Ingredient.records['example_recordid']
  ]]
  records: { types.IngredientRecord }
  
end
--[[
  Creature.TYPE
]]
global interface CreatureTYPE
  Creatures: number
  
  Daedra: number
  
  Humanoid: number
  
  Undead: number
  
end
global interface Potion is Item
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Creates a @{#PotionRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
  ]]
  createRecordDraft: function(
    potion: types.PotionRecord
  ): types.PotionRecord
  
  --[[
    Whether the object is a Potion.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#PotionRecord} of a potion
  ]]
  record: function(
    objectOrRecordId: any
  ): types.PotionRecord
  
  --[[
    A read-only list of all @{#PotionRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #PotionRecord.
    local record = types.Potion.records['example_recordid']
  ]]
  records: { types.PotionRecord }
  
end
global interface ActorStats
  ai: AIStats
  
  attributes: AttributeStats
  
  dynamic: DynamicStats
  
  --[[
    Level (returns @{#LevelStat})
  ]]
  level: function(
    actor: openmw_core.GameObject
  ): types.LevelStat
  
end
--[[
  Weapon.TYPE
]]
global interface WeaponTYPE
  Arrow: number
  
  AxeOneHand: number
  
  AxeTwoHand: number
  
  BluntOneHand: number
  
  BluntTwoClose: number
  
  BluntTwoWide: number
  
  Bolt: number
  
  LongBladeOneHand: number
  
  LongBladeTwoHand: number
  
  MarksmanBow: number
  
  MarksmanCrossbow: number
  
  MarksmanThrown: number
  
  ShortBladeOneHand: number
  
  SpearTwoWide: number
  
end
global interface NpcStats is ActorStats
  reputation: ReputationStat
  
  skills: SkillStats
  
end
global interface ESM4Potion
end
global interface Book is Item
  --[[
    DEPRECATED, use @{openmw.core#Skill}
  ]]
  SKILL: BookSKILL
  
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Creates a @{#BookRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
  ]]
  createRecordDraft: function(
    book: types.BookRecord
  ): types.BookRecord
  
  --[[
    Whether the object is a Book.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#BookRecord} of a book
  ]]
  record: function(
    objectOrRecordId: any
  ): types.BookRecord
  
  --[[
    A read-only list of all @{#BookRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #BookRecord.
    local record = types.Book.records['example_recordid']
  ]]
  records: { types.BookRecord }
  
end
global interface ESM4Ingredient
end
global interface ESM4Terminal
  --[[
    Whether the object is a ESM4Terminal.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#ESM4TerminalRecord} of a terminal
  ]]
  record: function(
    objectOrRecordId: any
  ): types.ESM4TerminalRecord
  
  --[[
    A read-only list of all @{#ESM4TerminalRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #ESM4TerminalRecord.
    local record = types.ESM4Terminal.records['example_recordid']
  ]]
  records: { types.ESM4TerminalRecord }
  
end
global interface ESM4Activator
end
global interface Races
  --[[
    Returns a read-only @{#RaceRecord}
  ]]
  record: function(
    recordId: string
  ): types.RaceRecord
  
  --[[
    A read-only list of all @{#RaceRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #RaceRecord.
    local race = types.NPC.races.records['race id']  -- get by id
  ]]
  records: { types.RaceRecord }
  
end
global interface STANCE
  --[[
    Default stance
  ]]
  Nothing: number
  
  --[[
    Magic stance
  ]]
  Spell: number
  
  --[[
    Weapon stance
  ]]
  Weapon: number
  
end
global interface ESM4StaticCollection
end
global interface ESM4Static
end
global interface Door is LOCKABLE
  --[[
    @{#DoorSTATE}
    local state = types.Door.STATE["Idle"]
  ]]
  STATE: DoorSTATE
  
  --[[
    Opens/Closes the door.
    Can only be used in global scripts or on self.
    types.Door.activateDoor(doorObject)
  ]]
  activateDoor: function(
    object: openmw_core.GameObject,
    openState: boolean
  )
  
  --[[
    @{#LOCKABLE}
  ]]
  baseType: LOCKABLE
  
  --[[
    Creates a @{#DoorRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
  ]]
  createRecordDraft: function(
    door: types.DoorRecord
  ): types.DoorRecord
  
  --[[
    Destination cell (only if a teleport door).
  ]]
  destCell: function(
    object: openmw_core.GameObject
  ): openmw_core.Cell
  
  --[[
    Destination (only if a teleport door).
  ]]
  destPosition: function(
    object: openmw_core.GameObject
  ): openmw_util.Vector3
  
  --[[
    Destination rotation (only if a teleport door).
  ]]
  destRotation: function(
    object: openmw_core.GameObject
  ): openmw_util.Transform
  
  --[[
    Gets the state of the door.
  ]]
  getDoorState: function(
    object: openmw_core.GameObject
  ): DoorSTATE
  
  --[[
    Checks if the door is fully closed.
    Returns false if the door is currently opening or closing.
  ]]
  isClosed: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Checks if the door is fully open.
    Returns false if the door is currently opening or closing.
  ]]
  isOpen: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Whether the door is a teleport.
  ]]
  isTeleport: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Whether the object is a Door.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#DoorRecord} of a door
  ]]
  record: function(
    objectOrRecordId: any
  ): types.DoorRecord
  
  --[[
    A read-only list of all @{#DoorRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #DoorRecord.
    local record = types.Door.records['example_recordid']
  ]]
  records: { types.DoorRecord }
  
end
global interface ESM4MovableStatic
end
global interface Activator
  --[[
    Creates an @{#ActivatorRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
  ]]
  createRecordDraft: function(
    activator: types.ActivatorRecord
  ): types.ActivatorRecord
  
  --[[
    Whether the object is an Activator.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#ActivatorRecord} of an activator
  ]]
  record: function(
    objectOrRecordId: any
  ): types.ActivatorRecord
  
  --[[
    A read-only list of all @{#ActivatorRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #ActivatorRecord.
    local record = types.Activator.records['example_recordid']
  ]]
  records: { types.ActivatorRecord }
  
end
--[[
  Armor.TYPE
]]
global interface ArmorTYPE
  Boots: number
  
  Cuirass: number
  
  Greaves: number
  
  Helmet: number
  
  LBracer: number
  
  LGauntlet: number
  
  LPauldron: number
  
  RBracer: number
  
  RGauntlet: number
  
  RPauldron: number
  
  Shield: number
  
end
global interface ESM4Clothing
end
global interface Probe is Item
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Whether the object is a Probe.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#ProbeRecord} of a probe
  ]]
  record: function(
    objectOrRecordId: any
  ): types.ProbeRecord
  
  --[[
    A read-only list of all @{#ProbeRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #ProbeRecord.
    local record = types.Probe.records['example_recordid']
  ]]
  records: { types.ProbeRecord }
  
end
global interface Repair is Item
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Whether the object is a Repair.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#RepairRecord} of a repair tool
  ]]
  record: function(
    objectOrRecordId: any
  ): types.RepairRecord
  
  --[[
    A read-only list of all @{#RepairRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #RepairRecord.
    local record = types.Repair.records['example_recordid']
  ]]
  records: { types.RepairRecord }
  
end
global interface ESM4Door is LOCKABLE
  --[[
    @{#LOCKABLE}
  ]]
  baseType: LOCKABLE
  
  --[[
    Destination cell (only if a teleport door).
  ]]
  destCell: function(
    object: openmw_core.GameObject
  ): openmw_core.Cell
  
  --[[
    Destination (only if a teleport door).
  ]]
  destPosition: function(
    object: openmw_core.GameObject
  ): openmw_util.Vector3
  
  --[[
    Destination rotation (only if a teleport door).
  ]]
  destRotation: function(
    object: openmw_core.GameObject
  ): openmw_util.Transform
  
  --[[
    Whether the door is a teleport.
  ]]
  isTeleport: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Whether the object is a ESM4Door.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#ESM4DoorRecord} of a door
  ]]
  record: function(
    objectOrRecordId: any
  ): types.ESM4DoorRecord
  
  --[[
    A read-only list of all @{#ESM4DoorRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #ESM4DoorRecord.
    local record = types.ESM4Door.records['example_recordid']
  ]]
  records: { types.ESM4DoorRecord }
  
end
global interface Weapon is Item
  --[[
    @{#WeaponTYPE}
  ]]
  TYPE: WeaponTYPE
  
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Creates a @{#WeaponRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
  ]]
  createRecordDraft: function(
    weapon: types.WeaponRecord
  ): types.WeaponRecord
  
  --[[
    Whether the object is a Weapon.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#WeaponRecord} of a weapon
  ]]
  record: function(
    objectOrRecordId: any
  ): types.WeaponRecord
  
  --[[
    A read-only list of all @{#WeaponRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #WeaponRecord.
    local record = types.Weapon.records['example_recordid']
  ]]
  records: { types.WeaponRecord }
  
end
global interface Armor is Item
  --[[
    @{#ArmorTYPE}
  ]]
  TYPE: ArmorTYPE
  
  --[[
    @{#Item}
  ]]
  baseType: Item
  
  --[[
    Creates an @{#ArmorRecord} without adding it to the world database, for the armor to appear correctly on the body, make sure to use a template as described below.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
    local armorTemplate = types.Armor.record('orcish_cuirass')
    local armorTable = {name = "Better Orcish Cuirass",template = armorTemplate,baseArmor = armorTemplate.baseArmor + 10}
     --This is the new record we want to create, with a record provided as a template.
    local recordDraft = types.Armor.createRecordDraft(armorTable)--Need to convert the table into the record draft
    local newRecord = world.createRecord(recordDraft)--This creates the actual record
    world.createObject(newRecord.id):moveInto(playerActor)--Create an instance of this object, and move it into the player's inventory
  ]]
  createRecordDraft: function(
    armor: types.ArmorRecord
  ): types.ArmorRecord
  
  --[[
    Whether the object is an Armor.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#ArmorRecord} of an Armor
  ]]
  record: function(
    objectOrRecordId: any
  ): types.ArmorRecord
  
  --[[
    A read-only list of all @{#ArmorRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #ArmorRecord.
    local record = types.Armor.records['example_recordid']
  ]]
  records: { types.ArmorRecord }
  
end
global interface Container is LOCKABLE
  --[[
    @{#LOCKABLE}
  ]]
  baseType: LOCKABLE
  
  --[[
    Container content.
  ]]
  content: function(
    object: openmw_core.GameObject
  ): openmw_core.Inventory
  
  --[[
    Creates a @{#ContainerRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
    local chestTemplate = types.Container.records['chest_small_01']
    local containerTable = {name = "Respawning Treasure Chest", template = chestTemplate, isRespawning = true, weight = 150.0}
    local recordDraft = types.Container.createRecordDraft(containerTable)
    local newRecord = world.createRecord(recordDraft)
    world.createObject(newRecord.id):teleport(playerCell, playerPosition)
  ]]
  createRecordDraft: function(
    container: types.ContainerRecord
  ): types.ContainerRecord
  
  --[[
    Returns the capacity of a container
  ]]
  getCapacity: function(
    object: openmw_core.GameObject
  ): number
  
  --[[
    Returns the total weight of everything in a container
  ]]
  getEncumbrance: function(
    object: openmw_core.GameObject
  ): number
  
  --[[
    Container content (same as `Container.content`, added for consistency with `Actor.inventory`).
  ]]
  inventory: function(
    object: openmw_core.GameObject
  ): openmw_core.Inventory
  
  --[[
    Whether the object is a Container.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#ContainerRecord} of a container
  ]]
  record: function(
    objectOrRecordId: any
  ): types.ContainerRecord
  
  --[[
    A read-only list of all @{#ContainerRecord}s in the world database.
    Implements [iterables#List](iterables.html#List) of #ContainerRecord.
    local record = types.Container.records['example_recordid']
  ]]
  records: { types.ContainerRecord }
  
end
--[[
  Common functions for Creature, NPC, and Player.
]]
global interface Actor
  --[[
    Available @{#EQUIPMENT_SLOT} values.
    Used in `Actor.getEquipment(obj)` and `Actor.setEquipment(obj, eqp)`.
  ]]
  EQUIPMENT_SLOT: EQUIPMENT_SLOT
  
  --[[
    @{#STANCE}
  ]]
  STANCE: STANCE
  
  --[[
    Return the active magic effects (@{#ActorActiveEffects}) currently affecting the given actor.
  ]]
  activeEffects: function(
    actor: openmw_core.GameObject
  ): types.ActorActiveEffects
  
  --[[
    Return the active spells (@{#ActorActiveSpells}) currently affecting the given actor.
  ]]
  activeSpells: function(
    actor: openmw_core.GameObject
  ): types.ActorActiveSpells
  
  --[[
    Returns true if the object is an actor and is able to move.
    For dead, paralyzed,
    or knocked down actors it returns false.
  ]]
  canMove: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Clears the actor's selected castable (spell or enchanted item)
  ]]
  clearSelectedCastable: function(
    actor: openmw_core.GameObject
  )
  
  --[[
    Get the actor's current barter gold.
  ]]
  getBarterGold: function(
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Get the total weight that the actor can carry.
  ]]
  getCapacity: function(
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Current speed.
  ]]
  getCurrentSpeed: function(
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Get the total weight of everything the actor is carrying, plus modifications from magic effects.
  ]]
  getEncumbrance: function(
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Get equipment.
    Has two overloads:
    
      * With a single argument: returns a table `slot` -> @{openmw.core#GameObject} of currently equipped items.
    See @{#EQUIPMENT_SLOT}. Returns empty table if the actor doesn't have equipment slots.
      * With two arguments: returns an item equipped to the given slot.
  ]]
  getEquipment: function(
    actor: openmw_core.GameObject,
    slot: number
  ): types.EquipmentTable | openmw_core.GameObject
  
  --[[
    Agent bounds to be used for pathfinding functions.
  ]]
  getPathfindingAgentBounds: function(
    actor: openmw_core.GameObject
  ): table
  
  --[[
    Speed of running.
    For dead actors it still returns a positive value.
  ]]
  getRunSpeed: function(
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Get currently selected enchanted item
  ]]
  getSelectedEnchantedItem: function(
    actor: openmw_core.GameObject
  ): any
  
  --[[
    Get currently selected spell
  ]]
  getSelectedSpell: function(
    actor: openmw_core.GameObject
  ): any
  
  --[[
    Returns the current stance (whether a weapon/spell is readied), see the list of @{#STANCE} values.
  ]]
  getStance: function(
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Speed of walking.
    For dead actors it still returns a positive value.
  ]]
  getWalkSpeed: function(
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Returns `true` if the item is equipped on the actor.
  ]]
  hasEquipped: function(
    actor: openmw_core.GameObject,
    item: openmw_core.GameObject
  ): boolean
  
  --[[
    Actor inventory.
  ]]
  inventory: function(
    actor: openmw_core.GameObject
  ): openmw_core.Inventory
  
  --[[
    Check if the given actor is dead (health reached 0, so death process started).
  ]]
  isDead: function(
    actor: openmw_core.GameObject
  ): boolean
  
  --[[
    Check if the given actor's death process is finished.
  ]]
  isDeathFinished: function(
    actor: openmw_core.GameObject
  ): boolean
  
  --[[
    Check if given actor is in the actors processing range.
  ]]
  isInActorsProcessingRange: function(
    actor: openmw_core.GameObject
  ): boolean
  
  --[[
    Is the actor standing on ground.
    Can be called only from a local script.
  ]]
  isOnGround: function(
    actor: openmw_core.GameObject
  ): boolean
  
  --[[
    Is the actor in water.
    Can be called only from a local script.
  ]]
  isSwimming: function(
    actor: openmw_core.GameObject
  ): boolean
  
  --[[
    Whether the object is an actor.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Set the actor's current barter gold.
    Available in global and local scripts. Can only be used on self in local scripts.
  ]]
  setBarterGold: function(
    actor: openmw_core.GameObject,
    amount: number
  )
  
  --[[
    Set equipment.
    Keys in the table are equipment slots (see @{#EQUIPMENT_SLOT}). Each
    value can be either a `GameObject` or recordId. Raises an error if
    the actor doesn't have equipment slots and table is not empty. Can be
    used only in local scripts and only on self.
    local self = require('openmw.self')
    local Actor = require('openmw.types').Actor
    Actor.setEquipment(self, {}) -- unequip all
  ]]
  setEquipment: function(
    actor: openmw_core.GameObject,
    equipment: types.EquipmentTable
  )
  
  --[[
    Set currently selected enchanted item, equipping it if applicable
  ]]
  setSelectedEnchantedItem: function(
    actor: openmw_core.GameObject,
    item: openmw_core.GameObject
  )
  
  --[[
    Set selected spell
  ]]
  setSelectedSpell: function(
    actor: openmw_core.GameObject,
    spell: openmw_core.Spell
  )
  
  --[[
    Sets the current stance (whether a weapon/spell is readied), see the list of @{#STANCE} values.
    Can be used only in local scripts on self.
  ]]
  setStance: function(
    actor: openmw_core.GameObject,
    stance: number
  )
  
  --[[
    Return the spells (@{#ActorSpells}) of the given actor.
  ]]
  spells: function(
    actor: openmw_core.GameObject
  ): types.ActorSpells
  
  --[[
    The actor's stats.
  ]]
  stats: ActorStats
  
end
global interface NPC is Actor
  --[[
    @{#Actor}
  ]]
  baseType: Actor
  
  --[[
    @{#Classes}: Class Data
  ]]
  classes: Classes
  
  --[[
    Clear expelling of NPC from given faction.
    Throws an exception if there is no such faction.
    local NPC = require('openmw.types').NPC;
    NPC.clearExpelled(player, "mages guild");
  ]]
  clearExpelled: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string
  )
  
  --[[
    Creates an @{#NpcRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
  ]]
  createRecordDraft: function(
    npc: types.NpcRecord
  ): types.NpcRecord
  
  --[[
    Expel NPC from given faction.
    Throws an exception if there is no such faction.
    Note: the expelled NPC still keeps their rank and reputation in the faction, they just get an additional flag for the given faction.
    local NPC = require('openmw.types').NPC;
    NPC.expel(player, "mages guild");
  ]]
  expel: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string
  )
  
  --[[
    Returns the current base disposition of the provided NPC.
    This is their base disposition, before modifiers such as personality and faction relations are taken into account.
  ]]
  getBaseDisposition: function(
    object: openmw_core.GameObject,
    player: openmw_core.GameObject
  ): number
  
  --[[
    Returns the current disposition of the provided NPC.
    This is their derived disposition, after modifiers such as personality and faction relations are taken into account.
  ]]
  getDisposition: function(
    object: openmw_core.GameObject,
    player: openmw_core.GameObject
  ): number
  
  --[[
    Get rank of given NPC in given faction.
    Throws an exception if there is no such faction.
    Note: this function does not take in account an expelling state.
    local NPC = require('openmw.types').NPC;
    print(NPC.getFactionRank(player, "mages guild");
  ]]
  getFactionRank: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string
  ): number
  
  --[[
    Get reputation of given actor in given faction.
    Throws an exception if there is no such faction.
    local NPC = require('openmw.types').NPC;
    print(NPC.getFactionReputation(player, "mages guild"));
  ]]
  getFactionReputation: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string
  ): number
  
  --[[
    Get all factions in which NPC has a membership.
    Note: this function does not take in account an expelling state.
    local NPC = require('openmw.types').NPC;
    for _, factionId in pairs(types.NPC.getFactions(actor)) do
        print(factionId);
    end
  ]]
  getFactions: function(
    actor: openmw_core.GameObject
  ): { string }
  
  --[[
    Check if NPC is expelled from given faction.
    Throws an exception if there is no such faction.
    local NPC = require('openmw.types').NPC;
    local result = NPC.isExpelled(player, "mages guild");
  ]]
  isExpelled: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string
  ): boolean
  
  --[[
    Whether the NPC or player is in the werewolf form at the moment.
  ]]
  isWerewolf: function(
    actor: openmw_core.GameObject
  ): boolean
  
  --[[
    Add given actor to given faction.
    Throws an exception if there is no such faction or target actor is not player.
    Function does nothing if valid target actor is already a member of target faction.
    local NPC = require('openmw.types').NPC;
    NPC.joinFaction(player, "mages guild");
  ]]
  joinFaction: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string
  )
  
  --[[
    Remove given actor from given faction.
    Function removes rank data and expelling state, but keeps a reputation in target faction.
    Throws an exception if there is no such faction or target actor is not player.
    Function does nothing if valid target actor is already not member of target faction.
    local NPC = require('openmw.types').NPC;
    NPC.leaveFaction(player, "mages guild");
  ]]
  leaveFaction: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string
  )
  
  --[[
    Modify the base disposition of the provided NPC by a certain amount (only in global scripts or on self).
  ]]
  modifyBaseDisposition: function(
    object: openmw_core.GameObject,
    player: openmw_core.GameObject, --[[The player that you want to modify the disposition for.]]
    value: number
  )
  
  --[[
    Adjust rank of given NPC in given faction.
    Throws an exception if there is no such faction or actor is not a member of given faction.
    For NPCs faction also should be an NPC's primary faction.
    Notes:
    
      * If rank should become <= 0 after modification, function set rank to lowest available rank.
      * If rank should become > 0 after modification, but target rank does not exist, function set rank to the highest valid rank.
    local NPC = require('openmw.types').NPC;
    NPC.modifyFactionRank(player, "mages guild", 1);
  ]]
  modifyFactionRank: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string, --[[Faction ID]]
    value: number
  )
  
  --[[
    Adjust reputation of given actor in given faction.
    Throws an exception if there is no such faction.
    local NPC = require('openmw.types').NPC;
    NPC.modifyFactionReputation(player, "mages guild", 5);
  ]]
  modifyFactionReputation: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string, --[[Faction ID]]
    value: number
  )
  
  --[[
    Whether the object is an NPC or a Player.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    @{#Races}: Race data
  ]]
  races: Races
  
  --[[
    Returns the read-only @{#NpcRecord} of an NPC
  ]]
  record: function(
    objectOrRecordId: any
  ): types.NpcRecord
  
  --[[
    A read-only list of all @{#NpcRecord}s in the world database, may be indexed by recordId.
    Implements [iterables#List](iterables.html#List) of #NpcRecord.
    local npc = types.NPC.records['npc id']  -- get by id
  ]]
  records: { types.NpcRecord }
  
  --[[
    Set the base disposition of the provided NPC (only in global scripts or on self).
  ]]
  setBaseDisposition: function(
    object: openmw_core.GameObject,
    player: openmw_core.GameObject, --[[The player that you want to set the disposition for.]]
    value: number
  )
  
  --[[
    Set rank of given NPC in given faction.
    Throws an exception if there is no such faction, target rank does not exist or actor is not a member of given faction.
    For NPCs faction also should be an NPC's primary faction.
    local NPC = require('openmw.types').NPC;
    NPC.setFactionRank(player, "mages guild", 6);
  ]]
  setFactionRank: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string, --[[Faction ID]]
    value: number
  )
  
  --[[
    Set reputation of given actor in given faction.
    Throws an exception if there is no such faction.
    local NPC = require('openmw.types').NPC;
    NPC.setFactionReputation(player, "mages guild", 100);
  ]]
  setFactionReputation: function(
    actor: openmw_core.GameObject, --[[NPC object]]
    faction: string, --[[Faction ID]]
    value: number
  )
  
  --[[
    Turn an NPC or player into werewolf form or back to normal form.
    Can only be used in global scripts or on self in local scripts.
    -- Transform player into werewolf in a global script
    player.type.setWerewolf(player, true)
  ]]
  setWerewolf: function(
    actor: openmw_core.GameObject, --[[The NPC or player to transform]]
    werewolf: boolean
  )
  
  stats: NpcStats
  
end
global interface Creature is Actor
  --[[
    @{#CreatureTYPE}
  ]]
  TYPE: CreatureTYPE
  
  --[[
    @{#Actor}
  ]]
  baseType: Actor
  
  --[[
    Creates a @{#CreatureRecord} without adding it to the world database.
    Use @{openmw_world#(world).createRecord} to add the record to the world.
    local creatureTemplate = types.Creature.records['mudcrab']
    local creatureTable = {name = "Epic Mudcrab", template = creatureTemplate, soulValue = 500, isEssential = true}
    local recordDraft = types.Creature.createRecordDraft(creatureTable)
    local newRecord = world.createRecord(recordDraft)
    world.createObject(newRecord.id):teleport(playerCell, playerPosition)
  ]]
  createRecordDraft: function(
    creature: types.CreatureRecord
  ): types.CreatureRecord
  
  --[[
    Whether the object is a creature.
  ]]
  objectIsInstance: function(
    object: openmw_core.GameObject
  ): boolean
  
  --[[
    Returns the read-only @{#CreatureRecord} of a creature
  ]]
  record: function(
    objectOrRecordId: any
  ): types.CreatureRecord
  
  --[[
    A read-only list of all @{#CreatureRecord}s in the world database, may be indexed by recordId.
    Implements [iterables#List](iterables.html#List) of #CreatureRecord.
    local creature = types.Creature.records['creature id']  -- get by id
  ]]
  records: { types.CreatureRecord }
  
end
local record types
  interface TravelDestination
    --[[
      ID of the Destination cell for this TravelDestination, Can be used with @{openmw_world#(world).getCellById}.
    ]]
    cellId: string
    
    --[[
      Destination position for this TravelDestination.
    ]]
    position: openmw_util.Vector3
    
    --[[
      Destination rotation for this TravelDestination.
    ]]
    rotation: openmw_util.Transform
    
  end
  --[[
    List of spells (modifications are only allowed in global scripts or on self).
    -- print available spells
    local mySpells = types.Actor.spells(self)
    for _, spell in pairs(mySpells) do print(spell.id) end
  ]]
  interface ActorSpells
    --[[
      Add spell (only in global scripts or on self).
    ]]
    add: function(
      self: types.ActorSpells,
      spellOrId: any
    )
    
    --[[
      If true, the actor has not used this power in the last 24h.
      Will return true for powers the actor does not have.
    ]]
    canUsePower: function(
      self: types.ActorSpells,
      spellOrId: any
    )
    
    --[[
      Remove all spells (only in global scripts or on self).
    ]]
    clear: function(
      self: types.ActorSpells
    )
    
    --[[
      Remove spell (only in global scripts or on self).
    ]]
    remove: function(
      self: types.ActorSpells,
      spellOrId: any
    )
    
  end
  --[[
    Read-only list of spells currently affecting the actor.
    Can be iterated over for a list of @{openmw.core#ActiveSpell}
    -- print active spells
    for _, spell in pairs(Actor.activeSpells(self)) do
        print('Active Spell: '..tostring(spell))
    end
  ]]
  interface ActorActiveSpells
    --[[
      Adds a new spell to the list of active spells (only in global scripts or on self).
      Note that this does not play any related VFX or sounds.
      Note that this should not be used to add spells without durations (i.e. abilities, curses, and diseases) as they will expire instantly. Use @{#ActorSpells.add} instead.
      -- Adds the effect of the chameleon spell to the character
      Actor.activeSpells(self):add({id = 'chameleon', effects = { 0 }})
    ]]
    add: function(
      self: types.ActorActiveSpells,
      options: table
    )
    
    --[[
      Get whether any instance of the specific spell is active on the actor.
    ]]
    isSpellActive: function(
      self: types.ActorActiveSpells,
      recordOrId: any
    ): any
    
    --[[
      Remove an active spell based on active spell ID (see @{openmw_core#ActiveSpell.activeSpellId}).
      Can only be used in global scripts or on self. Can only be used to remove spells with the temporary flag set (see @{openmw_core#ActiveSpell.temporary}).
    ]]
    remove: function(
      self: types.ActorActiveSpells,
      id: any
    )
    
  end
  interface IngredientRecord
    --[[
      The effects (@{#list<openmw.core#MagicEffectWithParams>}) of the ingredient
    ]]
    effects: { openmw_core.MagicEffectWithParams }
    
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      Record id
    ]]
    id: string
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this potion (can be nil)
    ]]
    mwscript: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
    value: number
    
    weight: number
    
  end
  interface CreatureRecord
    --[[
      A table of the 3 randomly selected attacks used by creatures that do not carry weapons. The table consists of 6 numbers split into groups of 2 values corresponding to minimum and maximum damage in that order.
    ]]
    attack: { number }
    
    --[[
      Record id of a base creature, which was modified to create this one
    ]]
    baseCreature: string
    
    --[[
      The base barter gold of the creature
    ]]
    baseGold: number
    
    --[[
      integer representing the blood type of the Creature. Used to generate the correct blood vfx.
    ]]
    bloodType: number
    
    --[[
      whether the creature can fly
    ]]
    canFly: boolean
    
    --[[
      whether the creature can swim
    ]]
    canSwim: boolean
    
    --[[
      whether the creature can use weapons and shields
    ]]
    canUseWeapons: boolean
    
    --[[
      whether the creature can walk
    ]]
    canWalk: boolean
    
    --[[
      The base combat skill of the creature. This is the skill value used for all skills with a 'combat' specialization
    ]]
    combatSkill: number
    
    --[[
      The record ID of the creature
    ]]
    id: string
    
    --[[
      If true, the actor's stats will be automatically calculated based on level and class.
    ]]
    isAutocalc: boolean
    
    --[[
      whether the creature is a biped
    ]]
    isBiped: boolean
    
    --[[
      whether the creature is essential
    ]]
    isEssential: boolean
    
    --[[
      whether the creature respawns after death
    ]]
    isRespawning: boolean
    
    --[[
      The base magic skill of the creature. This is the skill value used for all skills with a 'magic' specialization
    ]]
    magicSkill: number
    
    --[[
      VFS path to the creature's model
    ]]
    model: string
    
    --[[
      MWScript on this creature (can be nil)
    ]]
    mwscript: string
    
    name: string
    
    --[[
      Faction ID of the NPCs default faction. Nil if no faction
    ]]
    primaryFaction: string
    
    --[[
      Faction rank of the NPCs default faction. Nil if no faction
    ]]
    primaryFactionRank: number
    
    --[[
      The services of the creature, in a table. Value is if the service is provided or not, and they are indexed by: Spells, Spellmaking, Enchanting, Training, Repair, Barter, Weapon, Armor, Clothing, Books, Ingredients, Picks, Probes, Lights, Apparatus, RepairItems, Misc, Potions, MagicItems, Travel.
    ]]
    servicesOffered: { string: boolean }
    
    --[[
      The soul value of the creature record
    ]]
    soulValue: number
    
    --[[
      The base stealth skill of the creature. This is the skill value used for all skills with a 'stealth' specialization
    ]]
    stealthSkill: number
    
    --[[
      A list of @{#TravelDestination}s for this creature.
    ]]
    travelDestinations: { types.TravelDestination }
    
    --[[
      The @{#Creature.TYPE} of the creature
    ]]
    type: number
    
  end
  interface OFFENSE_TYPE_IDS
    Assault: number
    
    Murder: number
    
    Pickpocket: number
    
    SleepingInOwnedBed: number
    
    Theft: number
    
    Trespassing: number
    
  end
  interface CreatureLevelledListRecord
    --[[
      Calculate from all levels <= player level, not just the closest below player
    ]]
    calculateFromAllLevels: boolean
    
    --[[
      Chance this list won't spawn anything [0-1]
    ]]
    chanceNone: number
    
    creatures: { types.LevelledListItem }
    
    --[[
      Picks a random id from the levelled list.
    ]]
    getRandomId: function(
      listRecord: types.CreatureLevelledListRecord, --[[The list]]
      MaxLvl: number
    ): string
    
    --[[
      Record id
    ]]
    id: string
    
  end
  interface BookRecord
    --[[
      The enchantment ID of this book (can be nil)
    ]]
    enchant: string
    
    enchantCapacity: number
    
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      The record ID of the book
    ]]
    id: string
    
    isScroll: boolean
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this book (can be nil)
    ]]
    mwscript: string
    
    --[[
      Name of the book
    ]]
    name: string
    
    --[[
      The skill that this book teaches. See @{openmw.core#SKILL}
    ]]
    skill: string
    
    --[[
      The text content of the book
    ]]
    text: string
    
    value: number
    
    weight: number
    
  end
  interface BirthSigns
    --[[
      Returns a read-only @{#BirthSignRecord}
    ]]
    record: function(
      recordId: string
    ): types.BirthSignRecord
    
    --[[
      A read-only list of all @{#BirthSignRecord}s in the world database.
      Implements [iterables#List](iterables.html#List) of #BirthSignRecord.
      local birthSign = types.Player.birthSigns.records['birthsign id']  -- get by id
    ]]
    records: { types.BirthSignRecord }
    
  end
  interface GenderedNumber
    --[[
      Female value
    ]]
    female: number
    
    --[[
      Male value
    ]]
    male: number
    
  end
  interface PlayerJournalTextEntry
    --[[
      Number of the day this journal entry was written at.
    ]]
    day: number
    
    --[[
      Number of the day in the month this journal entry was written at.
    ]]
    dayOfMonth: number
    
    --[[
      Identifier for this journal entry line.
      Is unique only within the @{#PlayerJournalTextEntry} it belongs to.
      Has a counterpart in raw data game dialogue records at @{openmw_core#DialogueRecordInfo} held by @{openmw_core#Dialogue.journal}
    ]]
    id: string
    
    --[[
      Number of the month this journal entry was written at.
    ]]
    month: number
    
    --[[
      Quest id this journal entry is associated with. Can be nil if there is no quest associated with this entry or if journal quest sorting functionality is not available in game.
    ]]
    questId: string
    
    --[[
      Text of this journal entry.
    ]]
    text: string
    
  end
  interface PlayerJournalTopic
    --[[
      A read-only list of player's accumulated conversation lines (@{#PlayerJournalTopicEntry}) for this topic.
      Implements [iterables#list-iterable](iterables.html#list-iterable) of #PlayerJournalTopicEntry.
      -- First NPC topic line entry in the "Background" topic
      local firstBackgroundLine = types.Player.journal(player).topics["Background"].entries[1]
    ]]
    entries: { types.PlayerJournalTopicEntry }
    
    --[[
      Topic id. It's a lowercase version of name.
    ]]
    id: string
    
    --[[
      Topic name. Same as id, but with upper cases preserved.
    ]]
    name: string
    
  end
  --[[
    String id of a @{#CONTROL_SWITCH}
  ]]
  interface ControlSwitch
  end
  interface ProbeRecord
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      The record ID of the probe
    ]]
    id: string
    
    --[[
      The maximum number of uses of this probe
    ]]
    maxCondition: number
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this probe (can be nil)
    ]]
    mwscript: string
    
    --[[
      The name of the probe
    ]]
    name: string
    
    --[[
      The quality of the probe
    ]]
    quality: number
    
    value: number
    
    weight: number
    
  end
  interface CONTROL_SWITCH
    --[[
      Ability to move
    ]]
    Controls: types.ControlSwitch
    
    --[[
      Ability to attack
    ]]
    Fighting: types.ControlSwitch
    
    --[[
      Ability to jump
    ]]
    Jumping: types.ControlSwitch
    
    --[[
      Ability to change view direction
    ]]
    Looking: types.ControlSwitch
    
    --[[
      Ability to use magic
    ]]
    Magic: types.ControlSwitch
    
    --[[
      Vanity view if player doesn't touch controls for a long time
    ]]
    VanityMode: types.ControlSwitch
    
    --[[
      Ability to toggle 1st/3rd person view
    ]]
    ViewMode: types.ControlSwitch
    
  end
  --[[
    Read-only list of effects currently affecting the actor.
    -- print active effects
    for _, effect in pairs(Actor.activeEffects(self)) do
        print('Active Effect: '..effect.id..', attribute='..tostring(effect.affectedAttribute)..', skill='..tostring(effect.affectedSkill)..', magnitude='..tostring(effect.magnitude))
    end
  ]]
  interface ActorActiveEffects
    --[[
      Get a specific active effect on the actor.
    ]]
    getEffect: function(
      self: types.ActorActiveEffects,
      effectId: string, --[[effect ID]]
      extraParam: string
    ): openmw_core.ActiveEffect
    
    --[[
      Permanently modifies the magnitude of an active effect by modifying it by the provided value.
      Note that some active effect values, such as fortify attribute effects, have no practical effect of their own, and must be paired with explicitly modifying the target stat to have any effect.
    ]]
    modify: function(
      self: types.ActorActiveEffects,
      value: number,
      effectId: string, --[[effect ID]]
      extraParam: string
    )
    
    --[[
      Completely removes the active effect from the actor.
    ]]
    remove: function(
      self: types.ActorActiveEffects,
      effectId: string, --[[effect ID]]
      extraParam: string
    )
    
    --[[
      (Note that using this function will override and conflict with all other sources of this effect.
      You probably want to use @{#ActorActiveEffects.modify} instead, this function is provided for mwscript parity only)
      Permanently modifies the magnitude of an active effect to be exactly equal to the provided value.
      Note that although the modification is permanent, the magnitude will not stay equal to the value if any active spells with this effects are added/removed.
      Also see the notes on @{#ActorActiveEffects.modify}
    ]]
    set: function(
      self: types.ActorActiveEffects,
      value: number,
      effectId: string, --[[effect ID]]
      extraParam: string
    )
    
  end
  --[[
    Birth sign data record
  ]]
  interface BirthSignRecord
    --[[
      Birth sign description
    ]]
    description: string
    
    --[[
      Birth sign id
    ]]
    id: string
    
    --[[
      Birth sign name
    ]]
    name: string
    
    --[[
      A read-only list containing the ids of all spells gained from this sign.
    ]]
    spells: { string }
    
    --[[
      Birth sign texture
    ]]
    texture: string
    
  end
  --[[
    Value modification is delayed
  ]]
  interface DynamicStat
    base: number
    
    current: number
    
    modifier: number
    
  end
  interface PlayerJournal
    --[[
      A read-only list of player's accumulated journal (quest etc.) entries (@{#PlayerJournalTextEntry} elements), ordered from oldest entry to newest.
      Implements [iterables#list-iterable](iterables.html#list-iterable) of @{#PlayerJournalTextEntry}.
      -- The `firstQuestName` variable below is likely to be "a1_1_findspymaster" in vanilla MW
      local firstQuestName = types.Player.journal(player).journalTextEntries[1].questId
    ]]
    journalTextEntries: { types.PlayerJournalTextEntry }
    
    --[[
      A read-only table of player's accumulated @{#PlayerJournalTopic}s, indexed by the topic name.
      Implements [iterables#Map](iterables.html#map-iterable) of @{#PlayerJournalTopic}.
      Topic name index doesn't have to be lowercase.
      local record = types.Player.journal(player).topics["my trade"]
    ]]
    topics: { string: types.PlayerJournalTopic }
    
  end
  interface LockpickRecord
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      The record ID of the lockpick
    ]]
    id: string
    
    --[[
      The maximum number of uses of this lockpick
    ]]
    maxCondition: number
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this lockpick (can be nil)
    ]]
    mwscript: string
    
    --[[
      The name of the lockpick
    ]]
    name: string
    
    --[[
      The quality of the lockpick
    ]]
    quality: number
    
    value: number
    
    weight: number
    
  end
  --[[
    Value modification is delayed
  ]]
  interface AIStat
    --[[
      The stat's base value.
    ]]
    base: number
    
    --[[
      The actor's current ai value (read-only.)
    ]]
    modified: number
    
    --[[
      The stat's modifier.
    ]]
    modifier: number
    
  end
  interface WeaponRecord
    chopMaxDamage: number
    
    chopMinDamage: number
    
    --[[
      The enchantment ID of this weapon (can be nil)
    ]]
    enchant: string
    
    enchantCapacity: number
    
    health: number
    
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      Record id
    ]]
    id: string
    
    isMagical: boolean
    
    isSilver: boolean
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this weapon (can be nil)
    ]]
    mwscript: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
    reach: number
    
    slashMaxDamage: number
    
    slashMinDamage: number
    
    speed: number
    
    thrustMaxDamage: number
    
    thrustMinDamage: number
    
    --[[
      See @{#Weapon.TYPE}
    ]]
    type: number
    
    value: number
    
    weight: number
    
  end
  interface ArmorRecord
    --[[
      The base armor rating of this armor
    ]]
    baseArmor: number
    
    --[[
      The enchantment ID of this armor (can be nil)
    ]]
    enchant: string
    
    enchantCapacity: number
    
    health: number
    
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      Record id
    ]]
    id: string
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this armor (can be nil)
    ]]
    mwscript: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
    --[[
      See @{#Armor.TYPE}
    ]]
    type: number
    
    value: number
    
    weight: number
    
  end
  --[[
    Map from values of @{#EQUIPMENT_SLOT} to items @{openmw.core#GameObject}s
  ]]
  interface EquipmentTable
    metamethod __index: function(self: types.EquipmentTable, index: number): openmw_core.GameObject
  end
  interface PLAYERQuest
    --[[
      Sets the quest stage for the given quest, on the given player, and adds the entry to the journal, if there is an entry at the specified stage.
      Can only be used in global or player scripts.
    ]]
    addJournalEntry: function(
      self: types.PLAYERQuest,
      stage: number, --[[Quest stage]]
      actor: openmw_core.GameObject
    )
    
    --[[
      Whether the quest is finished (global and player scripts can change it).
    ]]
    finished: boolean
    
    --[[
      The quest id.
    ]]
    id: string
    
    --[[
      The quest stage (global and player scripts can change it). Changing the stage starts the quest if it wasn't started.
    ]]
    stage: number
    
    --[[
      Whether the quest is started.
    ]]
    started: boolean
    
  end
  --[[
    Value modification is delayed
  ]]
  interface AttributeStat
    --[[
      The actor's base attribute value.
    ]]
    base: number
    
    --[[
      The amount the attribute has been damaged.
    ]]
    damage: number
    
    --[[
      The actor's current attribute value (read-only.)
    ]]
    modified: number
    
    --[[
      The attribute's modifier.
    ]]
    modifier: number
    
  end
  interface PlayerJournalTopicEntry
    --[[
      Name of an NPC who is recorded in the player journal as an origin of this topic line.
    ]]
    actor: string
    
    --[[
      Identifier for this topic line.
      Is unique only within the @{#PlayerJournalTopic} it belongs to.
      Has a counterpart in raw data game dialogue records at @{openmw_core#DialogueRecordInfo} held by @{openmw_core#Dialogue.topic}
    ]]
    id: string
    
    --[[
      Text of this topic line.
    ]]
    text: string
    
  end
  interface PotionRecord
    --[[
      The effects (@{#list<openmw.core#MagicEffectWithParams>}) of the potion
    ]]
    effects: { openmw_core.MagicEffectWithParams }
    
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      Record id
    ]]
    id: string
    
    --[[
      If set, the gold value should be computed based on the effect list rather than read from the value field
    ]]
    isAutocalc: boolean
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this potion (can be nil)
    ]]
    mwscript: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
    value: number
    
    weight: number
    
  end
  interface ItemData
    --[[
      The item's current condition. Time remaining for lights (setting this to `-1` will make it last forever). Uses left for repairs, lockpicks and probes. Current health for weapons and armor.
    ]]
    condition: number
    
    --[[
      The item's current enchantment charge. Unenchanted items will always return a value of `nil`. Setting this to `nil` will reset the charge of the item.
    ]]
    enchantmentCharge: number
    
    --[[
      The recordId of the item's current soul. Items without soul will always return a value of `nil`. Setting this to `nil` will remove the soul from the item.
    ]]
    soul: string
    
  end
  interface ESM4DoorRecord
    --[[
      FormId of the door closing sound
    ]]
    closeSound: string
    
    --[[
      Record id
    ]]
    id: string
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
    --[[
      FormId of the door opening sound
    ]]
    openSound: string
    
  end
  interface MiscellaneousRecord
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      The record ID of the miscellaneous item
    ]]
    id: string
    
    isKey: boolean
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this miscellaneous item (can be nil)
    ]]
    mwscript: string
    
    --[[
      The name of the miscellaneous item
    ]]
    name: string
    
    value: number
    
    weight: number
    
  end
  interface NpcRecord
    --[[
      NPC's starting disposition
    ]]
    baseDisposition: number
    
    --[[
      The base barter gold of the NPC
    ]]
    baseGold: number
    
    --[[
      integer representing the blood type of the NPC. Used to generate the correct blood vfx.
    ]]
    bloodType: number
    
    --[[
      ID of the NPC's class (e.g. acrobat)
    ]]
    class: string
    
    --[[
      ID of the hair body part
    ]]
    hair: string
    
    --[[
      ID of the head body part
    ]]
    head: string
    
    --[[
      The record ID of the NPC
    ]]
    id: string
    
    --[[
      If true, the actor's stats will be automatically calculated based on level and class.
    ]]
    isAutocalc: boolean
    
    --[[
      whether the NPC is essential
    ]]
    isEssential: boolean
    
    --[[
      The gender setting of the NPC
    ]]
    isMale: boolean
    
    --[[
      whether the NPC respawns after death
    ]]
    isRespawning: boolean
    
    --[[
      Path to the model associated with this NPC, used for animations.
    ]]
    model: string
    
    --[[
      MWScript on this NPC (can be nil)
    ]]
    mwscript: string
    
    name: string
    
    race: string
    
    --[[
      The services of the NPC, in a table. Value is if the service is provided or not, and they are indexed by: Spells, Spellmaking, Enchanting, Training, Repair, Barter, Weapon, Armor, Clothing, Books, Ingredients, Picks, Probes, Lights, Apparatus, RepairItems, Misc, Potions, MagicItems, Travel.
    ]]
    servicesOffered: { string: boolean }
    
    --[[
      A list of @{#TravelDestination}s for this NPC.
    ]]
    travelDestinations: { types.TravelDestination }
    
  end
  interface ESM4TerminalRecord
    --[[
      Human-readable ID
    ]]
    editorId: string
    
    --[[
      Record id (Form ID)
    ]]
    id: string
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
    --[[
      Result text of the terminal record
    ]]
    resultText: string
    
    --[[
      Text body of the terminal record
    ]]
    text: string
    
  end
  interface LevelledListItem
    --[[
      Item id
    ]]
    id: string
    
    --[[
      The minimum player level at which this item can occur
    ]]
    level: number
    
  end
  --[[
    Class data record
  ]]
  interface ClassRecord
    --[[
      A read-only list containing the specialized attributes of the class.
    ]]
    attributes: { string }
    
    --[[
      Class description
    ]]
    description: string
    
    --[[
      Class id
    ]]
    id: string
    
    --[[
      True if the player can play as this class
    ]]
    isPlayable: boolean
    
    --[[
      A read-only list containing the major skills of the class.
    ]]
    majorSkills: { string }
    
    --[[
      A read-only list containing the minor skills of the class.
    ]]
    minorSkills: { string }
    
    --[[
      Class name
    ]]
    name: string
    
    --[[
      Class specialization. Either combat, magic, or stealth.
    ]]
    specialization: string
    
  end
  interface CreatureLevelledList
    --[[
      Whether the object is a CreatureLevelledList.
    ]]
    objectIsInstance: function(
      object: openmw_core.GameObject
    ): boolean
    
    --[[
      Returns the read-only @{#CreatureLevelledListRecord} of a levelled creature
    ]]
    record: function(
      objectOrRecordId: any
    ): types.CreatureLevelledListRecord
    
    --[[
      A read-only list of all @{#CreatureLevelledListRecord}s in the world database.
      Implements [iterables#List](iterables.html#List) of #CreatureLevelledListRecord.
      local record = types.CreatureLevelledList.records['example_recordid']
    ]]
    records: { types.CreatureLevelledListRecord }
    
  end
  interface StaticRecord
    --[[
      Record id
    ]]
    id: string
    
    --[[
      VFS path to the model
    ]]
    model: string
    
  end
  interface CreatureAttack
    --[[
      Maximum attack damage.
    ]]
    maxDamage: number
    
    --[[
      Minimum attack damage.
    ]]
    minDamage: number
    
  end
  interface DoorRecord
    --[[
      The sound id for door closing
    ]]
    closeSound: string
    
    --[[
      Record id
    ]]
    id: string
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this door (can be nil)
    ]]
    mwscript: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
    --[[
      The sound id for door opening
    ]]
    openSound: string
    
  end
  interface ActivatorRecord
    --[[
      Record id
    ]]
    id: string
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this activator (can be nil)
    ]]
    mwscript: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
  end
  --[[
    Race data record
    -- Get base strength for men
    strength = types.NPC.races.records[1].attributes.strength.male
  ]]
  interface RaceRecord
    --[[
      A read-only table of attribute ID to base value
    ]]
    attributes: { string: types.GenderedNumber }
    
    --[[
      Race description
    ]]
    description: string
    
    --[[
      Height values
    ]]
    height: types.GenderedNumber
    
    --[[
      Race id
    ]]
    id: string
    
    --[[
      True if this race is a beast race
    ]]
    isBeast: boolean
    
    --[[
      True if the player can pick this race in character generation
    ]]
    isPlayable: boolean
    
    --[[
      Race name
    ]]
    name: string
    
    --[[
      A map of bonus skill points by skill ID
    ]]
    skills: { string: number }
    
    --[[
      A read-only list containing the ids of all spells inherent to the race
    ]]
    spells: { string }
    
    --[[
      Weight values
    ]]
    weight: types.GenderedNumber
    
  end
  interface ContainerRecord
    --[[
      Record id
    ]]
    id: string
    
    --[[
      Whether items can be placed in the container
    ]]
    isOrganic: boolean
    
    --[[
      Whether the container respawns its contents
    ]]
    isRespawning: boolean
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this container (can be nil)
    ]]
    mwscript: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
    --[[
      capacity of this container
    ]]
    weight: number
    
  end
  --[[
    Values affect the graphic used on the level up screen, and are all reset to 0 upon level up.
  ]]
  interface SkillIncreasesForSpecializationStats
    --[[
      Number of contributions to combat specialization for the next level up.
    ]]
    combat: number
    
    --[[
      Number of contributions to magic specialization for the next level up.
    ]]
    magic: number
    
    --[[
      Number of contributions to stealth specialization for the next level up.
    ]]
    stealth: number
    
  end
  interface LightRecord
    color: openmw_util.Color
    
    duration: number
    
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      Record id
    ]]
    id: string
    
    --[[
      True if the light can be carried by actors and appears up in their inventory.
    ]]
    isCarriable: boolean
    
    --[[
      If true, the light will apply to actors and other moving objects
    ]]
    isDynamic: boolean
    
    --[[
      True if the light acts like a fire.
    ]]
    isFire: boolean
    
    isFlicker: boolean
    
    isFlickerSlow: boolean
    
    --[[
      If true, the light will reduce light instead of increasing it.
    ]]
    isNegative: boolean
    
    --[[
      If true, the light will not emit any light or sound while placed in the world. It will still work in the inventory.
    ]]
    isOffByDefault: boolean
    
    isPulse: boolean
    
    isPulseSlow: boolean
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this light (can be nil)
    ]]
    mwscript: string
    
    --[[
      Human-readable name
    ]]
    name: string
    
    radius: number
    
    --[[
      VFS path to the sound
    ]]
    sound: string
    
    value: number
    
    weight: number
    
  end
  interface RepairRecord
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      The record ID of the repair tool
    ]]
    id: string
    
    --[[
      The maximum number of uses of this repair tool
    ]]
    maxCondition: number
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this repair tool (can be nil)
    ]]
    mwscript: string
    
    --[[
      The name of the repair tool
    ]]
    name: string
    
    --[[
      The quality of the repair tool
    ]]
    quality: number
    
    value: number
    
    weight: number
    
  end
  --[[
    Values affect how much each attribute can be increased at level up, and are all reset to 0 upon level up.
  ]]
  interface SkillIncreasesForAttributeStats
    --[[
      Number of contributions to agility for the next level up.
    ]]
    agility: number
    
    --[[
      Number of contributions to endurance for the next level up.
    ]]
    endurance: number
    
    --[[
      Number of contributions to intelligence for the next level up.
    ]]
    intelligence: number
    
    --[[
      Number of contributions to luck for the next level up.
    ]]
    luck: number
    
    --[[
      Number of contributions to personality for the next level up.
    ]]
    personality: number
    
    --[[
      Number of contributions to speed for the next level up.
    ]]
    speed: number
    
    --[[
      Number of contributions to strength for the next level up.
    ]]
    strength: number
    
    --[[
      Number of contributions to willpower for the next level up.
    ]]
    willpower: number
    
  end
  interface ClothingRecord
    --[[
      The enchantment ID of this clothing (can be nil)
    ]]
    enchant: string
    
    enchantCapacity: number
    
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      Record id
    ]]
    id: string
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this clothing (can be nil)
    ]]
    mwscript: string
    
    --[[
      Name of the clothing
    ]]
    name: string
    
    --[[
      See @{#Clothing.TYPE}
    ]]
    type: number
    
    value: number
    
    weight: number
    
  end
  --[[
    Value modification is delayed
  ]]
  interface SkillStat
    --[[
      The NPC's base skill value.
    ]]
    base: number
    
    --[[
      The amount the skill has been damaged.
    ]]
    damage: number
    
    --[[
      The NPC's current skill value (read-only.)
    ]]
    modified: number
    
    --[[
      The skill's modifier.
    ]]
    modifier: number
    
    --[[
      [0-1] The NPC's skill progress.
    ]]
    progress: number
    
  end
  interface ApparatusRecord
    --[[
      VFS path to the icon
    ]]
    icon: string
    
    --[[
      The record ID of the apparatus
    ]]
    id: string
    
    --[[
      VFS path to the model
    ]]
    model: string
    
    --[[
      MWScript on this apparatus (can be nil)
    ]]
    mwscript: string
    
    --[[
      The name of the apparatus
    ]]
    name: string
    
    --[[
      The quality of the apparatus
    ]]
    quality: number
    
    --[[
      The type of apparatus. See @{#Apparatus.TYPE}
    ]]
    type: number
    
    value: number
    
    weight: number
    
  end
  --[[
    Value modification is delayed
  ]]
  interface LevelStat
    --[[
      The actor's current level.
    ]]
    current: number
    
    --[[
      The NPC's level progress.
    ]]
    progress: number
    
    --[[
      The NPC's attribute contributions towards the next level up. Values affect how much each attribute can be increased at level up.
    ]]
    skillIncreasesForAttribute: types.SkillIncreasesForAttributeStats
    
    --[[
      The NPC's attribute contributions towards the next level up. Values affect the graphic used on the level up screen.
    ]]
    skillIncreasesForSpecialization: types.SkillIncreasesForSpecializationStats
    
  end
  interface PLAYER is NPC
    --[[
      Values that can be used with getControlSwitch/setControlSwitch.
    ]]
    CONTROL_SWITCH: types.CONTROL_SWITCH
    
    --[[
      Available @{#OFFENSE_TYPE_IDS} values.
      Used in `I.Crimes.commitCrime`.
    ]]
    OFFENSE_TYPE: types.OFFENSE_TYPE_IDS
    
    --[[
      Adds a topic to the list of ones known by the player, so that it can be used in dialogue with actors who can talk about that topic.
      -- Add topic to the list of known ones, in a player script
      self.type.addTopic(self, "Some Work")
    ]]
    addTopic: function(
      player: openmw_core.GameObject,
      string: any
    )
    
    --[[
      @{#NPC}
    ]]
    baseType: NPC
    
    --[[
      @{#BirthSigns}: Birth Sign Data
    ]]
    birthSigns: types.BirthSigns
    
    getBirthSign: function(
      player: openmw_core.GameObject
    ): string
    
    --[[
      Get state of a control switch.
      I.e. is the player able to move/fight/jump/etc.
    ]]
    getControlSwitch: function(
      player: openmw_core.GameObject,
      key: types.ControlSwitch
    ): boolean
    
    --[[
      Returns the bounty or crime level of the player
    ]]
    getCrimeLevel: function(
      player: openmw_core.GameObject
    ): number
    
    --[[
      Whether the character generation for this player is finished.
    ]]
    isCharGenFinished: function(
      player: openmw_core.GameObject
    ): boolean
    
    --[[
      Whether teleportation for this player is enabled.
    ]]
    isTeleportingEnabled: function(
      player: openmw_core.GameObject
    ): boolean
    
    --[[
      Returns @{#PlayerJournal}, which contains the read-only access to journal text data accumulated by the player.
      Not the same as @{openmw_core#Dialogue.journal} which holds raw game records: with placeholders for dynamic variables and no player-specific info.
      -- Get text of the 1st journal entry player made
      local entryText = types.Player.journal(player).journalTextEntries[1].text
    ]]
    journal: function(
      player: openmw_core.GameObject
    ): types.PlayerJournal
    
    --[[
      Whether the object is a player.
    ]]
    objectIsInstance: function(
      object: openmw_core.GameObject
    ): boolean
    
    --[[
      Returns a list containing quests @{#PLAYERQuest} for the specified player, indexed by quest ID.
      -- Get stage of a specific quest
      stage = types.Player.quests(player)["ms_fargothring"].stage
    ]]
    quests: function(
      player: openmw_core.GameObject
    ): { types.PLAYERQuest }
    
    --[[
      Send an event to menu scripts.
    ]]
    sendMenuEvent: function(
      player: openmw_core.GameObject,
      eventName: string,
      eventData: any
    )
    
    --[[
      Can be used only in global scripts.
      Note that this does not update the player's spells.
    ]]
    setBirthSign: function(
      player: openmw_core.GameObject,
      recordOrId: any
    )
    
    --[[
      Set state of a control switch.
      I.e. forbid or allow the player to move/fight/jump/etc.
      Can be used only in global or player scripts.
    ]]
    setControlSwitch: function(
      player: openmw_core.GameObject,
      key: types.ControlSwitch, --[[Control type (see @{openmw.types#CONTROL_SWITCH})]]
      value: boolean
    )
    
    --[[
      Sets the bounty or crime level of the player, may only be used in global scripts
    ]]
    setCrimeLevel: function(
      player: openmw_core.GameObject,
      crimeLevel: number
    )
    
    --[[
      Enables or disables teleportation for this player.
    ]]
    setTeleportingEnabled: function(
      player: openmw_core.GameObject,
      state: boolean
    )
    
  end
  --[[
    @{#Activator} functions
  ]]
  Activator: Activator
  
  --[[
    Common @{#Actor} functions for Creature, NPC, and Player.
  ]]
  Actor: Actor
  
  --[[
    @{#Apparatus} functions
  ]]
  Apparatus: Apparatus
  
  --[[
    @{#Armor} functions
  ]]
  Armor: Armor
  
  --[[
    @{#Book} functions
  ]]
  Book: Book
  
  --[[
    @{#Clothing} functions
  ]]
  Clothing: Clothing
  
  --[[
    @{#Container} functions
  ]]
  Container: Container
  
  --[[
    @{#Creature} functions
  ]]
  Creature: Creature
  
  --[[
    @{#Door} functions
  ]]
  Door: Door
  
  --[[
    Functions for @{#ESM4Activator} objects
  ]]
  ESM4Activator: ESM4Activator
  
  --[[
    Functions for @{#ESM4Ammunition} objects
  ]]
  ESM4Ammunition: ESM4Ammunition
  
  --[[
    Functions for @{#ESM4Armor} objects
  ]]
  ESM4Armor: ESM4Armor
  
  --[[
    Functions for @{#ESM4Book} objects
  ]]
  ESM4Book: ESM4Book
  
  --[[
    Functions for @{#ESM4Clothing} objects
  ]]
  ESM4Clothing: ESM4Clothing
  
  --[[
    Functions for @{#ESM4Door} objects
  ]]
  ESM4Door: ESM4Door
  
  --[[
    Functions for @{#ESM4Flora} objects
  ]]
  ESM4Flora: ESM4Flora
  
  --[[
    Functions for @{#ESM4Ingredient} objects
  ]]
  ESM4Ingredient: ESM4Ingredient
  
  --[[
    Functions for @{#ESM4ItemMod} objects
  ]]
  ESM4ItemMod: ESM4ItemMod
  
  --[[
    Functions for @{#ESM4Light} objects
  ]]
  ESM4Light: ESM4Light
  
  --[[
    Functions for @{#ESM4Miscellaneous} objects
  ]]
  ESM4Miscellaneous: ESM4Miscellaneous
  
  --[[
    Functions for @{#ESM4MovableStatic} objects
  ]]
  ESM4MovableStatic: ESM4MovableStatic
  
  --[[
    Functions for @{#ESM4Potion} objects
  ]]
  ESM4Potion: ESM4Potion
  
  --[[
    Functions for @{#ESM4Static} objects
  ]]
  ESM4Static: ESM4Static
  
  --[[
    Functions for @{#ESM4StaticCollection} objects
  ]]
  ESM4StaticCollection: ESM4StaticCollection
  
  --[[
    Functions for @{#ESM4Terminal} objects
  ]]
  ESM4Terminal: ESM4Terminal
  
  --[[
    Functions for @{#ESM4Weapon} objects
  ]]
  ESM4Weapon: ESM4Weapon
  
  --[[
    @{#Ingredient} functions
  ]]
  Ingredient: Ingredient
  
  --[[
    @{#Item} functions (all items that can be placed to an inventory or container)
  ]]
  Item: Item
  
  --[[
    @{#CreatureLevelledList} functions
  ]]
  LevelledCreature: types.CreatureLevelledList
  
  --[[
    @{#Light} functions
  ]]
  Light: Light
  
  --[[
    @{#LOCKABLE} functions
  ]]
  Lockable: LOCKABLE
  
  --[[
    @{#Lockpick} functions
  ]]
  Lockpick: Lockpick
  
  --[[
    Functions for @{#Miscellaneous} objects
  ]]
  Miscellaneous: Miscellaneous
  
  --[[
    @{#NPC} functions
  ]]
  NPC: NPC
  
  --[[
    @{#PLAYER} functions
  ]]
  Player: types.PLAYER
  
  --[[
    @{#Potion} functions
  ]]
  Potion: Potion
  
  --[[
    @{#Probe} functions
  ]]
  Probe: Probe
  
  --[[
    @{#Repair} functions
  ]]
  Repair: Repair
  
  --[[
    Functions for @{#Static} objects
  ]]
  Static: Static
  
  --[[
    @{#Weapon} functions
  ]]
  Weapon: Weapon
  
end
return types