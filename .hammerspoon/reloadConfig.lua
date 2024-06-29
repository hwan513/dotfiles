hs.alert.show("Config loaded")
local function reloadConfig()
  hs.reload()
end
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", reloadConfig)
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
