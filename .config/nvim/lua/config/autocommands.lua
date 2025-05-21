local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("general", { clear = true })

-- q to quit in certain file types
autocmd("FileType", {
  pattern = { "qf", "help", "man", "lspinfo", "null-ls-info" },
  command = "nnoremap <silent> <buffer> q :close<CR>",
  group = general,
})

-- q to quit in certain file types
autocmd("FileType", {
  pattern = { "jjdescription" },
  command = "nnoremap <silent> <buffer> q <cmd>wq<CR>",
  group = general,
})

autocmd("FocusLost", {
  pattern = "*",
  command = "silent! wa",
  group = general,
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
  group = general,
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos(".", vim.fn.getpos("'\""))
      -- vim.cmd('normal zz')
      vim.cmd("silent! foldopen")
    end
  end,
})

-- Check external writes to current buffer when switching back to neovim
autocmd({ "FocusGained", "BufEnter" }, {
  group = general,
  pattern = "*",
  command = "checktime",
})

-- Enable wrapping on markup files
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md", "*.tex", "*.typ" },
  command = "set wrap",
  group = general,
})

local window_sizing = augroup("window_sizing", { clear = true })

-- help pane opens in right pane and is resized
autocmd("FileType", {
  pattern = { "help" },
  callback = function()
    vim.api.nvim_exec2(
      [[
      wincmd L
      vertical resize 100
      set wrap
      ]],
      { output = false }
    )
  end,
  group = window_sizing,
})

-- splitting aligns nicely
autocmd("VimResized", {
  pattern = { "*" },
  command = "tabdo wincmd =",
  group = window_sizing,
})

-- Kinda makes srt (caption) files look readable
autocmd("BufReadPost", {
  pattern = "*.srt",
  callback = function()
    vim.o.conceallevel = 2
    vim.o.foldlevel = 0
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "(getline(v:lnum)=~'font')?'>1':1"
    vim.cmd([[ syntax match srtFormat "<font[^>]*>\|<\/font>" conceal ]])
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(ctx)
    local root = vim.fs.root(ctx.buf, { ".git", "Makefile", ".luarc.json" })
    if root then
      vim.uv.chdir(root)
    end
  end,
})
