MP 'scrooloose/nerdcommenter'
MP 'jiangmiao/auto-pairs'
MP 'tpope/vim-surround'

augroup spacevimAutoPairs
    autocmd!
    autocmd CursorHold,CursorHoldI,InsertEnter * call plug#load('auto-pairs') | call AutoPairsTryInit() | autocmd! spacevimAutoPairs
augroup END
