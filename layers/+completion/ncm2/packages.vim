" space-vim will use completor.vim for vim8 by default.
" If you want to use ncm2 when using vim8, configure it explicitly.
" let g:spacevim_use_ncm2 = 1
let s:plugins = [
            \ 'ncm2/ncm2',
            \ 'roxma/nvim-yarp',
            \ 'ncm2/ncm2-bufword',
            \ 'ncm2/ncm2-tmux',
            \ 'ncm2/ncm2-path',
            \ 'theFool32/ncm2-en',
            \ ]
" \ 'ncm2/ncm2-jedi',
if g:spacevim.vim8
    call add(s:plugins, 'roxma/vim-hug-neovim-rpc')
endif
if spacevim#load('code-snippets')
    call add(s:plugins, 'ncm2/ncm2-ultisnips')
endif
" Enable ncm2 for all buffer
" autocmd CursorHold,InsertEnter * call ncm2#enable_for_buffer()
" autocmd BufEnter * call ncm2#enable_for_buffer()

call extend(g:spacevim.plugins, s:plugins)
