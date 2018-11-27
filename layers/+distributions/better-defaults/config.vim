scriptencoding utf-8

" Smarter cursorline {
augroup spacevimCursorline
    autocmd!
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
augroup END
" }

" From tpope
if g:spacevim.gui
    command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
    command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
    noremap + :Bigger<CR>
    noremap - :Smaller<CR>
endif


map <nop> <Plug>InterestingWords
nnoremap <silent> <leader>jk :call InterestingWords('n')<cr>
vnoremap <silent> <leader>jk :call InterestingWords('v')<cr>
nnoremap <silent> <leader>jK :call UncolorAllWords()<cr>

nnoremap <silent> <leader>jn :call WordNavigation(1)<cr>
nnoremap <silent> <leader>jN :call WordNavigation(0)<cr>

map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)

" nmap n <Plug>(anzu-n-with-echo)
" nmap N <Plug>(anzu-N-with-echo)
" nmap * <Plug>(anzu-star-with-echo)
" nmap # <Plug>(anzu-sharp-with-echo)
" }

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/keybindings.vim'
let g:startify_custom_indices = ['u', 'i', 'o', 'p', ';', 'n', 'm']

hi CurrentWord ctermbg=0
let g:vim_current_word#highlight_current_word = 0
