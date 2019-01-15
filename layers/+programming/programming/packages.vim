if g:spacevim.timer
  MP 'luochen1990/rainbow'  , { 'on': [] }
  MP 'sheerun/vim-polyglot' , { 'on': [] }
   "MP 'airblade/vim-rooter'  , { 'on': []}
  " MP 'editorconfig/editorconfig-vim', { 'on': []}
  call timer_start(400, 'spacevim#defer#programming')
else
  MP 'luochen1990/rainbow'
  MP 'sheerun/vim-polyglot'
  " MP 'airblade/vim-rooter'
  " MP 'editorconfig/editorconfig-vim'
endif

" MP 'junegunn/rainbow_parentheses.vim', { 'for': ['lisp', 'clojure', 'scheme'] }

" Need to disable airline extension for tagbar, see vim-airline issue 1313.
MP 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

"MP 'Yggdroot/indentLine',             { 'on': 'IndentLinesToggle' }
MP 'Yggdroot/indentLine'

MP 'skywind3000/asyncrun.vim',        { 'on': ['AsyncRun!', 'AsyncRun'] }

MP 'Shougo/echodoc.vim'
