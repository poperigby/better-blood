--[[
  `openmw_aux.util` defines utility functions that are implemented in Lua rather than in C++.
  Implementation can be found in `resources/vfs/openmw_aux/util.lua`.
  local aux_util = require('openmw_aux.util')
]]

local record util
  --[[
    Iterates over an array of event handlers, calling each in turn until one returns false.
  ]]
  callEventHandlers: function(
    handlers: table, --[[An optional array of handlers to invoke]]
    ...: any
  ): any
  
  --[[
    Iterates over an array of event handler arrays, passing each to `aux_util.callEventHandlers` until the event is handled.
  ]]
  callMultipleEventHandlers: function(
    handlers: table, --[[An array of event handler arrays]]
    ...: any
  ): any
  
  --[[
    Works like `tostring` but also shows the content of tables.
  ]]
  deepToString: function(
    value: any, --[[The value to convert to a string]]
    maxDepth: number
  )
  
  --[[
    Finds the element in the array given the lowest score by `scoreFn`.
    -- Find the nearest NPC
    local nearestNPC, distToNPC = aux_util.findMinScore(
        nearby.actors,
        function(actor)
            return actor.type == types.NPC and (self.position - actor.position):length()
        end)
  ]]
  findMinScore: function(
    array: table, --[[Any array]]
    scoreFn: function
  ): any, --[[element The element given the lowest score]]
    number, --[[score The score given to the chosen element by `scoreFn`]]
    number
  
  --[[
    Computes `scoreFn` for each element of `array` and filters out elements with false and nil results.
    -- Find all NPCs in `nearby.actors`
    local NPCs = aux_util.mapFilter(
        nearby.actors,
        function(actor) return actor.type == types.NPC end)
  ]]
  mapFilter: function(
    array: table, --[[Any array]]
    scoreFn: function
  ): table, --[[Output array]]
    table
  
  --[[
    Filters and sorts `array` by the scores calculated by `scoreFn`.
    The same as `aux_util.mapFilter`, but the result is sorted.
    -- Find all NPCs in `nearby.actors` and sort them by distances
    local NPCs, distances = aux_util.mapFilterSort(
        nearby.actors,
        function(actor)
            return actor.type == types.NPC and (self.position - actor.position):length()
        end)
  ]]
  mapFilterSort: function(
    array: table, --[[Any array]]
    scoreFn: function
  ): table, --[[Output array]]
    table
  
  --[[
    Copies all key-value pairs from the input table to a new table.
  ]]
  shallowCopy: function(
    table: table
  ): table
  
end
return util