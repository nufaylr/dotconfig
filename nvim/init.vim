
"*************************
"" Plug install packages
"*************************

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()


"*************************
"" Basic Setup
"*************************

syntax enable
syntax on
set number
colorscheme nord
let g:nord_bold_vertical_split_line = 1
set nu
hi Visual cterm=none ctermbg=darkgrey ctermfg=NONE
" Enable mouse use in all modes
set mouse=a
