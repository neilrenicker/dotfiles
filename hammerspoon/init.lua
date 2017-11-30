
-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

launch = function(appname)
  hs.application.launchOrFocus(appname)
  k.triggered = true
end

k:bind({}, 'n', nil, function() launch('nvALT') end)
k:bind({}, 'r', nil, function() launch('Paws for Trello') end)
k:bind({}, 'i', nil, function() launch('iTerm') end)
k:bind({}, 'e', nil, function() launch('Emojise') end)
k:bind({}, 'space', nil, function() launch('Google Chrome') end)
k:bind({}, 'u', nil, function() launch('Spotify') end)
k:bind({}, 'o', nil, function() launch('OmniFocus') end)
k:bind({}, 'd', nil, function() launch('Dash') end)
k:bind({}, 't', nil, function() launch('Tower') end)
k:bind({}, 's', nil, function() launch('Sketch') end)
k:bind({}, 'f', nil, function() launch('Fantastical 2') end)
k:bind({}, ',', nil, function() launch('Siri') end)

-- HYPER+M: Trigger Moom keyboard control
hyper_M = function()
  hs.eventtap.keyStroke({'shift', 'cmd', 'alt'}, '.')
  k.triggered = true
end
k:bind({}, 'm', nil, hyper_M)

-- HYPER+C: Trigger Alfred 2 Clipboard viewer
hyper_C = function()
  hs.eventtap.keyStroke({'shift', 'cmd', 'alt'}, '/')
  k.triggered = true
end
k:bind({}, 'c', nil, hyper_C)

-- HYPER+J: Trigger down arrow
hyper_J = function()
  hs.eventtap.keyStroke({}, 'down')
  k.triggered = true
end
k:bind({}, 'j', nil, hyper_J)

-- HYPER+K: Trigger up arrow
hyper_K = function()
  hs.eventtap.keyStroke({}, 'up')
  k.triggered = true
end
k:bind({}, 'k', nil, hyper_K)

-- HYPER+H: Trigger left arrow
hyper_H = function()
  hs.eventtap.keyStroke({}, 'left')
  k.triggered = true
end
k:bind({}, 'h', nil, hyper_H)

-- HYPER+L: Trigger right arrow
hyper_L = function()
  hs.eventtap.keyStroke({}, 'right')
  k.triggered = true
end
k:bind({}, 'l', nil, hyper_L)

-- HYPER+3: Trigger full screen capture
hyper_3 = function()
  hs.eventtap.keyStroke({'shift', 'cmd'}, '3')
  k.triggered = true
end
k:bind({}, '3', nil, hyper_3)

-- HYPER+4: Trigger drawable screen capture
hyper_4 = function()
  hs.eventtap.keyStroke({'shift', 'cmd'}, '4')
  k.triggered = true
end
k:bind({}, '4', nil, hyper_4)

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
