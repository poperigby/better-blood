# Better Blood

### Blood Type Schema

Your blood type definitions go in a Lua file in `scripts/better_blood/blood_types/<name>.lua`. The tables will be merged at runtime, so you can have as many blood type definition files as you like.

```lua
local blood_types = {
    my_blood_type = {
        {
            -- String: A human friendly name for this type of actor
            name = "...", 

            -- String: A pattern to match editor IDs that this blood type will be applied to
            -- Uses Lua patterns: https://www.lua.org/pil/20.2.html
            pattern = "...",

            -- Boolean: Whether the actor is a creature or not (default: true)
            is_creature = false,

            -- Integer 0-1000: A priority. 0 is the highest priority, and 1000 is the lowest.
            -- Higher priority matches will override the blood type of lower priority matches
            -- (default: 900)
            priority = 1000,
        }
    }
}
```

### Blood Type Textures

Blood type textures should be stored in `textures/better_blood/` as `<blood type>.dds`. Textures will automatically be loaded for their respective blood type, as defined in a Lua file. For example, if you've defined the `insect` blood type in a Lua file in `scripts/better_blood/blood_types/my_bloodtypes.yaml`, `textures/better_blood/insect.dds` will be loaded. An error will be thrown if the blood texture can't be found.
