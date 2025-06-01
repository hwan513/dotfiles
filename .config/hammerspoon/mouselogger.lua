local logState = false
local runState = false
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "m", function()
  if logState == false then
    StartMouseLogger()
    logState = true
  elseif runState == false then
    runState = true
    StopMouseLogger()
    StartMacro()
  else
    logState = false
    runState = false
    StopMacro()
  end
end)

hs.hotkey.bind({ "cmd", "alt", "shift", "ctrl" }, "m", function()
  if runState then
    StopMacro()
  else
    ResumeMacro()
  end
  runState = not runState
end)

function StartMouseLogger()
  hs.alert.show("MouseLogger started")
  MacroString = ""
  OldTime = hs.timer.absoluteTime()
  MouseClickListener = hs.eventtap.new({ hs.eventtap.event.types.leftMouseDown }, function(_)
    local pos = hs.mouse.getRelativePosition()
    local delta_time = hs.timer.absoluteTime() - OldTime
    if pos ~= nil then
      MacroString = MacroString
        .. "hs.timer.doAfter("
        .. delta_time / 1000000000
        .. ",function()hs.eventtap.leftClick({x="
        .. pos.x
        .. ",y="
        .. pos.y
        .. "},1000000)end);"
    end
  end)

  MouseClickListener:start()
end

function StopMouseLogger()
  hs.alert.show("MouseLogger stopped")
  MouseClickListener:stop()
end

function StartMacro()
  local func, err = load(MacroString)
  local timeInterval = hs.timer.absoluteTime() - OldTime
  if func then
    hs.alert.show("Macro started")
    Macro = hs.timer.doEvery(timeInterval / 1000000000, function()
      local ok, _ = pcall(func)
      if not ok then
        hs.alert.show("Error: " .. err)
      end
    end)
  end
end

function ResumeMacro()
  Macro:start()
  hs.alert.show("Macro resumed")
end

function StopMacro()
  Macro:stop()
  hs.alert.show("Macro stopped")
end
