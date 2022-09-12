local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn

local general = augroup("general", { clear = true })

-- q to quit in certain file types
autocmd("FileType", {
	pattern = { "qf", "help", "man", "lspinfo", "null-ls-info" },
	command = "nnoremap <silent> <buffer> q :close<CR>",
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
		if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
			fn.setpos(".", fn.getpos("'\""))
			-- vim.cmd('normal zz')
			vim.cmd("silent! foldopen")
		end
	end,
})

-- Check external writes to current buffer
autocmd({ "FocusGained", "BufEnter" }, {
	group = general,
	pattern = "*",
	command = "checktime",
})

-- Enable spell checking for certain file types and wrapping
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.txt", "*.md", "*.tex" },
	callback = function()
		vim.api.nvim_exec(
			[[
    setlocal spell
    set wrap
    ]],
			{ output = false }
		)
	end,
	group = general,
})

-- remove trailing spaces
-- autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	command = "%s/\\s\\+$//e",
-- 	group = general,
-- })

-- highlight yanks
-- autocmd("TextYankPost", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.highlight.on_yank({ timeout = 500 })
-- 	end,
-- 	group = general,
-- })

local window_sizing = augroup("window_sizing", { clear = true })

-- help pane opens in right pane and is resized
autocmd("FileType", {
	pattern = { "help" },
	callback = function()
		vim.api.nvim_exec(
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

local window_dimming = augroup("window_dimming", { clear = true })

autocmd({ "VimEnter", "WinEnter", "BufWinEnter", "FocusGained" }, {
	pattern = { "*" },
	command = "setlocal cursorline | setlocal winhighlight=Normal:ActiveWindow",
	group = window_dimming,
})

autocmd({ "WinLeave", "VimLeave", "FocusLost" }, {
	pattern = { "*" },
	command = "setlocal nocursorline | setlocal winhighlight=Normal:InactiveWindow",
	group = window_dimming,
})
