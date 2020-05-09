" fzf.vim {
" Refer to https://github.com/liuchengxu/space-vim/issues/364
let $LANG = 'en_US.UTF-8'
" Customize fzf colors to match your color scheme
" Only suitable for space-vim-dark theme, other themes are not guaranteed.
let g:fzf_colors = {
            \ 'fg':      ['fg', 'StatusLineNC'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'String'],
            \ 'fg+':     ['fg', 'Number', 'Normal'],
            \ 'bg+':     ['bg', 'StatusLine', 'Normal'],
            \ 'hl+':     ['fg', 'Exception'],
            \ 'info':    ['fg', 'Special'],
            \ 'prompt':  ['fg', 'Function'],
            \ 'pointer': ['fg', 'Error'],
            \ 'marker':  ['fg', 'Error'],
            \ 'spinner': ['fg', 'Statement'],
            \ 'header':  ['fg', 'Number'],
            \   }

" fzf.vim doesn't enable preview feature by default.
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -nargs=* Rag call spacevim#plug#fzf#AgInProject(<q-args>)
command! -bang -nargs=* Rg call spacevim#plug#fzf#Rg(<q-args>, <bang>0)

nmap <Leader>? <plug>(fzf-maps-n)
xmap <Leader>? <plug>(fzf-maps-x)
omap <Leader>? <plug>(fzf-maps-o)

" nnoremap <Leader>ag :Ag!<CR>
" vnoremap <Leader>ag :<c-u>call spacevim#plug#fzf#Vsearch()<CR>

nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>ff :Files<CR>
" nnoremap <leader>um :Maps<cr>
nnoremap <leader>fr :History<cr>
nnoremap <leader>sj :BTags<cr>
nnoremap <leader>; :Commands<cr>


"nnoremap <Leader>ff :Files ~<CR>
" nnoremap <silent> <Leader>sf :call spacevim#plug#fzf#Session()<CR>

" nnoremap <leader>rg :Rg!<cr>
" vnoremap <leader>rg :call spacevim#plug#fzf#RgVisual()<CR>
"
"function! OpenFloatingWin()
"    let height = &lines - 3
"    let width = float2nr(&columns - (&columns * 2 / 10))
"    let col = float2nr((&columns - width) / 2)

"    " 设置浮动窗口打开的位置，大小等。
"    " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
"    let opts = {
"                \ 'relative': 'editor',
"                \ 'row': height * 0.3,
"                \ 'col': col + 30,
"                \ 'width': width * 2 / 3,
"                \ 'height': height / 2
"                \ }

"    let buf = nvim_create_buf(v:false, v:true)
"    let win = nvim_open_win(buf, v:true, opts)

"    " 设置浮动窗口高亮
"    call setwinvar(win, '&winhl', 'Normal:Pmenu')

"    setlocal
"                \ buftype=nofile
"                \ nobuflisted
"                \ bufhidden=hide
"                \ nonumber
"                \ norelativenumber
"                \ signcolumn=no
"endfunction

"" 让输入上方，搜索列表在下方
"let $FZF_DEFAULT_OPTS = '--layout=reverse'

"" 打开 fzf 的方式选择 floating window
"let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
