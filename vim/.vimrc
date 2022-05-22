" plugins
call plug#begin('~/.vim/plugged')
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elzr/vim-json'
call plug#end()

" project drawer on the left
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

