nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>fi :call LanguageClient_textDocument_formatting()<CR>

set hidden

let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = expand('~/.space-vim/layers/+tools/lsp/settings.json')

let g:LanguageClient_serverCommands = {
      \ 'c': ['ccls', '--log-file=/tmp/cq.log'],
      \ 'cpp': ['ccls', '--log-file=/tmp/cq.log'],
      \ 'cuda': ['ccls', '--log-file=/tmp/cq.log'],
      \ 'python': [$HOME . '/.pyenv/shims/pyls', '--log-file=/tmp/pyls.log'],
      \ }

let g:LanguageClient_diagnosticsDisplay =
      \    {
      \        1: {
      \            "name": "Error",
      \            "texthl": "Error",
      \            "signText": "✖",
      \            "signTexthl": "ErrorMsg",
      \        },
      \        2: {
      \            "name": "Warning",
      \            "texthl": "Warning",
      \            "signText": "⚠",
      \            "signTexthl": "WarningMsg",
      \        },
      \        3: {
      \            "name": "Information",
      \            "texthl": "Type",
      \            "signText": "ℹ",
      \            "signTexthl": "Type",
      \        },
      \        4: {
      \            "name": "Hint",
      \            "texthl": "String",
      \            "signText": "➤",
      \            "signTexthl": "String",
      \        },
      \    }

