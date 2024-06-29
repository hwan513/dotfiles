hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)
