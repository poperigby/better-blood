--[[
  Provides an interface to postprocessing shaders.
  local postprocessing = require('openmw.postprocessing')
]]

local type openmw_util = require("openmw.util")
local record postprocessing
  interface Shader
    --[[
      Author of the shader
    ]]
    author: string
    
    --[[
      Description of the shader
    ]]
    description: string
    
    --[[
      Deactivate the shader.
      Has no effect if the shader is already deactivated or does not exist.
      Will not apply until the next frame.
      local vignetteShader = shader.postprocessing('vignette')
      vignetteShader:disable() -- shader will be toggled off
    ]]
    disable: function(
      self: postprocessing.Shader
    )
    
    --[[
      Enable the shader.
      Has no effect if the shader is already enabled or does
      not exist. Will not apply until the next frame.
      -- Load shader
      local vignetteShader = postprocessing.load('vignette')
      -- Toggle shader on
      vignetteShader:enable()
    ]]
    enable: function(
      self: postprocessing.Shader,
      position: number
    )
    
    --[[
      Check if the shader is enabled.
      local vignetteShader = shader.postprocessing('vignette')
      vignetteShader:enable() -- shader will be toggled on
    ]]
    isEnabled: function(
      self: postprocessing.Shader
    ): boolean
    
    --[[
      Name of the shader
    ]]
    name: string
    
    --[[
      Set a non static bool shader variable.
    ]]
    setBool: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      value: boolean
    )
    
    --[[
      Set a non static float shader variable.
    ]]
    setFloat: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      value: number
    )
    
    --[[
      Set a non static float array shader variable.
    ]]
    setFloatArray: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      array: table
    )
    
    --[[
      Set a non static integer shader variable.
    ]]
    setInt: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      value: number
    )
    
    --[[
      Set a non static integer array shader variable.
    ]]
    setIntArray: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      array: table
    )
    
    --[[
      Set a non static Vector2 shader variable.
    ]]
    setVector2: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      value: openmw_util.Vector2
    )
    
    --[[
      Set a non static Vector2 array shader variable.
    ]]
    setVector2Array: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      array: table
    )
    
    --[[
      Set a non static Vector3 shader variable.
    ]]
    setVector3: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      value: openmw_util.Vector3
    )
    
    --[[
      Set a non static Vector3 array shader variable.
    ]]
    setVector3Array: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      array: table
    )
    
    --[[
      Set a non static Vector4 shader variable.
    ]]
    setVector4: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      value: openmw_util.Vector4
    )
    
    --[[
      Set a non static Vector4 array shader variable.
      -- Setting an array
      local shader = postprocessing.load('godrays')
      -- Toggle shader on
      shader:enable()
      -- Set new array uniform which was defined with length 2
      shader:setVector4Array('myArray', { util.vector4(1,0,0,1), util.vector4(1,0,1,1) })
    ]]
    setVector4Array: function(
      self: postprocessing.Shader,
      name: string, --[[Name of uniform]]
      array: table
    )
    
    --[[
      Version of the shader
    ]]
    version: string
    
  end
  --[[
    Returns the ordered list of active shaders.
    Active shaders may change between frames.
  ]]
  getChain: function(): { postprocessing.Shader }
  
  --[[
    Load a shader and return its handle.
    -- If the shader exists and compiles, the shader will still be off by default.
    -- It must be enabled to see its effect.
    local vignetteShader = postprocessing.load('vignette')
  ]]
  load: function(
    name: string
  ): postprocessing.Shader
  
end
return postprocessing