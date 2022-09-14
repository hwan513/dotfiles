local function prequire(filename)
  if not pcall(require, filename) then
    print(string.format("%s failed to load", filename))
    return
  end
end

prequire("john.interface.bufferline")
prequire("john.interface.gitsigns")
prequire("john.interface.indentline")
prequire("john.interface.lualine")
prequire("john.interface.nvim-tree")
prequire("john.interface.telescope")
prequire("john.interface.terminal")
prequire("john.interface.trouble")
