if get(g:, 'spacevim_lsp_prefer_coc', 0)
    MP 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
    " MP 'neoclide/coc-jedi', {'do': 'yarn install'}

    " Don't know why coc.nvim doesn't work until I do the autocmd CocNvimInit explicitly
    function! s:init_coc(_timer) abort
        autocmd CursorMoved * if &previewwindow != 1 | pclose | endif
        if exists('#User#CocNvimInit')
            doautocmd User CocNvimInit
        endif
    endfunction

    " call timer_start(1000, function('s:init_coc'))

elseif get(g:, 'spacevim_lsp_prefer_lsnvim', 0)
    MP 'autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'bash install.sh',
                \ }

else
    MP 'prabirshrestha/async.vim'
    MP 'prabirshrestha/vim-lsp'
endif
