--[[
  Basic combat interface
  local I = require('openmw.interfaces')
  
  I.Combat.addOnHitHandler(function(attack)
     -- Adds fatigue loss when hit by draining fatigue when taking health damage
     if attack.damage.health and not attack.damage.fatigue then
         local strengthFactor = Actor.stats.attributes.strength(self).modified / 100 * 0.66
         local enduranceFactor = Actor.stats.attributes.endurance(self).modified / 100 * 0.34
         local factor = 1 - math.min(strengthFactor + enduranceFactor, 1)
         if factor > 0 then
             attack.damage.fatigue = attack.damage.health * factor
         end
     end
  end)
]]

local type openmw_core = require("openmw.core")
local type openmw_self = require("openmw.self")
local type openmw_types = require("openmw.types")
local type openmw_util = require("openmw.util")
local record Combat
  --[[
    Table of possible attack source types
  ]]
  interface AttackSourceType
    Magic: string
    
    Melee: string
    
    Ranged: string
    
    Unspecified: string
    
  end
  interface AttackInfo
    --[[
      (Optional) Ammo record ID
    ]]
    ammo: string
    
    --[[
      (Optional) Attacking actor
    ]]
    attacker: openmw_types.Actor
    
    --[[
      A table mapping a stat name (health, fatigue, or magicka) to a number. For example, {health = 50, fatigue = 10} will cause 50 damage to health and 10 to fatigue (before adjusting for armor and difficulty). This field is ignored for failed attacks.
    ]]
    damage: table
    
    --[[
      (Optional) Where on the victim the attack is landing. Used to spawn blood effects. Blood effects are skipped if nil.
    ]]
    hitPos: openmw_util.Vector3
    
    --[[
      What class of attack this is.
    ]]
    sourceType: Combat.AttackSourceType
    
    --[[
      A number between 0 and 1 representing the attack strength. This field is ignored for failed attacks.
    ]]
    strength: number
    
    --[[
      Whether the attack was successful or not.
    ]]
    successful: boolean
    
    --[[
      (Optional) Attack variant if applicable. For melee attacks this represents chop vs thrust vs slash. For unarmed creatures this implies which of its 3 possible attacks were used. For other attacks this field can be ignored.
    ]]
    type: openmw_self.ATTACK_TYPE
    
    --[[
      (Optional) Attacking weapon
    ]]
    weapon: openmw_types.Weapon
    
  end
  interface Attack
  end
  --[[
    @{#AttackSourceType}
  ]]
  ATTACK_SOURCE_TYPES: Combat.AttackSourceType
  
  --[[
    Add new onHit handler for this actor
    If `handler(attack)` returns false, other handlers for
    the call will be skipped.
    Where attack is the same @{#AttackInfo} passed to #Combat.onHit
  ]]
  addOnHitHandler: function(
    handler: function
  )
  
  --[[
    Calculates the character's armor rating and adjusts damage accordingly.
    Note that this function only adjusts the number, use #Combat.applyArmor
    to include other side effects.
  ]]
  adjustDamageForArmor: function(
    Damage: number, --[[The numeric damage to adjust]]
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Calculates a difficulty multiplier based on the current difficulty settings
    and adjusts damage accordingly.
    Has no effect if both this actor and the
    attacker are NPCs, or if both are Players.
  ]]
  adjustDamageForDifficulty: function(
    attack: Combat.Attack, --[[The attack to adjust]]
    defendant: openmw_core.GameObject
  )
  
  --[[
    Applies this character's armor to the attack.
    Adjusts damage, reduces item
    condition accordingly, progresses armor skill, and plays the armor appropriate
    hit sound.
  ]]
  applyArmor: function(
    attack: Combat.Attack
  )
  
  --[[
    Computes this character's armor rating.
    Note that this interface function is read by the engine to update the UI.
    This function can still be overridden same as any other interface, but must not call any functions or interfaces that modify anything.
  ]]
  getArmorRating: function(
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Computes this item's armor skill.
    You can override this to return any skill you wish (including non-armor skills, if you so wish).
    Note that this interface function is read by the engine to update the UI.
    This function can still be overridden same as any other interface, but must not call any functions or interfaces that modify anything.
  ]]
  getArmorSkill: function(
    item: openmw_core.GameObject
  ): string
  
  --[[
    Computes the effective armor rating of a single piece of @{openmw.types#Armor}, adjusted for skill and item condition
  ]]
  getEffectiveArmorRating: function(
    item: openmw_core.GameObject, --[[The item]]
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Computes the armor rating of a single piece of @{openmw.types#Armor}, adjusted for skill
    Note that this interface function is read by the engine to update the UI.
    This function can still be overridden same as any other interface, but must not call any functions or interfaces that modify anything.
  ]]
  getSkillAdjustedArmorRating: function(
    item: openmw_core.GameObject, --[[The item]]
    actor: openmw_core.GameObject
  ): number
  
  --[[
    Hit this actor.
    Normally called as Hit event from the attacking actor, with the same parameters.
  ]]
  onHit: function(
    attackInfo: Combat.AttackInfo
  )
  
  --[[
    Picks a random armor slot and returns the item equipped in that slot.
    Used to pick which armor to damage / skill to increase when hit during combat.
  ]]
  pickRandomArmor: function(
    actor: openmw_core.GameObject
  ): openmw_core.GameObject
  
  --[[
    Spawns a random blood effect at the given position
  ]]
  spawnBloodEffect: function(
    position: openmw_util.Vector3
  )
  
  --[[
    Interface version
  ]]
  version: number
  
end
return Combat