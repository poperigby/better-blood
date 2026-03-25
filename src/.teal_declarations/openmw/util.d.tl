--[[
  Defines utility functions and classes like 3D vectors, that don't depend on the game world.
  local util = require('openmw.util')
]]

local record util
  interface Transform
    --[[
      Combine transforms (will apply in reverse order)
    ]]
    metamethod __mul: function(
      self: util.Transform,
      t: util.Transform
    ): util.Transform
    
    --[[
      Apply transform to a vector
    ]]
    apply: function(
      self: util.Transform,
      v: util.Vector3
    ): util.Vector3
    
    --[[
      Get Euler angles for XZ rotation order (pitch and yaw; radians)
    ]]
    getAnglesXZ: function(
      self: util.Transform
    ): number, --[[pitch (rotation around X axis)]]
      number
    
    --[[
      Get Euler angles for ZYX rotation order (radians)
    ]]
    getAnglesZYX: function(
      self: util.Transform
    ): number, --[[rotation around Z axis (first rotation)]]
      number, --[[rotation around Y axis (second rotation)]]
      number
    
    --[[
      Get pitch angle (radians)
    ]]
    getPitch: function(
      self: util.Transform
    ): number
    
    --[[
      Get yaw angle (radians)
    ]]
    getYaw: function(
      self: util.Transform
    ): number
    
    --[[
      Returns the inverse transform.
    ]]
    inverse: function(
      self: util.Transform
    ): util.Transform
    
  end
  --[[
    Color in RGBA format.
    All of the component values are in the range [0, 1].
  ]]
  interface Color
    --[[
      Alpha (transparency) component
    ]]
    a: number
    
    --[[
      Converts the color into a HEX string.
    ]]
    asHex: function(
      self: util.Color
    ): string
    
    --[[
      Returns a Vector3 with RGB components of the Color.
    ]]
    asRgb: function(
      self: util.Color
    ): util.Vector3
    
    --[[
      Returns a Vector4 with RGBA components of the Color.
    ]]
    asRgba: function(
      self: util.Color
    ): util.Vector4
    
    --[[
      Blue component
    ]]
    b: number
    
    --[[
      Green component
    ]]
    g: number
    
    --[[
      Red component
    ]]
    r: number
    
  end
  --[[
    Immutable 4D vector.
    v = util.vector4(3, 4, 5, 6)
    v.x, v.y, v.z, v.w  -- 3.0, 4.0, 5.0, 6.0
    str(v)           -- "(3.0, 4.0, 5.0, 6.0)"
    v:length()       -- length
    v:length2()      -- square of the length
    v:normalize()    -- normalized vector
    v1:dot(v2)       -- dot product (returns a number)
    v1 * v2          -- dot product (returns a number)
    v1 + v2          -- vector addition
    v1 - v2          -- vector subtraction
    v1 * x           -- multiplication by a number
    v1 / x           -- division by a number
    v1.zyz, v1.wwwx  -- swizzle with standard fields
    v1.w1, v1.z000   -- swizzle with 0/1 constant
    v1['000w']       -- swizzle with 0/1 constant starting with 0 or 1
  ]]
  interface Vector4
    metamethod __add: function(
      self: util.Vector4,
      v: util.Vector4
    ): util.Vector4
    
    metamethod __div: function(
      self: util.Vector4,
      k: number
    ): util.Vector4
    
    metamethod __mul: function(
      self: util.Vector4,
      k: number
    ): util.Vector4
    
    metamethod __sub: function(
      self: util.Vector4,
      v: util.Vector4
    ): util.Vector4
    
    __tostring: function(
      self: util.Vector4
    ): string
    
    --[[
      Dot product.
    ]]
    dot: function(
      self: util.Vector4,
      v: util.Vector4
    ): number
    
    --[[
      Element-wise division
    ]]
    ediv: function(
      self: util.Vector4,
      v: util.Vector4
    ): util.Vector4
    
    --[[
      Element-wise multiplication
    ]]
    emul: function(
      self: util.Vector4,
      v: util.Vector4
    ): util.Vector4
    
    --[[
      Length of the vector
    ]]
    length: function(
      self: util.Vector4
    ): number
    
    --[[
      Square of the length of the vector
    ]]
    length2: function(
      self: util.Vector4
    ): number
    
    --[[
      Normalizes vector.
      It doesn't change the original vector.
    ]]
    normalize: function(
      self: util.Vector4
    ): util.Vector4, --[[normalized vector]]
      number
    
    w: number
    
    x: number
    
    --[[
      swizzle support, any combination of fields can be used to construct a new vector including the 0/1 constants
    ]]
    xyzw01: string
    
    y: number
    
    z: number
    
  end
  --[[
    Immutable 2D vector
    v = util.vector2(3, 4)
    v.x, v.y       -- 3.0, 4.0
    str(v)         -- "(3.0, 4.0)"
    v:length()     -- 5.0    length
    v:length2()    -- 25.0   square of the length
    v:normalize()  -- vector2(3/5, 4/5)
    v:rotate(radians)    -- rotate counterclockwise (returns rotated vector)
    v1:dot(v2)     -- dot product (returns a number)
    v1 * v2        -- dot product
    v1 + v2        -- vector addition
    v1 - v2        -- vector subtraction
    v1 * x         -- multiplication by a number
    v1 / x         -- division by a number
    v1.xx, v1.xyx  -- swizzle with standard fields
    v1.y1y, v1.x00 -- swizzle with 0/1 constant
    v1['0xy']      -- swizzle with 0/1 constant starting with 0 or 1
  ]]
  interface Vector2
    metamethod __add: function(
      self: util.Vector2,
      v: util.Vector2
    ): util.Vector2
    
    metamethod __div: function(
      self: util.Vector2,
      k: number
    ): util.Vector2
    
    metamethod __mul: function(
      self: util.Vector2,
      k: number
    ): util.Vector2
    
    metamethod __sub: function(
      self: util.Vector2,
      v: util.Vector2
    ): util.Vector2
    
    --[[
      Dot product.
    ]]
    dot: function(
      self: util.Vector2,
      v: util.Vector2
    ): number
    
    --[[
      Element-wise division
    ]]
    ediv: function(
      self: util.Vector2,
      v: util.Vector2
    ): util.Vector2
    
    --[[
      Element-wise multiplication
    ]]
    emul: function(
      self: util.Vector2,
      v: util.Vector2
    ): util.Vector2
    
    --[[
      Length of the vector.
    ]]
    length: function(
      self: util.Vector2
    ): number
    
    --[[
      Square of the length of the vector.
    ]]
    length2: function(
      self: util.Vector2
    ): number
    
    --[[
      Normalizes vector.
      It doesn't change the original vector.
    ]]
    normalize: function(
      self: util.Vector2
    ): util.Vector2, --[[normalized vector]]
      number
    
    --[[
      Rotates 2D vector clockwise.
    ]]
    rotate: function(
      self: util.Vector2,
      angle: number
    ): util.Vector2
    
    x: number
    
    --[[
      swizzle support, any combination of fields can be used to construct a new vector including the 0/1 constants
    ]]
    xy01: string
    
    y: number
    
  end
  --[[
    Immutable 3D vector
    v = util.vector3(3, 4, 5)
    v.x, v.y, v.z  -- 3.0, 4.0, 5.0
    str(v)         -- "(3.0, 4.0, 4.5)"
    v:length()     -- length
    v:length2()    -- square of the length
    v:normalize()  -- normalized vector
    v1:dot(v2)     -- dot product (returns a number)
    v1 * v2        -- dot product (returns a number)
    v1:cross(v2)   -- cross product (returns a vector)
    v1 ^ v2        -- cross product (returns a vector)
    v1 + v2        -- vector addition
    v1 - v2        -- vector subtraction
    v1 * x         -- multiplication by a number
    v1 / x         -- division by a number
    v1.zyz, v1.yx  -- swizzle with standard fields
    v1.w1y, v1.z0z -- swizzle with 0/1 constant
    v1['0xy']      -- swizzle with 0/1 constant starting with 0 or 1
  ]]
  interface Vector3
    metamethod __add: function(
      self: util.Vector3,
      v: util.Vector3
    ): util.Vector3
    
    metamethod __div: function(
      self: util.Vector3,
      k: number
    ): util.Vector3
    
    metamethod __mul: function(
      self: util.Vector3,
      k: number
    ): util.Vector3
    
    metamethod __sub: function(
      self: util.Vector3,
      v: util.Vector3
    ): util.Vector3
    
    __tostring: function(
      self: util.Vector3
    ): string
    
    --[[
      Cross product.
    ]]
    cross: function(
      self: util.Vector3,
      v: util.Vector3
    ): util.Vector3
    
    --[[
      Dot product.
    ]]
    dot: function(
      self: util.Vector3,
      v: util.Vector3
    ): number
    
    --[[
      Element-wise division
    ]]
    ediv: function(
      self: util.Vector3,
      v: util.Vector3
    ): util.Vector3
    
    --[[
      Element-wise multiplication
    ]]
    emul: function(
      self: util.Vector3,
      v: util.Vector3
    ): util.Vector3
    
    --[[
      Length of the vector
    ]]
    length: function(
      self: util.Vector3
    ): number
    
    --[[
      Square of the length of the vector
    ]]
    length2: function(
      self: util.Vector3
    ): number
    
    --[[
      Normalizes vector.
      It doesn't change the original vector.
    ]]
    normalize: function(
      self: util.Vector3
    ): util.Vector3, --[[normalized vector]]
      number
    
    x: number
    
    --[[
      swizzle support, any combination of fields can be used to construct a new vector including the 0/1 constants
    ]]
    xyz01: string
    
    y: number
    
    z: number
    
  end
  interface TRANSFORM
    --[[
      Empty transform.
    ]]
    identity: util.Transform
    
    --[[
      Movement by given vector.
      -- Accepts either 3 numbers or a 3D vector
      util.transform.move(x, y, z)
      util.transform.move(util.vector3(x, y, z))
    ]]
    move: function(
      offset: util.Vector3
    ): util.Transform
    
    --[[
      Rotation around a vector (counterclockwise if the vector points to us).
    ]]
    rotate: function(
      angle: number,
      axis: util.Vector3
    ): util.Transform
    
    --[[
      X-axis rotation (equivalent to `rotate(angle, vector3(-1, 0, 0))`).
    ]]
    rotateX: function(
      angle: number
    ): util.Transform
    
    --[[
      Y-axis rotation (equivalent to `rotate(angle, vector3(0, -1, 0))`).
    ]]
    rotateY: function(
      angle: number
    ): util.Transform
    
    --[[
      Z-axis rotation (equivalent to `rotate(angle, vector3(0, 0, -1))`).
    ]]
    rotateZ: function(
      angle: number
    ): util.Transform
    
    --[[
      Scale transform.
      -- Accepts either 3 numbers or a 3D vector
      util.transform.scale(x, y, z)
      util.transform.scale(util.vector3(x, y, z))
    ]]
    scale: function(
      scaleX: number,
      scaleY: number,
      scaleZ: number
    ): util.Transform
    
  end
  --[[
    Immutable box.
  ]]
  interface Box
    --[[
      The center of the box
    ]]
    center: util.Vector3
    
    --[[
      The half sizes of the box along each axis
    ]]
    halfSize: util.Vector3
    
    --[[
      A transformation which encapsulates the boxes center pointer (translation), half sizes (scale), and rotation.
    ]]
    transform: util.Transform
    
    --[[
      Table of the 8 vertices which comprise the box, taking rotation into account
    ]]
    vertices: table
    
  end
  --[[
    Methods for creating #Color values from different formats.
  ]]
  interface COLOR
    --[[
      Creates a Color from comma-separated string (in RGB or RGBA order, spaces are ignored)
      local color = util.color.commaString('255,0,0') -- red color
    ]]
    commaString: function(
      str: string
    ): util.Color
    
    --[[
      Parses a hex color string into a Color.
    ]]
    hex: function(
      hex: string
    ): util.Color
    
    --[[
      Creates a Color from RGB format.
      Equivalent to calling util.rgba with a = 1.
    ]]
    rgb: function(
      r: number,
      g: number,
      b: number
    ): util.Color
    
    --[[
      Creates a Color from RGBA format
    ]]
    rgba: function(
      r: number,
      g: number,
      b: number,
      a: number
    ): util.Color
    
  end
  --[[
    Bitwise And (supports any number of arguments).
  ]]
  bitAnd: function(
    A: number, --[[First argument (integer).]]
    B: number
  ): number
  
  --[[
    Bitwise inversion.
  ]]
  bitNot: function(
    A: number
  ): number
  
  --[[
    Bitwise Or (supports any number of arguments).
  ]]
  bitOr: function(
    A: number, --[[First argument (integer).]]
    B: number
  ): number
  
  --[[
    Bitwise Xor (supports any number of arguments).
  ]]
  bitXor: function(
    A: number, --[[First argument (integer).]]
    B: number
  ): number
  
  --[[
    Creates a new Box from a given transformation.
    Boxes are immutable and can not be changed after creation.
    -- Creates a 1x1x1 length box centered at the origin
    util.box(util.transform.scale(util.vector3(0.5, 0.5, 0.5)))
  ]]
  box: function(
    transform: util.Transform
  ): util.Box
  
  --[[
    Limits given value to the interval [`from`, `to`].
  ]]
  clamp: function(
    value: number,
    from: number,
    to: number
  ): number
  
  --[[
    Methods for creating #Color values from different formats.
  ]]
  color: util.COLOR
  
  --[[
    Parses Lua code from string and returns as a function.
  ]]
  loadCode: function(
    code: string, --[[Lua code.]]
    table: table
  ): function
  
  --[[
    Makes a table read only.
  ]]
  makeReadOnly: function(
    table: table
  ): table
  
  --[[
    Makes a table read only and overrides `__index` with the strict version that throws an error if the key is not found.
  ]]
  makeStrictReadOnly: function(
    table: table
  ): table
  
  --[[
    Adds `2pi*k` and puts the angle in range `[-pi, pi]`.
  ]]
  normalizeAngle: function(
    angle: number
  ): number
  
  --[[
    Remaps the value from one range to another.
    local util = require('openmw.util')
    local newValue = util.remap(3, 0, 10, 0, 100)
    print(newValue) -- prints 30
  ]]
  remap: function(
    value: number,
    min: number,
    max: number,
    newMin: number,
    newMax: number
  ): number
  
  --[[
    Rounds the given value to the nearest whole number.
    local util = require('openmw.util')
    local roundedValue = util.round(3.141592)
    print(roundedValue) -- prints 3
  ]]
  round: function(
    value: number
  ): number
  
  --[[
    3D transforms (scale/move/rotate) that can be applied to 3D vectors.
    Several transforms can be combined and applied to a vector using multiplication.
    Combined transforms apply in reverse order (from right to left).
    local util = require('openmw.util')
    local trans = util.transform
    local fromActorSpace = trans.move(actor.position) * trans.rotateZ(actor.rotation:getYaw())
    
    -- rotation is applied first, movement is second
    local posBehindActor = fromActorSpace * util.vector3(0, -100, 0)
    
    -- equivalent to trans.rotateZ(-actor.rotation:getYaw()) * trans.move(-actor.position)
    local toActorSpace = fromActorSpace:inverse()
    local relativeTargetPos = toActorSpace * target.position
    local deltaAngle = math.atan2(relativeTargetPos.y, relativeTargetPos.x)
  ]]
  transform: util.TRANSFORM
  
  --[[
    Creates a new 2D vector.
    Vectors are immutable and can not be changed after creation.
  ]]
  vector2: function(
    x: number,
    y: number
  ): util.Vector2
  
  --[[
    Creates a new 3D vector.
    Vectors are immutable and can not be changed after creation.
  ]]
  vector3: function(
    x: number,
    y: number,
    z: number
  ): util.Vector3
  
  --[[
    Creates a new 4D vector.
    Vectors are immutable and can not be changed after creation.
  ]]
  vector4: function(
    x: number,
    y: number,
    z: number,
    w: number
  ): util.Vector4
  
end
return util