scriptencoding utf-8

if g:spacevim.gui

  " 解决菜单栏乱码
  let $LANG = 'zh_CN.UTF-8'
  set langmenu=zh_CN
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif

vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
" noremap <leader>yd :<C-u>Yde<CR>
"
function CJKInput()
	let l:cmd = 'zenity --entry --text=CJK-Input 2>/dev/null'
	let l:output = system(l:cmd)
	let l:output = substitute(l:output, '[\r\n]*$', '', '')
	execute 'normal i' . l:output
endfunction
nmap <silent> <leader>i :call CJKInput()<CR>
