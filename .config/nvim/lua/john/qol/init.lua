local function prequire(filename)
	if not pcall(require, filename) then
		error(string.format("%s failed to load", filename))
		return
	end
end

prequire("john.qol.autopairs")
prequire("john.qol.comment")
prequire("john.qol.navigator")
prequire("john.qol.whichkey")

prequire("john.qol.copilot")

prequire("john.qol.cmp")
prequire("john.qol.signature")
