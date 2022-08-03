-- local basePath = os.getenv("HOME") .. "/.hammerspoon/"
local function prequire(call)
	local status, _ = pcall(require, call)
	if not status then
		hs.alert(call .. " failed to load")
	end
end

hs.loadSpoon("SpoonInstall")
-- spoon.SpoonInstall:asyncInstallSpoonFromRepo("MiroWindowsManager")
-- spoon.SpoonInstall:andUse("EmmyLua")
prequire("fakeServer")
prequire("reloadConfig")
prequire("windows")
prequire("menuUtils")
prequire("keyUtils")
prequire("download")
prequire("finderOpen")
