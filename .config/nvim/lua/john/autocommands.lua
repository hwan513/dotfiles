vim.cmd([[
  augroup _general
    autocmd!
    " close window with q
    autocmd FileType qf,help,man,lspinfo,null-ls-info nnoremap <silent> <buffer> q :close<CR>
    " open help window in right
    autocmd FileType help wincmd L | vertical resize 100 | set wrap
    " start at last exit point when entering buffer
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " remove trailing spaces on save
    " autocmd BufWritePre * :%s/\s\+$//e
    " check external writes to buffer
    autocmd FocusGained,BufEnter * checktime

  augroup _comply
    " comply with softeng281
    autocmd BufRead,BufNewFile *.java set tabstop=4 softtabstop=0 shiftwidth=0 noexpandtab

 "resize window
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  " dim inactive windows
  augroup _inactive_window_dimming
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter,FocusGained * setlocal cursorline | setlocal winhighlight=Normal:ActiveWindow
    autocmd WinLeave,VimLeave,FocusLost * setlocal nocursorline | setlocal winhighlight=Normal:InactiveWindow
]])

-- consistent cursor behaviour
-- au VimEnter,VimResume * set guicursor=v:block,c-i-ci-ve:ver25,n-r-cr-o:hor15
-- au VimLeave,VimSuspend * set guicursor=a:ver25
