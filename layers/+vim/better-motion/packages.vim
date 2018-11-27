" MP 'unblevable/quick-scope'

if g:spacevim.timer
  MP 'easymotion/vim-easymotion'           , { 'on': [] }
  call timer_start(600, 'spacevim#defer#motion')
else
  MP 'easymotion/vim-easymotion'
endif
