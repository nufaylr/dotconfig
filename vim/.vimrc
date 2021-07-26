" Font
set guifont=SFMono\ Nerd\ Font:h16
set linespace=4

"Map esc key to jj
inoremap jj <Esc>

set expandtab "Indent using spaces instead of tabs
set number "Line numbers
set nowrap
set hlsearch "Highlight search matches

"Clear search with shift+enter
nnoremap <CR> :noh<CR><CR>

set nuw=1 "Space line number margin
set laststatus=0 "Hide pointless junk at the bottom
set noshowmode "don't show --INSERT--
set noshowcmd  " to get rid of display of last command
set noruler "don't show line numbers/column/% junk

" Don't parse modelines (google "vim modeline vulnerability").
set nomodeline

" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Don't display the intro message on starting Vim.
set shortmess+=I

" Don't ignore case when search has capital letter
" (although also don't ignore case by default).
set smartcase

set backspace=indent,eol,start

" ==== Plugins =====
call plug#begin('~/.vim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'chrisbra/vim-commentary'
  Plug 'Yggdroot/indentLine'
call plug#end()

" ===== Plugins Configs =====

"Toggle commenting of lines with command + /
nmap <D-/> :Commentary<CR>
vmap <D-/> :Commentary<CR>

"Use JSON in .babelrc files
autocmd BufRead,BufNewFile .babelrc setfiletype json

"Allow JSX in .js files
let g:jsx_ext_required=0

"Mappings for moving lines and preserving indentation
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
