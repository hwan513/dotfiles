local function prequire(filename)
  if not pcall(require, filename) then
    print(string.format("%s failed to load", filename))
    return
  end
end

prequire("impatient")
prequire("john.default")
prequire("john.plugins")
prequire("john.lsp")
prequire("john.treesitter")
prequire("john.interface")
prequire("john.qol")
prequire("john.dap")
