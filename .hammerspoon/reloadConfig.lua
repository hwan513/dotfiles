function ReloadConfig(paths)
  for _, path in ipairs(paths) do
    if path:sub(-4) == ".lua" then
      hs.reload()
    end
  end
end

hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "R", hs.reload)
ReloadWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", ReloadConfig):start()
hs.alert.show("Config reloaded")
