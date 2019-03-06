scriptencoding utf-8

" let g:ale_set_highlights = 0
 let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = g:spacevim.gui ? 'Error' : '✹ Error'
let g:ale_echo_msg_warning_str = g:spacevim.gui ? 'Warning' : '⚠ Warning'

" nmap <Leader>en <Plug>(ale_next)
" nmap <Leader>ep <Plug>(ale_previous)
" nnoremap <Leader>ts :ALEToggle<CR>

"let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_python_mypy_options = '--disallow-untyped-defs'
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_linters = {
            \   'python': ['flake8'],
            \}
            "\   'python': ['flake8', 'mypy'],
let g:ale_fixers = {
            \   'python': ['black'],
            \   'cpp': ['clang-format'],
            \}
let g:ale_sign_column_always = 1
" let g:ale_virtualtext_cursor = 1

" nnoremap gd :ALEGoToDefinition<CR>
