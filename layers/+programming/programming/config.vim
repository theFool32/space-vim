scriptencoding utf-8

augroup spacevimNewFile
    autocmd!
    " Add title automatically when new files and move cursor to the end of file
    autocmd BufNewFile *.py,*.sh call spacevim#vim#autocmd#AddTitle()
augroup END

" rainbow {
let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['#4F97D7', '#D75F87', '#D697E6', '#40AF81', '#DA61AE', '#70AF67'],
            \   'ctermfgs': ['68', '168', '176', '104', '73', '212'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', '#FF69B4', '#DDA0DD', '#F08080', '#FF8C00', '#20B2AA'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \   }
            \}
" }

" tagbar {
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
nnoremap <F6> :TagbarToggle<CR>
inoremap <F6> <ESC>:TagbarToggle<CR>
nnoremap <Leader>tg :TagbarToggle<CR>
" }

" asyncrun.vim {
" let g:asyncrun_open = float2nr(round(winheight('%') * 0.1))
" let g:asyncrun_silent = 1
" nnoremap <F5> :call spacevim#plug#asyncrun#CompileAndRun()<CR>
" }

" vim-indent-guides {
nnoremap <Leader>ti :IndentLinesToggle<CR>
let g:indentLine_char = '|'
" }

" vim-polyglot {
" Reset errorformat to its default value for cooperating with asyncrun.vim
let g:polyglot_disabled = ['latex']
" autocmd BufEnter * set errorformat&
" }

" vim-rooter {
" To stop vim-rooter echoing the project directory
" let g:rooter_silent_chdir = 1
" }


" echodoc {
let g:echodoc#enable_at_startup=1
" }
