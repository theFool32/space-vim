function! spacevim#vim#autocmd#AddTitle() abort
  let l:template = {
        \ 'sh': [
          \ '#!/usr/bin/env bash'
          \ ],
        \ 'python': [
          \ '#!/usr/bin/env python',
          \ '# -*- coding: utf-8 -*-'
          \ ],
        \}
  let l:ft = &filetype
  if has_key(l:template, l:ft)
    call setline(1, l:template[l:ft])
    normal! G
    call append(line("."), "")
    call append(line("."), "")
    normal! G
    startinsert
  else
    call spacevim#util#err('spacevim#auto#AddTitle not supported in current filetype!')
  endif
endfunction

