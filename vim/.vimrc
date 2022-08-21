set history=200
set ruler
set display=truncate
set incsearch
set hlsearch
"nnoremap <esc> :noh<return><esc>
syntax on

" plugins
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'aklt/plantuml-syntax'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mzlogin/vim-markdown-toc'
call plug#end()

" customize project explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" customize limelight
let g:limelight_conceal_ctermfg = 'gray'

" handle backup, swap and undo files
" https://coderwall.com/p/sdhfug/vim-swap-backup-and-undo-files
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
