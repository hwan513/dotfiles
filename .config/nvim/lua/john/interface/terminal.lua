local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end
local keymap = vim.api.nvim_set_keymap -- keymaps function shortened
local bufmap = vim.api.nvim_buf_set_keymap -- keymaps function shortened
local api = vim.api
local fn = vim.fn
local bo = vim.bo

local function set_terminal_keymaps()
  local opts = { noremap = true }
  bufmap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  bufmap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  bufmap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  bufmap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
local terminal_open = vim.api.nvim_create_augroup("terminal_open", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    set_terminal_keymaps()
  end,
  group = terminal_open,
})

toggleterm.setup({
  size = 50,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

-- Compile and run code
local function CompileRun()
  local fp = fn.expand("%") -- full filename
  local fe = fn.expand("%<") -- file without extention
  local ft = bo.filetype -- filetypes
  local rf = {
    c = string.format("gcc %s -Wall -lm -o %s && time ./%s", fp, fe, fe),
    cpp = string.format("g++ %s -Wall -lm -o %s && time ./%s", fp, fe, fe),
    java = string.format("javac %s && time java %s", fp, fe),
    -- java = "mjr",
    rust = "cargo run",
    lua = string.format("time luajit %s", fp),
    sh = string.format("time bash %s", fp),
    python = string.format("time python3 %s", fp),
    html = string.format("safari %s &", fp),
    -- matlab = string.format("octave %s", fp),
  }
  -- vim.api.nvim_command("!" .. rf[ft])
  api.nvim_command("silent w")
  api.nvim_command("silent TermExec open=0 cmd='" .. rf[ft] .. "'")
  print("TermExec cmd=" .. rf[ft])
end

api.nvim_create_user_command("CompileRun", CompileRun, {})
keymap("n", "<leader>\\", ":CompileRun<cr>", { noremap = true, silent = true })
keymap("n", "<leader><cr>", ":CompileRun<cr>:ToggleTerm<cr>", { noremap = true, silent = true })
