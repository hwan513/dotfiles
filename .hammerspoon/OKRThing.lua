local function doThing(startVal)
  for j = 0, 2 do
    for i = 0, 14 do
      hs.eventtap.keyStrokes(tostring((j + i + startVal // 10) * 10))
      hs.eventtap.keyStroke(nil, "tab")
      hs.timer.usleep(5000)
    end
  end
end

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "k", function()
  hs.focus()
  local status, startVal = hs.dialog.textPrompt("OKR filler", "What is your starting value", "10", "OK", "Cancel")
  hs.application.frontmostApplication():hide()
  if status == "Cancel" then
    return
  end
  doThing(startVal)
end)
