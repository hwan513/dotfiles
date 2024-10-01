clickState = false
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "l", function()
  clickState = not clickState

  if clickState == true then
    hs.alert.show("AutoClicker started")
    startAutoClicker()
  else
    hs.alert.show("AutoClicker stopped")
    stopAutoClicker()
  end
end)

function startAutoClicker()
  local pos = hs.mouse.getRelativePosition()
  autoClickerTimer = hs.timer.doEvery(3.20, function()
    hs.eventtap.leftClick(pos, 0)
  end)
end

function stopAutoClicker()
  autoClickerTimer:stop()
end
