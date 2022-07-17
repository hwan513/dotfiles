hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "O", function()
	hs.execute("open /Users/henrywang/Documents/Learning", false)
	hs.execute("open /Users/henrywang/Downloads", false)
	local laptopScreen = "Built-in Retina Display"
	local windowLayout = {
		{ "Finder", "Downloads", laptopScreen, hs.layout.left50, nil, nil },
		{ "Finder", "Learning", laptopScreen, hs.layout.right50, nil, nil },
	}
	hs.layout.apply(windowLayout)
end)
