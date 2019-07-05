MP 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
MP 'kabouzeid/tmux-complete.vim'

" Don't know why coc.nvim doesn't work until I do the autocmd CocNvimInit explicitly
function! s:init_coc(_timer) abort
    autocmd CursorMoved * if &previewwindow != 1 | pclose | endif
    if exists('#User#CocNvimInit')
        doautocmd User CocNvimInit
    endif
endfunction

