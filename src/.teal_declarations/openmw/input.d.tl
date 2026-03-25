--[[
  Most mods should prefer to use the actions/triggers API over the direct input device methods.
  Actions have one value on each frame (resolved just before the `onFrame` engine handler),
   while Triggers don't have a value, but can occur multiple times on each frame.
  Prefer to use built-in methods of binding actions, such as the [inputBinding setting renderer](setting_renderers.html#inputbinding)
  local input = require('openmw.input')
  -- Example of Action usage
  input.registerAction {
      key = 'MyAction',
      type = input.ACTION_TYPE.Boolean,
      l10n = 'MyLocalizationContext',
      name = 'MyAction_name',
      description = 'MyAction_full_description',
      defaultValue = false,
  }
  return {
      onFrame = function()
          local myAction = input.getBooleanActionValue('MyAction')
          if (myAction) then print('My action is active!') end
      end,
  }
  -- Example of Trigger usage
  input.registerTrigger {
      key = 'MyTrigger',
      l10n = 'MyLocalizationContext',
      name = 'MyTrigger_name',
      description = 'MyTrigger_full_description',
  }
  input.registerTriggerHandler('MyTrigger', async:callback(function() print('MyTrigger') end))
]]

local type openmw_async = require("openmw.async")
local type openmw_util = require("openmw.util")
--[[
  Ids of game controller axises.
  Used as an argument in getAxisValue.
]]
global interface CONTROLLER_AXIS
  --[[
    Left stick horizontal axis (from -1 to 1)
  ]]
  LeftX: number
  
  --[[
    Left stick vertical axis (from -1 to 1)
  ]]
  LeftY: number
  
  --[[
    (DEPRECATED, use the LookLeftRight action) View direction horizontal axis (RightX by default, can be mapped to another axis in Options/Controls menu)
  ]]
  LookLeftRight: number
  
  --[[
    (DEPRECATED, use the LookUpDown action) View direction vertical axis (RightY by default, can be mapped to another axis in Options/Controls menu)
  ]]
  LookUpDown: number
  
  --[[
    (DEPRECATED, use the MoveForwardBackward action) Movement forward/backward (LeftY by default, can be mapped to another axis in Options/Controls menu)
  ]]
  MoveForwardBackward: number
  
  --[[
    (DEPRECATED, use the MoveLeftRight action) Side movement (LeftX by default, can be mapped to another axis in Options/Controls menu)
  ]]
  MoveLeftRight: number
  
  --[[
    Right stick horizontal axis (from -1 to 1)
  ]]
  RightX: number
  
  --[[
    Right stick vertical axis (from -1 to 1)
  ]]
  RightY: number
  
  --[[
    Left trigger (from 0 to 1)
  ]]
  TriggerLeft: number
  
  --[[
    Right trigger (from 0 to 1)
  ]]
  TriggerRight: number
  
end
global interface CONTROLLER_BUTTON
  A: number
  
  B: number
  
  Back: number
  
  DPadDown: number
  
  DPadLeft: number
  
  DPadRight: number
  
  DPadUp: number
  
  Guide: number
  
  LeftShoulder: number
  
  LeftStick: number
  
  Misc1: number
  
  Paddle1: number
  
  Paddle2: number
  
  Paddle3: number
  
  Paddle4: number
  
  RightShoulder: number
  
  RightStick: number
  
  Start: number
  
  Touchpad: number
  
  X: number
  
  Y: number
  
end
--[[
  (DEPRECATED, use actions with matching keys)
]]
global interface ACTION
  Activate: number
  
  AlwaysRun: number
  
  AutoMove: number
  
  Console: number
  
  CycleSpellLeft: number
  
  CycleSpellRight: number
  
  CycleWeaponLeft: number
  
  CycleWeaponRight: number
  
  GameMenu: number
  
  Inventory: number
  
  Journal: number
  
  Jump: number
  
  MoveBackward: number
  
  MoveForward: number
  
  MoveLeft: number
  
  MoveRight: number
  
  QuickKey1: number
  
  QuickKey10: number
  
  QuickKey2: number
  
  QuickKey3: number
  
  QuickKey4: number
  
  QuickKey5: number
  
  QuickKey6: number
  
  QuickKey7: number
  
  QuickKey8: number
  
  QuickKey9: number
  
  QuickKeysMenu: number
  
  QuickLoad: number
  
  QuickMenu: number
  
  QuickSave: number
  
  Run: number
  
  Screenshot: number
  
  Sneak: number
  
  ToggleDebug: number
  
  ToggleHUD: number
  
  TogglePOV: number
  
  TogglePostProcessorHUD: number
  
  ToggleSpell: number
  
  ToggleWeapon: number
  
  Use: number
  
  ZoomIn: number
  
  ZoomOut: number
  
end
--[[
  String id of a @{#CONTROL_SWITCH}
]]
global interface ControlSwitch
end
global interface ActionType
end
--[[
  Numeric id of a @{#KEY}
]]
global interface KeyCode
end
global interface KEY
  A: KeyCode
  
  Apostrophe: KeyCode
  
  B: KeyCode
  
  BackSlash: KeyCode
  
  Backspace: KeyCode
  
  C: KeyCode
  
  CapsLock: KeyCode
  
  Comma: KeyCode
  
  D: KeyCode
  
  Delete: KeyCode
  
  DownArrow: KeyCode
  
  E: KeyCode
  
  End: KeyCode
  
  Enter: KeyCode
  
  Equals: KeyCode
  
  Escape: KeyCode
  
  F: KeyCode
  
  F1: KeyCode
  
  F10: KeyCode
  
  F11: KeyCode
  
  F12: KeyCode
  
  F2: KeyCode
  
  F3: KeyCode
  
  F4: KeyCode
  
  F5: KeyCode
  
  F6: KeyCode
  
  F7: KeyCode
  
  F8: KeyCode
  
  F9: KeyCode
  
  G: KeyCode
  
  H: KeyCode
  
  Home: KeyCode
  
  I: KeyCode
  
  Insert: KeyCode
  
  J: KeyCode
  
  K: KeyCode
  
  L: KeyCode
  
  LeftAlt: KeyCode
  
  LeftArrow: KeyCode
  
  LeftBracket: KeyCode
  
  LeftCtrl: KeyCode
  
  LeftShift: KeyCode
  
  LeftSuper: KeyCode
  
  M: KeyCode
  
  Minus: KeyCode
  
  N: KeyCode
  
  NP_0: KeyCode
  
  NP_1: KeyCode
  
  NP_2: KeyCode
  
  NP_3: KeyCode
  
  NP_4: KeyCode
  
  NP_5: KeyCode
  
  NP_6: KeyCode
  
  NP_7: KeyCode
  
  NP_8: KeyCode
  
  NP_9: KeyCode
  
  NP_Delete: KeyCode
  
  NP_Divide: KeyCode
  
  NP_Enter: KeyCode
  
  NP_Minus: KeyCode
  
  NP_Multiply: KeyCode
  
  NP_Plus: KeyCode
  
  NumLock: KeyCode
  
  O: KeyCode
  
  P: KeyCode
  
  PageDown: KeyCode
  
  PageUp: KeyCode
  
  Pause: KeyCode
  
  Period: KeyCode
  
  PrintScreen: KeyCode
  
  Q: KeyCode
  
  R: KeyCode
  
  RightAlt: KeyCode
  
  RightArrow: KeyCode
  
  RightBracket: KeyCode
  
  RightCtrl: KeyCode
  
  RightShift: KeyCode
  
  RightSuper: KeyCode
  
  S: KeyCode
  
  ScrollLock: KeyCode
  
  Semicolon: KeyCode
  
  Slash: KeyCode
  
  Space: KeyCode
  
  T: KeyCode
  
  Tab: KeyCode
  
  U: KeyCode
  
  UpArrow: KeyCode
  
  V: KeyCode
  
  W: KeyCode
  
  X: KeyCode
  
  Y: KeyCode
  
  Z: KeyCode
  
  _0: KeyCode
  
  _1: KeyCode
  
  _2: KeyCode
  
  _3: KeyCode
  
  _4: KeyCode
  
  _5: KeyCode
  
  _6: KeyCode
  
  _7: KeyCode
  
  _8: KeyCode
  
  _9: KeyCode
  
end
global interface CONTROL_SWITCH
  --[[
    Ability to move
  ]]
  Controls: ControlSwitch
  
  --[[
    Ability to attack
  ]]
  Fighting: ControlSwitch
  
  --[[
    Ability to jump
  ]]
  Jumping: ControlSwitch
  
  --[[
    Ability to change view direction
  ]]
  Looking: ControlSwitch
  
  --[[
    Ability to use magic
  ]]
  Magic: ControlSwitch
  
  --[[
    Vanity view if the player doesn't touch controls for a long time
  ]]
  VanityMode: ControlSwitch
  
  --[[
    Ability to toggle 1st/3rd person view
  ]]
  ViewMode: ControlSwitch
  
end
global interface ACTION_TYPE
  --[[
    Input action with value of true or false
  ]]
  Boolean: ActionType
  
  --[[
    Input action with a numeric value
  ]]
  Number: ActionType
  
  --[[
    Input action with a numeric value between 0 and 1 (inclusive)
  ]]
  Range: ActionType
  
end
local record input
  --[[
    The argument of onTouchPress/onTouchRelease/onTouchMove engine handlers.
  ]]
  interface TouchEvent
    --[[
      Device id (there might be multiple touch devices connected). Note: the specific device ids are not guaranteed. Always use previous user input (onTouch... handlers) to get a valid device id (e. g. in your script's settings page).
    ]]
    device: number
    
    --[[
      Finger id (the device might support multitouch).
    ]]
    finger: number
    
    --[[
      Relative position on the touch device (0 to 1 from top left corner),
    ]]
    position: openmw_util.Vector2
    
    --[[
      Pressure of the finger.
    ]]
    pressure: number
    
  end
  interface TriggerInfo
    --[[
      Localization key of the trigger's description
    ]]
    description: string
    
    key: string
    
    --[[
      Localization context containing the name and description keys
    ]]
    l10n: string
    
    --[[
      Localization key of the trigger's name
    ]]
    name: string
    
  end
  --[[
    The argument of `onKeyPress`/`onKeyRelease` engine handlers.
  ]]
  interface KeyboardEvent
    --[[
      Key code.
    ]]
    code: KeyCode
    
    --[[
      The pressed symbol (1-symbol string if can be represented or an empty string otherwise).
    ]]
    symbol: string
    
    --[[
      Is `Alt` key pressed.
    ]]
    withAlt: boolean
    
    --[[
      Is `Control` key pressed.
    ]]
    withCtrl: boolean
    
    --[[
      Is `Shift` key pressed.
    ]]
    withShift: boolean
    
    --[[
      Is `Super`/`Win` key pressed.
    ]]
    withSuper: boolean
    
  end
  interface ActionInfo
    --[[
      initial value of the action
    ]]
    defaultValue: any
    
    --[[
      Localization key of the action's description
    ]]
    description: string
    
    key: string
    
    --[[
      Localization context containing the name and description keys
    ]]
    l10n: string
    
    --[[
      Localization key of the action's name
    ]]
    name: string
    
    type: ActionType
    
  end
  --[[
    (DEPRECATED, use getBooleanActionValue) Values that can be used with isActionPressed.
  ]]
  ACTION: ACTION
  
  --[[
    Values that can be used in registerAction
  ]]
  ACTION_TYPE: ACTION_TYPE
  
  --[[
    Values that can be used with getAxisValue.
  ]]
  CONTROLLER_AXIS: CONTROLLER_AXIS
  
  --[[
    Values that can be passed to onControllerButtonPress/onControllerButtonRelease engine handlers.
  ]]
  CONTROLLER_BUTTON: CONTROLLER_BUTTON
  
  --[[
    [Deprecated, moved to types.Player] Values that can be used with getControlSwitch/setControlSwitch.
  ]]
  CONTROL_SWITCH: CONTROL_SWITCH
  
  --[[
    Key codes.
  ]]
  KEY: KEY
  
  --[[
    Map of all currently registered actions
  ]]
  actions: { string: input.ActionInfo }
  
  --[[
    Activates the trigger with the given key
  ]]
  activateTrigger: function(
    key: string
  )
  
  --[[
    Provides a function computing the value of given input action.
      The callback is called once a frame, after the values of dependency actions are resolved.
      Throws an error if a cyclic action dependency is detected.
      input.bindAction('Activate', async:callback(function(dt, use, sneak, run)
          -- while sneaking, only activate things while holding the run binding
          return use and (run or not sneak)
      end), { 'Sneak', 'Run' })
  ]]
  bindAction: function(
    key: string,
    callback: openmw_async.Callback, --[[returning the new value of the action, and taking as arguments:
      frame time in seconds,
      value of the function,
      value of the first dependency action,
      ...]]
    dependencies: { string }
  )
  
  --[[
    Get value of an axis of a game controller.
  ]]
  getAxisValue: function(
    axisId: number
  ): number
  
  --[[
    Returns the value of a Boolean action
  ]]
  getBooleanActionValue: function(
    key: string
  ): boolean
  
  --[[
    [Deprecated, moved to types.Player] Get state of a control switch.
    I.e. is the player able to move/fight/jump/etc.
  ]]
  getControlSwitch: function(
    key: ControlSwitch
  ): boolean
  
  --[[
    Returns a human readable name for the given key code
  ]]
  getKeyName: function(
    code: KeyCode
  ): string
  
  --[[
    Horizontal mouse movement during the last frame.
  ]]
  getMouseMoveX: function(): number
  
  --[[
    Vertical mouse movement during the last frame.
  ]]
  getMouseMoveY: function(): number
  
  --[[
    Returns the value of a Number action
  ]]
  getNumberActionValue: function(
    key: string
  ): number
  
  --[[
    Returns the value of a Range action
  ]]
  getRangeActionValue: function(
    key: string
  ): number
  
  --[[
    (DEPRECATED, use getBooleanActionValue) Input bindings can be changed in-game using Options/Controls menu.
  ]]
  isActionPressed: function(
    actionId: number
  ): boolean
  
  --[[
    Is `Alt` key pressed.
  ]]
  isAltPressed: function(): boolean
  
  --[[
    Is a controller button currently pressed.
  ]]
  isControllerButtonPressed: function(
    buttonId: number
  ): boolean
  
  --[[
    Is `Ctrl` key pressed.
  ]]
  isCtrlPressed: function(): boolean
  
  --[[
    Is the player idle.
  ]]
  isIdle: function(): boolean
  
  --[[
    Is a keyboard button currently pressed.
  ]]
  isKeyPressed: function(
    keyCode: KeyCode
  ): boolean
  
  --[[
    Is a mouse button currently pressed.
  ]]
  isMouseButtonPressed: function(
    buttonId: number
  ): boolean
  
  --[[
    Is `Shift` key pressed.
  ]]
  isShiftPressed: function(): boolean
  
  --[[
    Is `Super`/`Win` key pressed.
  ]]
  isSuperPressed: function(): boolean
  
  --[[
    Registers a new input action.
    The key must be unique
  ]]
  registerAction: function(
    info: input.ActionInfo
  )
  
  --[[
    Registers a function to be called whenever the action's value changes
  ]]
  registerActionHandler: function(
    key: string,
    callback: openmw_async.Callback
  )
  
  --[[
    Registers a new input trigger.
    The key must be unique
  ]]
  registerTrigger: function(
    info: input.TriggerInfo
  )
  
  --[[
    Registers a function to be called whenever the trigger activates
  ]]
  registerTriggerHandler: function(
    key: string,
    callback: openmw_async.Callback
  )
  
  --[[
    [Deprecated, moved to types.Player] Set state of a control switch.
    I.e. forbid or allow the player to move/fight/jump/etc.
  ]]
  setControlSwitch: function(
    key: ControlSwitch, --[[Control type (see @{openmw.input#CONTROL_SWITCH})]]
    value: boolean
  )
  
  --[[
    Map of all currently registered triggers
  ]]
  triggers: { string: input.TriggerInfo }
  
end
return input