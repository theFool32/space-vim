" if g:spacevim.os.mac
" Plug 'ybian/smartim'
" endif

MP 'lfv89/vim-interestingwords'
if g:spacevim.timer
    MP 'kshenoy/vim-signature'        , { 'on': [] }
    MP 'tpope/vim-rsi'                , { 'on': [] }
    MP 'xtal8/traces.vim'             , { 'on': [] }
    MP 'dominikduda/vim_current_word' , { 'on': [] }
    call timer_start(500, 'spacevim#defer#defaults')
else
    MP 'tpope/vim-rsi'
    MP 'kshenoy/vim-signature'
endif

MP 't9md/vim-choosewin', { 'on': '<Plug>(choosewin)' }
" MP 'mhinz/vim-startify', { 'on': 'Startify' }
MP 'mhinz/vim-startify'
" autocmd! User vim-startify call spacevim#autocmd#startify#Init()
" augroup spacevimStart
"     autocmd!
"     autocmd VimEnter *
"                 \   if !argc()
"                 \|    call plug#load('vim-startify')
"                 \|    silent! Startify
"                 \|  endif
" augroup END

MP 'haya14busa/is.vim'
MP 'osyo-manga/vim-anzu', { 'on': ['<Plug>(anzu-n-with-echo)', '<Plug>(anzu-N-with-echo)'] }
