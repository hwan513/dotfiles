-- local basePath = os.getenv("HOME") .. "/.hammerspoon/"
local function prequire(call)
  local status, _ = pcall(require, call)
  if not status then
    hs.alert(call .. " failed to load")
  end
end

-- First install spoon install manually from the web
-- hs.loadSpoon("SpoonInstall")
-- spoon.SpoonInstall:andUse("EmmyLua")

-- prequire("menuUtils")
prequire("kanata")
prequire("keyUtils")
prequire("finderOpen")
prequire("clicker")
prequire("mouselogger")
prequire("reloadConfig") -- seems to have weird behaviour if not at the bottom
