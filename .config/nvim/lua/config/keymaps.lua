-- defaults {{{
local map = require("config.utils").map
local opts = require("config.utils").map_opts
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Modes `:h nvim_set_keymap`
--   normal_mode = "n",
--   insert_mode = "i",
--   select_mode = "s",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Editor commands
map("n", "<C-r>", ":silent redo<CR>", opts("Silent redo"))
map("n", "u", ":silent undo<CR>", opts("Silent undo"))
map("n", "<Leader>w", ":silent w!<CR>", opts("Save file"))

map("n", "<Leader>W", ":wqa!<CR>", opts("Save all and quit"))
map({ "n", "v", "o", "t" }, "<Leader>q", ":qa!<CR>", opts("Force quit"))

map("n", "<Leader>a", ":<C-P><CR>", opts("Repeat last command"))
map("n", "<Leader><CR>", ":nohlsearch<CR>", opts("Remove search highlight"))
map("n", "<Leader>v", "ggVG", opts("Select All"))
map({ "n", "v" }, "s", "", opts("Unset s key for surround"))

-- Better motion behaviour
map("n", "j", "gj", opts("Move down"))
map("n", "k", "gk", opts("Move up"))
map("v", "<", "<gv", opts("Repetable dedent"))
map("v", ">", ">gv", opts("Repetable indent"))
map({ "i", "c" }, "<C-a>", "<Home>", opts("Move cursor to start of line"))
map({ "i", "c" }, "<C-e>", "<End>", opts("Move cursor to end of line"))

-- Move text up and down
map({ "n", "v" }, "<A-k>", ":m .-2<CR>==", opts("Move text down"))
map({ "n", "v" }, "<A-j>", ":m .+1<CR>==", opts("Move text up"))
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts("Move text up"))
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts("Move text down"))

-- Buffer commands
map("n", "H", ":bprevious<CR>", opts("Buffer previous"))
map("n", "L", ":bnext<CR>", opts("Buffer next"))

-- Tab commands
map("n", "<leader>tn", ":tabnew<CR>", opts("New tab"))
map("n", "<leader>to", ":tabonly<CR>", opts("Close other tabs"))
map("n", "<leader>tc", ":tabclose<CR>", opts("Close current tab"))
-- map("n", "<leader>tm", ":tabmove<CR>", opts("Move current tab index"))
