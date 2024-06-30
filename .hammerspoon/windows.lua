local hyper = { "ctrl", "alt", "cmd" }
hs.window.animationDuration = 0
spoon.MiroWindowsManager:bindHotkeys({
  up = { hyper, "up" },
  right = { hyper, "right" },
  down = { hyper, "down" },
  left = { hyper, "left" },
  fullscreen = { hyper, "f" },
  nextscreen = { hyper, "n" },
})

-- window moving for when there is multiple monitors

hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "right", function()
  -- move the focused window one display to the right
  local win = hs.window.focusedWindow()
  win:moveOneScreenEast()
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "left", function()
  -- move the focused window one display to the left
  local win = hs.window.focusedWindow()
  win:moveOneScreenWest()
end)
