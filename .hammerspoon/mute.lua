local bottleSound = hs.sound.getByFile("Sounds/Bottle.aiff"):volume(0.2)
local funkSound = hs.sound.getByFile("Sounds/Funk.aiff"):volume(0.2)
local temp = {
  active = hs.styledtext.new("M", { color = { white = 1 } }),
  inactive = hs.styledtext.new("M", { color = { white = 0.3 } }),
}
local function micState()
  local mic = hs.audiodevice.defaultInputDevice()
  local state = mic:inputMuted()
  return mic, state
end
local function toggle()
  local mic, state = micState()
  state = not state
  local char = state and temp.active or temp.inactive;
  (state and bottleSound or funkSound):play()
  mic:setMuted(state)
  return char
end
local tempChar = hs.audiodevice.defaultInputDevice():inputMuted() and temp.active or temp.inactive
return { toggle = toggle, char = tempChar }
