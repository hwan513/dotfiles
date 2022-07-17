local menuPos = { x = 290, y = 140 }
local downPos = { x = 1530, y = 140 }
local nextPos = { x = 70, y = 250 }
local delay = 200000
local click = hs.eventtap.leftClick
local sleep = hs.timer.usleep
local function doThing()
	click(downPos, delay)
	sleep(900000)
	click(menuPos, delay)
	sleep(1100000)
	click(nextPos, delay)
end

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "S", function()
	hs.focus()
	local status, amount = hs.dialog.textPrompt("Download Pineapple", "How many pineapples:", "1", "OK", "Cancel")
	hs.application.frontmostApplication():hide()
	if status == "Cancel" then
		return
	end
	for _ = 1, amount do
		doThing()
		sleep(2000000)
	end
end)
