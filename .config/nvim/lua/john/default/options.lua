-- local vars {{{
local O = vim.opt
local H = {}
H.__newindex = function(_, k, v)
  vim.cmd(string.format("highlight %s %s", k, v))
end
setmetatable(H, H)
-- }}}
-- general things {{{
O.clipboard = "" -- link to system clipboard
O.hidden = true -- buffer becomes hidden when abandoned
O.switchbuf = { "useopen", "usetab", "newtab" } -- tab switching behaviour
O.history = 1000 -- remember lines of history
O.iskeyword:append("-") -- keyword completion includes hyphen
O.timeoutlen = 500 -- time to wait for a mapped sequence to complete
O.updatetime = 1234 -- for cursor hold
-- }}}
-- insert qol {{{
O.autoindent = true -- automatically indent new lines
O.backspace = { "eol", "start", "indent" } -- backspace acts properly
O.expandtab = true -- convert tabs to spaces
O.shiftwidth = 2 -- how many spaces per indent
O.smartindent = true -- make indenting smarter again
O.smarttab = true -- inserting tab works smart
O.tabstop = 2 -- how many spaces per tab
-- }}}
-- foldng {{{
O.foldcolumn = "1" -- extra margin to the left
O.foldenable = true -- enable folding
O.foldlevelstart = 10 -- default number of open folds
O.foldnestmax = 10 --maximum number of nested folds
O.foldmethod = "indent" -- fold based on indent level
-- }}}
-- searching {{{
O.hlsearch = true -- highlight search results
O.ignorecase = true -- ignore case when searching
O.incsearch = true -- search shows matched pattern
O.magic = true --regex for searching
O.smartcase = true -- smart case when searching
-- }}}
-- comletion options {{{
O.completeopt = { "menuone", "noinsert", "noselect" } -- complete menu options
H.PmenuSel = "blend=0"
O.pumblend = 25 -- pop up menu transparency
O.pumheight = 8 -- pop up menu height
O.pumwidth = 15 -- pop up menu width
-- }}}
-- navigation {{{
O.mouse = "a" -- allow the mouse to be used in neovim
O.scrolloff = 8 -- cursor vertical scroll adding
O.sidescrolloff = 8 -- cursor horizontal scroll padding
O.whichwrap:append("h,l,<,>,[,]") -- movement works properly
-- }}}
-- status line {{{
O.cmdheight = 1 -- more space in command line
O.laststatus = 2 -- always show satus line
O.shortmess:append({ a = true, W = true }) -- shorten command prompt messages
O.showmode = false -- current mode display
O.showtabline = 2 -- always show tabs
O.showcmd = true -- show command in bottom bar
-- }}}
-- user interface {{{
O.conceallevel = 0 -- see `` in markdown
O.cursorline = true -- cursor line position tracking
O.fillchars = "vert:│" -- vertical split styling
O.number = true -- show line numebr
O.numberwidth = 4 -- how many columns to reserve for line numbers
O.relativenumber = true --  show relativenumber on the side
O.ruler = false -- always show current position
O.signcolumn = "yes:2" -- show sign column so text isn't shifted
O.termguicolors = true -- better terminal coloring
-- }}}
-- interface behaviour {{{
O.linebreak = true -- break lines at end of word
O.lazyredraw = false -- redraw during macros
O.guicursor = "v:block,c-i-ci-ve-sm:ver25,n-r-cr-o:hor15"
O.matchtime = 2 -- tenths of a secnd to blink when matching pair
O.showmatch = true -- matching brackets blink
O.splitbelow = true -- force all horizontal splits to go below current window
O.splitright = true -- force all vertical splits to go to the right of current window
O.wrap = false -- long line wrapping behaviour
-- }}}
-- file things {{{
O.autoread = true -- read file again if modified elsewhere
O.backup = false -- create backup file when overwriting
O.fileencoding = "utf-8" -- file encoding
O.fileformats = { "unix", "dos", "mac" } --unix is standard file type
O.swapfile = false -- don't create swap file
O.undodir = vim.fn.stdpath("config") .. "/undo"
O.undofile = true -- persistent undo
O.writebackup = false -- create temporary backup when overwriting
-- }}}
-- wild menu {{{
O.wildmenu = true -- turn on wildmenu
O.wildignore = "*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store"
-- }}}
-- highlight {{{
H.Visual = "gui=bold"
-- H.ActiveWindow = "guibg=#black"
-- H.InactiveWindow = "guibg=#1F202E"
-- O.winhighlight = "Normal:ActiveWindow,NormalNC:InactiveWindow"
-- }}}
-- vim:foldmethod=marker:foldlevel=2
