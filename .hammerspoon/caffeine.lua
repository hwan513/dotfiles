local temp = {
	active = hs.styledtext.new("C", { color = { white = 1 } }),
	inactive = hs.styledtext.new("C", { color = { white = 0.3 } }),
}
local char = temp.inactive

-- local function display(state)
-- 	return state and temp.active or temp.inactive
-- end

local function toggle()
	-- return display(hs.caffeinate.toggle("displayIdle")) and temp.active or temp.inactive
	return hs.caffeinate.toggle("displayIdle") and temp.active or temp.inactive
end

return { toggle = toggle, char = char }
