local function prequire(filename)
	if not pcall(require, filename) then
		print(string.format("%s failed to load", filename))
		return
	end
end

prequire("john.default.colourscheme")
prequire("john.default.options")
prequire("john.default.keymaps")
prequire("john.default.autocommands")
