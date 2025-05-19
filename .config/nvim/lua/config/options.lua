local options = {
  -- General behaviour
  clipboard = "", -- don't link to system clipboard
  hidden = true, -- buffer becomes hidden when abandoned
  switchbuf = { "useopen", "usetab", "newtab" }, -- tab switching behaviour
  history = 1000, -- remember lines of history
  iskeyword = { append = "-" }, -- keyword completion includes hyphen
  timeoutlen = 500, -- time to wait for a mapped sequence to complete
  updatetime = 1234, -- for cursor hold aucmd

  -- insertion behaviour
  autoindent = true, -- automatically indent new lines
  backspace = { "eol", "start", "indent" }, -- backspace acts properly
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- how many spaces per indent
  smartindent = true, -- make indenting smarter again
  smarttab = true, -- inserting tab works smart
  tabstop = 2, -- how many spaces per tab

  -- folding behaviour (might overwritten by nvim-ufo)
  foldcolumn = "1", -- extra margin to the left
  foldenable = true, -- enable folding
  foldlevelstart = 10, -- default number of open folds
  foldnestmax = 10, -- maximum number of nested folds
  foldmethod = "indent", -- fold based on indent level

  -- searching behaviour
  hlsearch = true, -- highlight search results
  ignorecase = true, -- ignore case when searching
  incsearch = true, -- search shows matched pattern
  magic = true, --regex for searching
  smartcase = true, -- smart case when searching

  -- comletion-menu behaviour
  completeopt = { "menuone", "noinsert", "noselect" }, -- complete menu options
  pumblend = 25, -- pop up menu transparency
  pumheight = 8, -- pop up menu height
  pumwidth = 15, -- pop up menu width

  -- navigation behaviour
  mouse = "a", -- allow the mouse to be used in neovim
  scrolloff = 8, -- cursor vertical scroll adding
  sidescrolloff = 8, -- cursor horizontal scroll padding
  whichwrap = { append = "h,l,<,>,[,]" }, -- movement works properly

  -- statusline
  cmdheight = 1, -- more space in command line
  laststatus = 2, -- always show satus line
  shortmess = { append = { a = true, W = true } }, -- shorten command prompt messages
  showmode = false, -- current mode display
  showtabline = 2, -- always show tabs
  showcmd = true, -- show command in bottom bar

  -- user interface
  conceallevel = 0, -- see `` in markdown
  cursorline = true, -- cursor line position tracking
  fillchars = "vert:│", -- vertical split styling
  number = true, -- show line numebr
  numberwidth = 4, -- how many columns to reserve for line numbers
  relativenumber = true, --  show relativenumber on the side
  ruler = false, -- always show current position
  signcolumn = "yes:2", -- show sign column so text isn't shifted
  termguicolors = true, -- better terminal coloring

  -- interface behaviour
  linebreak = true, -- break lines at end of word
  lazyredraw = false, -- don't redraw during macros
  guicursor = "v:block,c-i-ci-ve-sm:ver25,n-r-cr-o:hor15", -- cursor style in different modes
  matchtime = 2, -- tenths of a secnd to blink when matching pair
  showmatch = true, -- matching brackets blink
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  wrap = false, -- long line wrapping behaviour

  -- file behaviour
  autoread = true, -- read file again if modified elsewhere
  backup = false, -- create backup file when overwriting
  writebackup = false, -- create temporary backup when overwriting
  fileencoding = "utf-8", -- file encoding
  fileformats = { "unix", "dos", "mac" }, --unix is standard file type
  swapfile = false, -- don't create swap file
  undofile = true, -- persistent undo
  undodir = vim.fn.stdpath("state") .. "/undo",

  -- cli completion
  wildmenu = true, -- turn on wildmenu
  wildignore = "*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store",
}

for option, setting in pairs(options) do
  if type(setting) == "table" and setting.append ~= nil then
    vim.opt[option]:append(setting.append)
  else
    vim.opt[option] = setting
  end
end

vim.cmd.highlight("Visual", "gui=bold")
vim.o.sessionoptions = "blank,buffers,curdir,folds,globals,help,tabpages,winsize,winpos,terminal,localoptions"
