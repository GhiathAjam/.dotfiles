call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'


" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" you complete me config generator

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'


" MEEEE
Plug 'norcalli/nvim-colorizer.lua'
Plug 'github/copilot.vim'
Plug 'jiangmiao/auto-pairs'

" code auto completion
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq.nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Debuggeer
" Plug 'mfussenegger/nvim-dap'
Plug 'puremourning/vimspector'

" Colors
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()



"" MEEE
" line number
set number
set relativenumber
" autoindent + syntax
set smartindent
" width in spaces
set tabstop=2
" auto indentation with in spaces
set shiftwidth=2
" expand to spaces
set expandtab
" search options
set ignorecase
set smartcase
set incsearch
set hlsearch
" better split
set splitright
set splitbelow
set termguicolors

" terminal mode
autocmd TermOpen * startinsert


" auto completion
" This must be set BEFORE require("coq")
let g:coq_settings = { 'auto_start': v:true  }
let g:coq_settings = { 'display.pum.fast_close': v:false  }
lua << EOF
local lsp = require 'lspconfig'
local coq = require 'coq'
-- lsp.pyright.setup(coq.lsp_ensure_capabilities())
lsp.clangd.setup(coq.lsp_ensure_capabilities())
lsp.ccls.setup(coq.lsp_ensure_capabilities())
-- lsp.ccls.setup{}

EOF

" Color hightlight
lua require 'colorizer'.setup{}

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

" beter window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" resize
nnoremap <c-left>  :vert res +3<CR>
nnoremap <c-right> :vert res -3<CR>
nnoremap <c-up>    :res +3<CR>
nnoremap <c-down>  :res -3<CR>

" allign
nmap ga <Plug>(EasyAlign)
" ultisnips
" let g:UltiSnipsExpandTrigger="<c-m>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

colorscheme monokai-phoenix
let g:airline_theme='dark_minimal'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Note: You must define the dictionary first before setting values.
" Also, it's a good idea to check whether it exists as to avoid
" accidentally overwriting its contents.

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'


" If you only see boxes here it may be because your system doesn't have
" the correct fonts. Try it in vim first and if that fails see the help
" pages for vim-airline :help airline-troubleshooting

" c++ files!!!
" compile
autocmd filetype cpp nnoremap <F9> :w <CR> :1000sp <bar> :term g++ -g -fdiagnostics-color -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fstack-protector -D LLOC -std=c++20 % -o %:r <CR> <CR>
" run
" autocmd filetype cpp nnoremap <F10> :!./%:r  :checkt <CR>
autocmd filetype cpp nnoremap <F10> :!./%:r  <CR>

" submit hh
autocmd filetype cpp :command! -nargs=+ Cfsubmit :!cf.exe submit -f % <args> <CR>
