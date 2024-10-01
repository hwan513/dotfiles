-- local basePath = os.getenv("HOME") .. "/.hammerspoon/"
local function prequire(call)
  local status, _ = pcall(require, call)
  if not status then
    hs.alert(call .. " failed to load")
  end
end

prequire("reloadConfig")
-- prequire("menuUtils")
prequire("keyUtils")
prequire("finderOpen")
prequire("clicker")

-- First install spoon install manually from the web
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall:andUse("EmmyLua")
