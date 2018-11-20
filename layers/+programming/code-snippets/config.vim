scriptencoding utf-8

" ultisnips {
let g:UltiSnipsExpandTrigger       = "<Plug>(ultisnips_expand_or_jump)"
let g:UltiSnipsJumpForwardTrigger  = "<Plug>(ultisnips_expand_or_jump)"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"


if has_key(g:plugs, 'ncm2-ultisnips')
    function! UltiSnipsExpandOrJumpOrTab()
        call UltiSnips#ExpandSnippetOrJump()
        if g:ulti_expand_or_jump_res > 0
            return ""
        else
            return "\<Tab>"
        endif
    endfunction
    inoremap <silent> <expr> <c-k> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_try_expand)")
    inoremap <silent> <Plug>(ultisnips_try_expand) <C-R>=UltiSnipsExpandOrJumpOrTab()<CR>
    snoremap <silent> <c-k> <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>
endif
" }
