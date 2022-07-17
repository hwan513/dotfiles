local caf = require("caffeine")
local mute = require("mute")

local menuItem = hs.menubar.new()
local function updateMenu()
	menuItem:setTitle(mute.char .. caf.char)
end

local function muteOrCaf(inputTable)
	if inputTable["ctrl"] then
		caf.char = caf.toggle()
	else
		mute.char = mute.toggle()
	end
	updateMenu()
end

menuItem:setClickCallback(muteOrCaf)
updateMenu()

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "M", function()
	mute.char = mute.toggle()
	updateMenu()
end)
