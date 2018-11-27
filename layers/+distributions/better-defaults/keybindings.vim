" Reload .vimrc
nnoremap <Leader>fR :source $MYVIMRC<CR>

" Use Tab to switch buffer
" nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
" if maparg('<C-I>', 'n') != ''
  " nunmap <C-I>
" endif

" vim-better-whitespace
nnoremap <Leader>xd :StripWhitespace<CR>


" util
nnoremap <Leader>tc :call spacevim#vim#toggle#CursorColumn()<CR>
nnoremap <Leader>tC :call spacevim#vim#toggle#ColorColumn()<CR>


