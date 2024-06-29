local press = hs.eventtap.keyStrokes
local stroke = hs.eventtap.keyStroke
local slep = function()
  hs.timer.usleep(5000)
end
hs.hotkey.bind({ "cmd", "ctrl" }, "o", function()
  stroke(nil, "tab")
  stroke(nil, "tab")
  stroke({ "cmd" }, "a")
  stroke({ "cmd" }, "c")
  stroke({ "shift" }, "tab")
  stroke({ "ctrl" }, "e")
  press(" - ")
  slep()
  stroke({ "cmd" }, "v")
end)
