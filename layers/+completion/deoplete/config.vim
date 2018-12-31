" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('min_pattern_length', 1)
call deoplete#custom#option('auto_refresh_delay', 1)
call deoplete#custom#option('auto_complete_delay', 0)
" Change clang binary path
call deoplete#custom#option({
            \ 'smart_case': v:true,
            \ })
call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex': g:vimtex#re#deoplete
            \})

