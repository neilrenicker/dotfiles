-- ------
-- Config
-- ------

-- Disable animation for window resizing so it's instant.
hs.window.animationDuration = 0

-- allows us to place on quarters, thirds and halves
hs.grid.setGrid('12x12')
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

-- A hotkey modal to emulate the hyper key.
local hyperMode = hs.hotkey.modal.new({}, 'F17')

-- Global boolean to track triggered state of Hyper.
local hyperTriggered = false

-- A custom keyStroke for ensuring that hyper's state is triggered and that
-- there is no delay.
-- https://github.com/Hammerspoon/hammerspoon/issues/1082
local keyStroke = function(modifiers, key)
  hyperTriggered = true
  -- The 0 removes the delay between key up and down
  hs.eventtap.keyStroke(modifiers, key, 0)
end

launch = function(appname)
  hs.application.launchOrFocus(appname)
  hyperTriggered = true
end

-- --------
-- Bindings
-- --------

hyperMode:bind({}, 'd', nil, function() launch('Dash') end)
hyperMode:bind({}, 'e', nil, function() launch('Atom') end)
hyperMode:bind({}, 'f', nil, function() launch('Fantastical 2') end)
hyperMode:bind({}, 'm', nil, function() launch('iTerm') end)
hyperMode:bind({}, 'n', nil, function() launch('Bear') end)
hyperMode:bind({}, 's', nil, function() launch('Sketch') end)
hyperMode:bind({}, 'u', nil, function() launch('Spotify') end)
hyperMode:bind({}, 'w', nil, function() launch('Tower') end)
hyperMode:bind({}, 'x', nil, function() launch('Things3') end)
hyperMode:bind({}, 'space', nil, function() launch('Google Chrome') end)

-- HYPER+C: Trigger Alfred 2 Clipboard viewer
hyperMode:bind({}, 'c', nil, function()
  keyStroke({'shift', 'cmd', 'alt'}, '/')
end)

-- HYPER+J: Trigger down arrow
hyperMode:bind({}, 'j', nil, function()
  keyStroke({}, 'down')
end)

-- HYPER+K: Trigger up arrow
hyperMode:bind({}, 'k', nil, function()
  keyStroke({}, 'up')
end)

-- HYPER+H: Trigger left arrow
hyperMode:bind({}, 'h', nil, function()
  keyStroke({}, 'left')
end)

-- HYPER+L: Trigger right arrow
hyperMode:bind({}, 'l', nil, function()
  keyStroke({}, 'right')
end)

-- HYPER+3: Trigger full screen capture
hyperMode:bind({}, '3', nil, function()
  keyStroke({'cmd', 'shift'}, '3')
end)

-- HYPER+4: Trigger Droplr's drawable screen capture (bypasses Desktop, uploads)
hyperMode:bind({}, '4', nil, function()
  keyStroke({'option', 'shift'}, '4')
end)

-- HYPER+\: Lock screen
hyperMode:bind({}, '\\', nil, function()
  hs.caffeinate.lockScreen()
end)

-- HYPER+0: Reload config
hyperMode:bind({}, '0', nil, function()
  hs.reload()
end)

-- ----------------------------
-- Window Resizing and Movement
-- ----------------------------

-- From Wincent's config: https://git.io/v1jJD
-- Chain the specified movement commands.
--
-- This is like the "chain" feature in Slate, but with a couple of enhancements:
--
--  - Chains always start on the screen the window is currently on.
--  - A chain will be reset after 2 seconds of inactivity, or on switching from
--    one chain to another, or on switching from one app to another, or from one
--    window to another.
--
local lastSeenChain = nil
local lastSeenWindow = nil

local chain = (function(movements)
  local chainResetInterval = 2 -- seconds
  local cycleLength = #movements
  local sequenceNumber = 1
  local lastSeenAt = 0

  return function()
    hyperTriggered = true
    local win = hs.window.frontmostWindow()
    local id = win:id()
    local now = hs.timer.secondsSinceEpoch()
    local screen = win:screen()

    if
      lastSeenChain ~= movements or
      lastSeenAt < now - chainResetInterval or
      lastSeenWindow ~= id
    then
      sequenceNumber = 1
      lastSeenChain = movements
    elseif (sequenceNumber == 1) then
      -- At end of chain, restart chain on next screen.
      screen = screen:next()
    end
    lastSeenAt = now
    lastSeenWindow = id

    hs.grid.set(win, movements[sequenceNumber], screen)
    sequenceNumber = sequenceNumber % cycleLength + 1
  end
end)

local grid = {
  topHalf = '0,0 12x6',
  topThird = '0,0 12x4',
  topTwoThirds = '0,0 12x8',
  rightHalf = '6,0 6x12',
  rightThird = '8,0 4x12',
  rightTwoThirds = '4,0 8x12',
  bottomHalf = '0,6 12x6',
  bottomThird = '0,8 12x4',
  bottomTwoThirds = '0,4 12x8',
  leftHalf = '0,0 6x12',
  leftThird = '0,0 4x12',
  leftTwoThirds = '0,0 8x12',
  topLeft = '0,0 6x6',
  topRight = '6,0 6x6',
  bottomRight = '6,6 6x6',
  bottomLeft = '0,6 6x6',
  fullScreen = '0,0 12x12',
  centeredBig = '2,0 8x12',
  centeredSmall = '3,0 6x12',
  middleMedium = '3,2 6x8',
  middleSmall = '4,3 4x6',
}

hyperMode:bind({}, ';', chain({
  grid.leftHalf,
  grid.leftThird,
  grid.leftTwoThirds,
}))

hyperMode:bind({}, '\'', chain({
  grid.rightHalf,
  grid.rightThird,
  grid.rightTwoThirds,
}))

hyperMode:bind({}, '-', chain({
  grid.topHalf,
  grid.topThird,
  grid.topTwoThirds,
}))

hyperMode:bind({}, '=', chain({
  grid.bottomHalf,
  grid.bottomThird,
  grid.bottomTwoThirds,
}))

hyperMode:bind({}, 'i', chain({
  grid.topLeft,
  grid.bottomLeft,
  grid.topRight,
  grid.bottomRight,
}))

hyperMode:bind({}, 'o', chain({
  grid.fullScreen,
  grid.centeredBig,
  grid.centeredSmall,
}))

hyperMode:bind({}, 'p', chain({
  grid.middleMedium,
  grid.middleSmall,
}))

-- -----------
-- Hyper Setup
-- -----------

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  hyperTriggered = false
  hyperMode:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  hyperMode:exit()
  if not hyperTriggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
