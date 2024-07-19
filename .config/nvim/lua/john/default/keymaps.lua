-- defaults {{{
local keymap = vim.api.nvim_set_keymap -- keymaps function shortened
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- }}}
-- Modes {{{
--   normal_mode = "n",
--   insert_mode = "i",
--   select_mode = "s",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   }}}
-- General stuff {{{
keymap("n", "<C-r>", ":silent redo<CR>", opts) -- quick save
keymap("n", "u", ":silent undo<CR>", opts) -- quick save
keymap("n", "<Leader>w", ":silent w!<CR>", opts) -- quick save
keymap("n", "<Leader>W", ":wqa!<CR>", opts) -- quick save all and quit
keymap("n", "<Leader>a", ":<C-P><CR>", opts) -- repeat last executed command
-- keymap("n", "<Leader><CR>", ":nohlsearch<CR>", opts) -- remove search highlighting
keymap("n", "<Leader>v", "ggVG", opts) -- select all
-- keymap("n", "<Leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts) -- cd to current file then pwd
-- keymap("n", "<Space>", "/", opts) -- space will / (search)
-- keymap("n", "<CR>", ":<c-u>put =repeat([''],v:count)<bar>'[+0<CR>", opts) -- enter will create new line
-- }}}
-- Resize splits with arrows {{{
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- }}}
-- Buffer commands {{{
keymap("n", "H", ":bprevious<CR>", opts) -- move to previous buffer
keymap("n", "L", ":bnext<CR>", opts) -- move to next buffer
keymap("n", "<leader>c", ":Bdelete!<CR>", opts) -- delete current buffer
-- }}}
-- Tab commands {{{
-- keymap("n", "<leader>tn", ":tabnew<CR>", opts) -- create new tab
-- keymap("n", "<leader>to", ":tabonly<CR>", opts) -- delete other tabs
-- keymap("n", "<leader>tc", ":tabclose<CR>", opts) -- delete current tab
-- keymap("n", "<leader>tm", ":tabmove<CR>", opts) -- move current tab index
-- keymap("n", "<leader>h", "gT", opts) -- move to previous tab
-- keymap("n", "<leader>t", "gt", opts) -- move to next tab
-- }}}
-- Copy and Paste from System clipboard {{{
keymap("", "<Leader>y", [["+y]], opts)
keymap("", "<Leader>p", [["+p]], opts)
-- }}}
-- Motion commands work better {{{
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("v", "j", "gj", opts)
keymap("v", "k", "gk", opts)
-- }}}
-- Fast escape {{{
keymap("i", "jk", "<ESC>", opts)
keymap("s", "jk", "<ESC>", opts)
-- }}}
-- Append semicolon at end of line {{{
-- keymap("i", ";;", "<ESC>A;", opts)
keymap("n", ";;", "<ESC>A;<ESC>", opts)
-- }}}
-- Stay in indent mode {{{
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- }}}
-- Move text up and down {{{
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<M-k>", ":m .-2<CR>==", opts)
keymap("n", "<M-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<M-k>", ":m .-2<CR>==", opts)
keymap("v", "<M-j>", ":m .+1<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)
-- }}}
-- nvim sandwich modifications {{{
keymap("n", "s", "", opts)
keymap("x", "s", "", opts)
-- }}}
-- command mode emac commands {{{
-- " start of line
-- keymap("c", "<C-A>", "<Home>", opts)
-- " back one character
-- keymap("c", "C-B>", "<Left>", opts)
-- " delete character under cursor
-- keymap("c", "C-D>", "<Del>", opts)
-- " end of line
-- keymap("c", "C-E>", "<End>", opts)
-- " forward one character
-- keymap("c", "C-F>", "<Right>", opts)
-- " recall newer command-line
-- keymap("c", "C-N>", "<Down>", opts)
-- " recall previous (older) command-line
-- keymap("c", "C-P>", "<Up>", opts)
-- " back one word
-- keymap("c", "<Esc><C-B>", "<S-Left>", opts)
-- -- " forward one word
-- keymap("c", "<Esc><C-F>", "<S-Right>", opts)
vim.cmd([[
	" start of line
:noremap! <C-A>		<Home>
" back one character
:noremap! <C-B>		<Left>
" delete character under cursor
:noremap! <C-D>		<Del>
" end of line
:noremap! <C-E>		<End>
" forward one character
:noremap! <C-F>		<Right>
" recall newer command-line
:noremap! <C-N>		<Down>
" recall previous (older) command-line
:noremap! <C-P>		<Up>
" back one word
:noremap! <Esc><C-B>	<S-Left>
" forward one word
:noremap! <Esc><C-F>	<S-Right>
]])
--
-- }}}
-- vim:foldmethod=marker:foldlevel=1
