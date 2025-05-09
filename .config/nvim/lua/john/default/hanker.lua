-- Simple yank-ring. Inspiration:
-- https://www.reddit.com/r/neovim/comments/1jv03t1/simple_yankring
-- stylua: ignore start
local yank_registers = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"  }
-- stylua: ignore end

-- rebinds to the blackhole register
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- mappings to the blackhole register
local keys = { "d", "c", "x" }
for _, key in ipairs(keys) do
  map({ "n", "v" }, key, '"_' .. key, opts)
  map({ "n", "v" }, key:upper(), '"_' .. key:upper(), opts)
end

-- mapping to switch behaviour of `p` and `P`.
-- `p` will paste without updating registers.
-- `P` will paste and update registers.
map({ "v" }, "p", "P", opts)
map({ "v" }, "P", "p", opts)

-- map `y` to only yank to the `"` register
map({ "n", "v" }, "y", "y", opts)
map("n", "Y", '""Y', opts)

-- create visual mode mapping of `Y` to yank and keep visual selection
-- I can see a usecase where you want to emulate the old `c` behaviour with `Yc`
map("v", "Y", "ygv", opts)

-- create a cut mapping with `m`
map({ "n", "v" }, "m", "d", opts)
map("n", "mm", "dd", opts)
map({ "n", "v" }, "M", "D", opts)

-- Shift numbered registers across the range of `yank_registers`
local function yank_shift()
  for i = #yank_registers, 2, -1 do
    vim.fn.setreg(yank_registers[i], vim.fn.getreg(yank_registers[i - 1]))
  end
  vim.fn.setreg(yank_registers[1], vim.fn.getreg('"'))
end

-- Create autocmd for TextYankPost event
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local event = vim.v.event
    if event.operator == "y" or event.operator == "d" then
      print("yanked")
      yank_shift()
    end
  end,
})
