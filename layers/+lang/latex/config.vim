let g:tex_conceal = ''
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_ignore_all_warnings = 0
let g:vimtex_quickfix_latexlog = {'default' : 0}

set conceallevel=1
let g:tex_conceal='abdmg'


augroup latex
    au!
    " autocmd FileType tex set dictionary=~/.vim/tex_dictionary
    autocmd BufEnter *.tex set ft=tex
    autocmd FileType tex set conceallevel=1
    autocmd BufWritePost *.tex set conceallevel=0
    autocmd BufNew *.tex set conceallevel=0
    autocmd BufWritePost *.json set conceallevel=0
    autocmd BufNew *.json set conceallevel=0
    "autocmd FileType tex 
    "   \ call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer', 'tmux-complete']})
    "autocmd FileType tex nmap <F5> :GrammarousCheck --no-preview<cr>
    autocmd FileType tex nnoremap <F5> :GrammarousCheck<cr>
    autocmd FileType tex nnoremap <F6> <Plug>(grammarous-move-to-next-error)
    autocmd FileType tex nnoremap <F7> <Plug>(grammarous-open-info-window)
augroup end

"abbreviate cvpr compute vision and pattern recognize
