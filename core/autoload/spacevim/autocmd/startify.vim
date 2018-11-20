scriptencoding utf-8

function! s:get_nvim_version()
    redir => l:s
    silent! version
    redir END
    return matchstr(l:s, 'NVIM v\zs[^\n]*')
endfunction

let s:version = g:spacevim.nvim ? 'nvim '.s:get_nvim_version() : 'vim '.v:version

let s:list_order = [
            \ ['   Recent Files:'],
            \ 'files',
            \ ['   Project:'],
            \ 'dir',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ['   Commands:'],
            \ 'commands',
            \ ]
function! spacevim#autocmd#startify#Init()
  let g:startify_list_order = s:list_order
  let g:startify_change_to_vcs_root = 1
endfunction
