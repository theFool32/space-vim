" Define prefix dictionary
let g:spacevim#map#leader#desc =  get(g:, 'spacevim#map#leader#desc', {})
let g:spacevim#map#leader#desc['name'] =  'space-vim root'

let g:spacevim#map#leader#desc['?'] = [ 'Maps', 'show-keybindings' ]

let g:spacevim#map#leader#desc['b'] = {
      \ 'name' : '+buffer'       ,
      \ 'd' :  'delete-buffer'   ,
      \ 'f' :  'first-buffer'    ,
      \ 'k' :  'kill-buffer'     ,
      \ 'l' :  'last-buffer'     ,
      \ 'n' :  'next-buffer'     ,
      \ 'p' :  'previous-buffer' ,
      \ 's' :  'buffer-switch'      ,
      \ }

let g:spacevim#map#leader#desc['e'] = {
      \ 'name' : '+errors'     ,
      \ 'n' : 'next-error'     ,
      \ 'p' : 'previous-error' ,
      \ }

let g:spacevim#map#leader#desc['f'] = {
      \ 'name' : '+files'             ,
      \ 'd' : 'find-current-buffer-in-NERDTree' ,
      \ 's' : 'save-file'                       ,
      \ 't' : 'toggle-NERDTree'                 ,
      \ 'f' : 'files-in-current-direcotry'      ,
      \ 'R' : 'reload-vimrc'                    ,
      \ 'r' : 'file history'                    ,
      \ }

let g:spacevim#map#leader#desc['j'] = {
      \ 'name' : '+jump' ,
      \ 'k' : 'mark word'             ,
      \ 'n' : 'next marked word'             ,
      \ 'N' : 'previous marked word'             ,
      \ }

let g:spacevim#map#leader#desc['g'] = {
      \ 'name' : '+git/version-control' ,
      \ 'b' : ['Gblame'                 , 'fugitive-blame']             ,
      \ 'c' : ['BCommits'               , 'commits-for-current-buffer'] ,
      \ 'C' : ['Gcommit'                , 'fugitive-commit']            ,
      \ 'd' : ['Gdiff'                  , 'fugitive-diff']              ,
      \ 'e' : ['Gedit'                  , 'fugitive-edit']              ,
      \ 'l' : ['Glog'                   , 'fugitive-log']               ,
      \ 'r' : ['Gread'                  , 'fugitive-read']              ,
      \ 's' : ['Gstatus'                , 'fugitive-status']            ,
      \ 'w' : ['Gwrite'                 , 'fugitive-write']             ,
      \ 'p' : ['Git push'               , 'fugitive-push']              ,
      \ }

let g:spacevim#map#leader#desc['l'] = {
      \ 'name' : '+lsp'                               ,
      \ 'a' : ['spacevim#lang#util#CodeAction()'      , 'code-action']      ,
      \ 'c' : ['LanguageClient_contextMenu()'         , 'context-menu']     ,
      \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
      \ 'h' : ['LanguageClient#textDocument_hover()'  , 'hover']            ,
      \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
      \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
      \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
      \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
      \ 'g' : {
        \ 'name': '+goto'                                       ,
        \ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
        \ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
        \ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
        \ }                                                     ,
      \ }

let g:spacevim#map#leader#desc['p'] = {
      \ 'name' : '+projects'                                ,
      \ 'f' : ['spacevim#plug#fzf#FindFileInProject()' , 'find-file-in-project']  ,
      \ 's' : ['Rag'                                        , 'search-in-project']     ,
      \ }

let g:spacevim#map#leader#desc['q'] = [ 'q', 'quit' ]

let g:spacevim#map#leader#desc['Q'] = [ 'qa!', 'quit-without-saving' ]

let g:spacevim#map#leader#desc['s'] = {
      \ 'name' : '+search/show'                   ,
      \ 'c' : 'search-clear-highlight'            ,
      \ 'b' : ['BLines'                           , 'search-in-buffer']       ,
      \ 'j' : 'search-tags-in-buffer'       ,
      \ 'g' : ['Ag!', 'search-with-ag'],
      \ }

function! s:buftag() abort
  if exists(':BTags')
    BTags
  elseif exists(':LeaderfBufTag')
    LeaderfBufTag
  else
    echom "Not avaliable"
  endif
endfunction

let g:spacevim#map#leader#desc['t'] = {
      \ 'name' : '+toggle'                          ,
      \ 'i' : 'indent-guide'         ,
      \ 'p' : ['setlocal paste!'                    , 'paste-mode']           ,
      \ 'g' : 'tagbar',
      \ 'c' : ['spacevim#vim#toggle#CursorColumn()' , 'cursor-column']        ,
      \ 'C' : ['spacevim#vim#toggle#ColorColumn()'  , 'color-column']         ,
      \ }

let g:spacevim#map#leader#desc['x'] = {
      \ 'name' : '+text'           ,
      \ 'd' : ['StripWhitespace'   , 'delete-trailing-whitespace'] ,
      \ }

let g:spacevim#map#leader#desc['w'] = {
      \ 'name' : '+windows'                       ,
      \ 'w' :  'other-window'                     ,
      \ 'd' :  'delete-window'                    ,
      \ '-' :  'split-window-below'               ,
      \ '|' :  'split-window-right'               ,
      \ '2' :  'layout-double-columns'            ,
      \ 'o' :  ['only', 'close-all-windows-except-current'] ,
      \ 'h' :  'window-left'                      ,
      \ 'j' :  'window-below'                     ,
      \ 'l' :  'window-right'                     ,
      \ 'k' :  'window-up'                        ,
      \ 'H' :  'expand-window-left'               ,
      \ 'J' :  'expand-window-below'              ,
      \ 'L' :  'expand-window-right'              ,
      \ 'K' :  'expand-window-up'                 ,
      \ '=' :  'balance-window'                   ,
      \ 's' :  'split-window-below'               ,
      \ 'v' :  'split-window-below'               ,
      \ '?' :  'fzf-window'                       ,
      \ }
