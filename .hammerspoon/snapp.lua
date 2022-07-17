-- ON HOLD
local function getCurrentWindow()
	local currentWindow = hs.window.focusedWindow()

	-- If it's not a standard window, Magneto shouldn't mess with it.
	if not currentWindow:isStandard() then
		return nil
	end
	return currentWindow
end

local mouseDragEventWatcher = hs.eventtap.new({ hs.eventtap.event.types.leftMouseDragged }, function()
	local currentWindow = getCurrentWindow()
	if not currentWindow then
		return
	end
	local initalPos = currentWindow:frame()
	if initalPos == currentWindow:frame() then
		return
	end
	-- hs.alert("you dragged deez nuts")
end)
mouseDragEventWatcher:start()
