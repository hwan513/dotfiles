local function prequire(filename)
	if not pcall(require, filename) then
		error(string.format("%s failed to load", filename))
		return
	end
end

prequire("john.treesitter.treesitter")
