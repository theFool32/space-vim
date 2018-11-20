set cc=80

set shell=zsh

" let mapleader=' '
" let maplocalleader=','

inoremap jk <ESC>

vmap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <c-c> "+y
noremap <c-v> a<space><esc>"+gPx
inoremap <c-v> <space><esc>"+gPxa

noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader><leader>q :q!<cr>
noremap <leader><leader>b :bd<cr>
nnoremap <f9> :tabe %:p:h<cr>
noremap <C-S> :update<CR>

" vim:fdm=marker
" Misc {{{
set shell=zsh
set incsearch
"set autochdir
set conceallevel=1
set mouse=a
set updatetime=100
" set shortmess+=a
"set cmdheight=2
"}}}

"File {{{
set fileformats=unix,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" set ambiwidth=double
set langmenu=zh_CN.UTF-8
syntax on
filetype plugin indent on
set nobackup
set noswapfile
"}}}

"Indent {{{
set ts=4
set expandtab
set shiftwidth=4
" set autoindent
set smartindent
"}}}

"UI {{{
set wrap
set list
" set lcs=tab:>-,eol:¬

set guifont=Source\ Code\ Pro\ 10
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set number
set relativenumber
set cursorline
set cursorcolumn
set cc=80

"}}}

"Complete {{{
set wildmenu
"set completeopt=longest,menu
"set completeopt=noinsert,menuone,noselect,preview
set completeopt=noinsert,menuone,noselect
set wildmode=full
"}}}

"Fold {{{
set foldmethod=indent
set nofoldenable
"}}}

"StatusLine {{{
"let g:airline_section_b = '%{strftime("%d/%m/%y %H:%M")}'
"}}}

hi ColorColumn guibg=#3d4646

if has("nvim")
    let g:python3_host_prog = $HOME . "/.pyenv/shims/python"
endif

" vim:fdm=marker
"Fcitx {{{
function! s:fcitx2en()
  call system("fcitx-remote -s fcitx-keyboard-us")
endfunction
augroup fcitx " {
    au!
autocmd InsertLeave * call s:fcitx2en()
augroup end " }
"}}}


augroup HighlightWordUnderCursor
    au!
    set updatetime=10
    function! HighlightWordUnderCursor()
        if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
            exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/' 
        else 
            match none 
        endif
    endfunction
    "autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
augroup end

augroup sync
    au!
    "autocmd BufWritePost *.py AsyncRun rc 
augroup end


augroup preview
    au!
    autocmd CompleteDone * silent! pclose!
augroup end

