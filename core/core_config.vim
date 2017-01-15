let s:spacevim_layers_dir = '/layers'
let s:spacevim_private_layers_dir = '/private'
let s:dot_spacevim = $HOME.'/.spacevim'

let s:spacevim_tab = get(s:, 'spacevim_tab', -1)
let s:spacevim_buf = get(s:, 'spacevim_buf', -1)

let g:spacevim_nvim = has('nvim') && exists('*jobwait') && !g:WINDOWS
let g:spacevim_vim8 = has('patch-8.0.0039') && exists('*job_start')
let g:spacevim_gui_running = has('gui_running')

let g:layers_loaded = []

autocmd BufRead,BufNewFile *.spacevim setlocal filetype=vim

" argument plugin is the vim plugin's name
function! IsDir(plugin)
    if isdirectory(expand(g:my_plug_home.a:plugin))
        return 1
    else
        return 0
    endif
endfunction

function! LayerLoaded(layer)
    if index(g:layers_loaded, a:layer) > -1
        return 1
    else
        return 0
    endif
endfunction

" get the whole available layers number s:layers_sum, number
" get the topics s:topics, list
" get the pair topic to layers s:topic2layers, dict
function! s:collect_topics()

let py_exe = has('python') ? 'python' : 'python3'

execute py_exe "<< EOF"
import os
import vim
topic_base = vim.eval('g:spacevim_dir') + vim.eval('s:spacevim_layers_dir')
private_base = vim.eval('g:spacevim_dir') + vim.eval('s:spacevim_private_layers_dir')
topics = [f for f in os.listdir(topic_base) if os.path.isdir(os.path.join(topic_base,f))]
topic2layers = {}
private_layers = [f for f in os.listdir(private_base) if os.path.isdir(os.path.join(private_base,f))]
layers_sum = len(private_layers)
for t in topics:
    topic_path = topic_base + '/' + t
    layers = [f for f in os.listdir(topic_path) if os.path.isdir(os.path.join(topic_path,f))]
    layers_sum = layers_sum + len(layers)
    topic2layers[t] = layers
vim.command("let s:layers_sum = %d" % layers_sum)
vim.command("let s:topics = %s" % topics)
vim.command("let s:topic2layers = %s" % topic2layers)
vim.command("let s:private_layers = %s" % private_layers)
EOF

endfunction

call s:collect_topics()

function! s:err(msg)
    echohl ErrorMsg
    echom '[space-vim] '.a:msg
    echohl None
endfunction

function! s:warn(cmd, msg)
    echohl WarningMsg
    echom '[space-vim] '.a:msg
    echohl None
endfunction

function! s:check_vim_plug(plug_path)
    if empty(glob(a:plug_path))
        echo '==> Downloading vim-plug ......'
        execute '!curl -fLo ' . a:plug_path . ' --create-dirs ' . 
                    \   'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif
endfunction

function! LayersBegin()

    let l:vim_plug_path = '~/.vim/autoload/plug.vim'
    let l:nvim_plug_path = '~/.local/share/nvim/site/autoload/plug.vim'

    " Download vim-plug if unavailable
    if g:spacevim_nvim
        call s:check_vim_plug(l:nvim_plug_path)
    else
        call s:check_vim_plug(l:vim_plug_path)
    endif

    let s:vim_home = $HOME.'/.vim/'

    if !exists('g:my_plug_home')
        let g:my_plug_home = s:vim_home.'plugged/'
    endif

    call plug#begin(g:my_plug_home)

    call s:define_command()

endfunction

function! s:define_command()
    command! -nargs=+ -bar Layer call s:add_layer(<f-args>)

    " MP means MyPlugin
    command! -nargs=+ -bar MP call s:add_element(<f-args>)

    command! -nargs=+ -bar Exclude call s:exclude_elements(<f-args>)

    command! -nargs=0 -bar LayerClean call s:layer_clean()
    command! -nargs=0 -bar LayerStatus call s:layer_status()
    command! -nargs=0 -bar LayerUpdate call s:layer_update()
    command! -nargs=0 -bar LayerInstall call s:layer_install()
endfunction

function! s:add_layer(...)
    if a:0 == 0
        return s:err('Argument missing: layer name(s) required.')
    elseif a:0 == 1
        call add(g:layers_loaded, eval(a:1))
    else
        call s:err('Options not supported now. Sorry for that.')
    endif
endfunction

let s:TYPE = {
            \   'string':  type(''),
            \   'list':    type([]),
            \   'dict':    type({}),
            \   'funcref': type(function('call'))
            \ }

function! s:to_string(list)
    let str = ''
    for i in a:list
        let str .= i
    endfor
    return str
endfunction

let g:spacevim_elements = []

function! s:add_element(...)
    if a:0 == 0
        return s:err('Argument missing: element name(s) required.')
    else
        let l:str = s:to_string(a:000)
        call add(g:spacevim_elements, l:str)
    endif
endfunction

let g:spacevim_exclude = []
function! s:exclude_elements(...)
    if a:0 == 0
        return s:err('Argument missing: element name(s) required.')
    else
        let l:str = s:to_string(a:000)
        call add(g:spacevim_exclude, l:str)
    endif
endfunction

function! s:layer_install()
    execute 'PlugInstall'
endfunction

function! s:layer_update()
    execute 'PlugUpdate'
endfunction

function! s:layer_clean()
    execute 'PlugClean'
endfunction

function! s:new_window()
    execute get(g:, 'spacevim_window', 'vertical topleft new')
endfunction

function! s:spacevim_window_exists()
    let l:buflist = tabpagebuflist(s:spacevim_tab)
    return !empty(l:buflist) && index(l:buflist, s:spacevim_buf) >= 0
endfunction

function! s:assign_name()
    " Assign buffer name
    let l:prefix = '[Layers]'
    let l:name   = l:prefix
    let l:idx    = 2
    while bufexists(l:name)
        let l:name = printf('%s (%s)', l:prefix, l:idx)
        let l:idx = l:idx + 1
    endwhile
    silent! execute 'f' fnameescape(l:name)
endfunction

function! s:layer_status()
    call s:new_window()

    let b:spacevim_preview = -1
    let s:spacevim_tab = tabpagenr()
    let s:spacevim_buf = winbufnr(0)
    call s:assign_name()

    let [l:cnt, l:total] = [0, len(g:layers_loaded)]

    call append(0, ['Enabled layers: ' . '(' . len(g:layers_loaded) . '/' . s:layers_sum . ')'])
    call setline(2, '[' . repeat('=', len(g:layers_loaded)) . ']')
    let l:inx = 3
    for l:layer in g:layers_loaded
        call setline(l:inx, '+ ' . l:layer)
        let l:inx = l:inx + 1
    endfor
    setlocal buftype=nofile bufhidden=wipe nobuflisted nolist noswapfile nowrap cursorline nomodifiable nospell
    setf spacevim
    if exists('g:syntax_on')
        call s:syntax()
    endif
endfunction

function! s:syntax()
    syntax clear
    syntax region Layer1 start=/\%1l/ end=/\%2l/ contains=LayerNumber
    syntax region Layer2 start=/\%2l/ end=/\%3l/ contains=LayerBracket,LayerX
    syn match LayerNumber /[0-9]\+[0-9.]*/ contained
    syn match LayerBracket /[[\]]/ contained
    syn match LayerX /x/ contained
    syn match LayerDash /^-/
    syn match LayerPlus /^+/
    syn match LayerStar /^*/
    syn match LayerMessage /\(^- \)\@<=.*/
    syn match LayerName /\(^- \)\@<=[^ ]*:/
    syn match LayerSha /\%(: \)\@<=[0-9a-f]\{4,}$/
    syn match LayerTag /(tag: [^)]\+)/
    syn match LayerInstall /\(^+ \)\@<=[^:]*/
    syn match LayerUpdate /\(^* \)\@<=[^:]*/
    syn match LayerCommit /^  \X*[0-9a-f]\{7} .*/ contains=LayerRelDate,LayerEdge,LayerTag
    syn match LayerEdge /^  \X\+$/
    syn match LayerEdge /^  \X*/ contained nextgroup=LayerSha
    syn match LayerSha /[0-9a-f]\{7}/ contained
    syn match LayerRelDate /([^)]*)$/ contained
    syn match LayerNotLoaded /(not loaded)$/
    syn match LayerError /^x.*/
    syn region LayerDeleted start=/^\~ .*/ end=/^\ze\S/
    syn match LayerH2 /^.*:\n-\+$/
    syn keyword Function LayerInstall LayerStatus LayerUpdate LayerClean
    hi def link Layer1       Title
    hi def link Layer2       Repeat
    hi def link LayerH2      Type
    hi def link LayerX       Exception
    hi def link LayerBracket Structure
    hi def link LayerNumber  Number

    hi def link LayerDash    Special
    hi def link LayerPlus    Constant
    hi def link LayerStar    Boolean

    hi def link LayerMessage Function
    hi def link LayerName    Label
    hi def link LayerInstall Function
    hi def link LayerUpdate  Type

    hi def link LayerError   Error
    hi def link LayerDeleted Ignore
    hi def link LayerRelDate Comment
    hi def link LayerEdge    PreProc
    hi def link LayerSha     Identifier
    hi def link LayerTag     Constant

    hi def link LayerNotLoaded Comment
endfunction

function! s:check_dot_spacevim()
    if filereadable(expand(s:dot_spacevim))
        call Source(s:dot_spacevim)
        return 1
    else
        echom '.spacevim does not exist!!!'
        return 0
    endif
endfunction

function! LayersEnd()

    if s:check_dot_spacevim()

        call Layers()

        call s:load_layer_packages()
        call s:load_private_packages()

        call s:filter_and_invoke_plug()

        call UserInit()

        """""""""""""""""""""""""""""""""""""""
        " Plug ends.
        """""""""""""""""""""""""""""""""""""""
        call plug#end()

        if exists('g:spacevim_leader')
            let g:mapleader=g:spacevim_leader
        else
            let g:mapleader = "\<Space>"
        endif

        if exists('g:spacevim_localleader')
            let g:maplocalleader=g:spacevim_localleader
        else
            let g:maplocalleader = ','
        endif

        " Make vim-better-default settings can be overrided
        runtime! plugin/default.vim

        call s:load_layer_config()
        call s:load_private_config()

        call UserConfig()

        call s:post_user_config()
    endif

endfunction

function! s:filter_and_invoke_plug()
    for e in g:spacevim_elements
        if !(index(g:spacevim_exclude, split(e, ',')[0]) > -1)
            execute 'Plug' . e
        endif
    endfor
endfunction

" Return the layer's base dir
function! s:cur_layer_base_dir(layer)

    let l:layers_base = g:spacevim_dir . s:spacevim_layers_dir
    for [key, val] in items(s:topic2layers)
        if index(val, a:layer) > -1
            return l:layers_base . '/' . key . '/'
        endif
    endfor

    " Try the private layers
    let l:private_layers_base = g:spacevim_dir . s:spacevim_private_layers_dir
    if index(s:private_layers, a:layer) > -1
        return l:private_layers_base . '/'
    endif
    return s:err('Layer * ' . a:layer . ' * is invalid, please check it.')
endfunction

function! s:load_layer_packages()
    for l:layer in g:layers_loaded
        let l:layer_packages = s:cur_layer_base_dir(l:layer) . l:layer . '/packages.vim'
        call Source(l:layer_packages)
    endfor
endfunction

function! s:load_private_packages()
    let l:private_packages = g:spacevim_dir . '/private/packages.vim'
    if filereadable(expand(l:private_packages))
        execute 'source ' . fnameescape(l:private_packages)
    endif
endfunction

function! s:load_layer_config()
    for l:layer in g:layers_loaded
        let l:layer_config = s:cur_layer_base_dir(l:layer) . l:layer . '/config.vim'
        call Source(l:layer_config)
    endfor
endfunction

function! s:load_private_config()
    let l:private_config = g:spacevim_dir . '/private/config.vim'
    if filereadable(expand(l:private_config))
        execute 'source ' . fnameescape(l:private_config)
    endif
endfunction

function! s:statusline_hi()
    " default bg for statusline is 236 in space-vim-dark
    hi win_num     cterm=bold ctermfg=232 ctermbg=179 gui=bold guifg=#080808 guibg=#d7af5f
    hi ale_error   cterm=None ctermfg=197 ctermbg=237 gui=None guifg=#e0211d guibg=#3a3a3a
    hi ale_warning cterm=None ctermfg=214 ctermbg=237 gui=None guifg=#dc752f guibg=#3a3a3a

    hi User1 cterm=bold ctermfg=232 ctermbg=179 gui=bold guifg=#080808 guibg=#d7af5f
    hi User2 cterm=None ctermfg=214 ctermbg=243 gui=None guifg=#ffaf00 guibg=#666666
    hi User3 cterm=None ctermfg=251 ctermbg=241 gui=None guifg=#c6c6c6 guibg=#585858
    hi User4 cterm=None ctermfg=177 ctermbg=239 gui=None guifg=#d787ff guibg=#4e4e4e
    hi User5 cterm=None ctermfg=208 ctermbg=238 gui=None guifg=#ff8700 guibg=#3a3a3a
    hi User6 cterm=Bold ctermfg=178 ctermbg=237 gui=Bold guifg=#d7af00 guibg=#3a3a3a
    hi User7 cterm=None ctermfg=250 ctermbg=238 gui=None guifg=#bcbcbc guibg=#444444
    hi User8 cterm=None ctermfg=249 ctermbg=239 gui=None guifg=#b2b2b2 guibg=#4e4e4e
    hi User9 cterm=None ctermfg=249 ctermbg=241 gui=None guifg=#b2b2b2 guibg=#606060
endfunction

function! s:post_user_config()
    " airline
    if !exists('g:airline_powerline_fonts')

        let g:airline_left_sep=''
        let g:airline_right_sep=''

        let g:airline_symbols = {}
        let g:airline_symbols.linenr = '␊'
        let g:airline_symbols.linenr = '␤'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇'
        let g:airline_symbols.paste = 'Þ'
        let g:airline_symbols.whitespace = 'Ξ'
    endif

    " User-defined highlightings shoule be put after colorscheme command.
    call s:statusline_hi()

    " https://github.com/junegunn/vim-plug/issues/574
    if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        echom '[space-vim]Some layers need to install the missing plugins first!'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | q
    endif

endfunction
