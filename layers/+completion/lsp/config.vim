" Or map each action separately
" nnoremap <silent> gd :call spacevim#lang#util#Definition()<CR>

" If hidden not set, TextEdit might fail.
" Required for operations modifying multiple buffers like rename.
set hidden

if get(g:, 'spacevim_lsp_prefer_coc', 0)
    function! CTab() abort
        let tab_or_snippet = "\<tab>"

        " Provide an option to disable the completion of coc.nvim,
        " since it is not that good for some filetypes. This also means you could
        " enable coc.nvim and ncm2 at the same time.
        if get(g:, 'did_coc_loaded', 0) && get(g:, 'spacevim_enable_coc_completion', 1)
            if pumvisible()
                call feedkeys("\<C-n>", 'n')
            elseif s:check_back_space()
                call feedkeys("\<Tab>", 'n')
            else
                call coc#refresh()
            endif
        else
            let key = pumvisible() ? "\<c-n>" : tab_or_snippet
            call feedkeys(key, 'n')
        endif

        return ''
    endfunction

    " Better display for messages
    "set cmdheight=2

    " Smaller updatetime for CursorHold & CursorHoldI
    set updatetime=300

    " always show signcolumns
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    inoremap <expr> <TAB> CTab()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use <c-space> for trigger completion.
    " inoremap <silent><expr> <F8> coc#refresh()

    " Use <C-x><C-o> to complete 'word', 'emoji' and 'include' sources
    " imap <silent> <C-x><C-o> <Plug>(coc-complete-custom)

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <cr> for confirm completion.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use K for show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    imap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<Plug>(coc-snippets-expand)"

    function! s:show_documentation()
        if &filetype == 'vim'
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Show signature help while editing
    " autocmd CursorHoldI * silent! call CocAction('showSignatureHelp')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')


    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocAction('highlight')

    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    augroup preview
        au!
        autocmd CompleteDone * silent! pclose!
    augroup end

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Use `:Format` for format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` for fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)


elseif get(g:, 'spacevim_lsp_prefer_lsnvim', 0)


    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    " nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    " nnoremap <silent> <leader>fi :call LanguageClient_textDocument_formatting()<CR>

    set hidden

    let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
    let g:LanguageClient_loggingLevel = 'INFO'
    let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
    let g:LanguageClient_loadSettings = 1
    let g:LanguageClient_diagnosticsEnable = 0
    let g:LanguageClient_settingsPath = expand('~/.space-vim/layers/+tools/lsp/settings.json')

    let g:LanguageClient_serverCommands = {
                \ 'c': ['ccls', '--log-file=/tmp/cq.log'],
                \ 'cpp': ['ccls', '--log-file=/tmp/cq.log'],
                \ 'cuda': ['ccls', '--log-file=/tmp/cq.log'],
                \ 'python': ['pyls'],
                \ }

    let g:LanguageClient_diagnosticsDisplay =
                \    {
                \        1: {
                \            "name": "Error",
                \            "texthl": "Error",
                \            "signText": "✖",
                \            "signTexthl": "ErrorMsg",
                \        },
                \        2: {
                \            "name": "Warning",
                \            "texthl": "Warning",
                \            "signText": "⚠",
                \            "signTexthl": "WarningMsg",
                \        },
                \        3: {
                \            "name": "Information",
                \            "texthl": "Type",
                \            "signText": "ℹ",
                \            "signTexthl": "Type",
                \        },
                \        4: {
                \            "name": "Hint",
                \            "texthl": "String",
                \            "signText": "➤",
                \            "signTexthl": "String",
                \        },
                \    }

else

    let g:lsp_log_verbose = 1
    let g:lsp_log_file = expand('~/vim-lsp.log')

    if executable('pyls')
        " pip install python-language-server
        au User lsp_setup call lsp#register_server({
                    \ 'name': 'pyls',
                    \ 'cmd': {server_info->['pyls']},
                    \ 'whitelist': ['python'],
                    \ })
    endif
endif
