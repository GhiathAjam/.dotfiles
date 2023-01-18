" Views / ShaDa
" Debug !
" SNIPS


" views vs ShaDa files

" views for folds
autocmd BufWinLeave *.cpp,*.txt,*.vim,*.lua silent  mkview
autocmd BufWinEnter *.cpp,*.txt,*.vim,*.lua silent! loadview



" debug!
let g:vimspector_sign_priority = {
  \    'vimspectorBP':         20,
  \ }
let g:vimspector_code_minwidth = 70
let g:vimspector_terminal_minwidth = 27
let g:vimspector_sidebar_width = 42

nnoremap <F2> <Plug>VimspectorToggleBreakpoint <CR>
nnoremap <F4> :VimspectorReset <CR>
nnoremap <F5> <Plug>VimspectorContinue <CR>
nnoremap <F6> <Plug>VimspectorStepOver <CR>
nnoremap <F7> <Plug>VimspectorStepInto <CR>
nnoremap <F8> <Plug>VimspectorStepOut <CR>

" ultisnips
" let g:UltiSnipsExpandTrigger="<c-m>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

