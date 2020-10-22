" Font
set guifont=SFMono\ Nerd\ Font:h16
set linespace=4

"Map esc key to jj
inoremap jj <Esc> 

set expandtab "Indent using spaces instead of tabs
set shiftwidth=2 "The number of spaces to use for each indent
set softtabstop=2" "Number of spaces to use for a <Tab> during editing operations
set number "Line numbers
set nowrap
set hlsearch "Highlight search matches

"Clear search with shift+enter
nnoremap <S-CR> :noh<CR>

set nuw=1 "Space line number margin 
set laststatus=0 "Hide pointless junk at the bottom
set noshowmode "don't show --INSERT--
set noshowcmd  " to get rid of display of last command
set noruler "don't show line numbers/column/% junk
set signcolumn=yes
set cursorline 

" ==== Plugins =====
call plug#begin('~/.vim/plugged')

  Plug 'ayu-theme/ayu-vim'
  Plug 'preservim/nerdtree'

  Plug 'sheerun/vim-polyglot'
  Plug 'ervandew/supertab'
  Plug 'chrisbra/vim-commentary'
  Plug 'Yggdroot/indentLine'
  
  "Search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'

  "Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'},

  Plug 'jiangmiao/auto-pairs'
  Plug 'mitermayer/vim-prettier'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-rooter'
  Plug 'mattn/emmet-vim'
  Plug 'AndrewRadev/tagalong.vim'
  Plug 'tpope/vim-surround'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" ===== Plugins Configs =====

"Toggle commenting of lines with command + /
nmap <D-/> :Commentary<CR>
vmap <D-/> :Commentary<CR>

"Fzf 
nmap <D-f> :GFiles<CR>
nmap <D-p> :Ag<CR>
nmap <D-e> :Buffers<CR>
"git statue
nmap <D-g> :GFiles?<CR>

"Run prettier asynchronously before saving
let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

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

"Prettier
nnoremap = :Prettier<CR>

"Tagalong <cw>
let g:tagalong_verbose = 1
let g:tagalong_filetypes = ['html', 'xml', 'jsx', 'eruby', 'ejs', 'eco', 'php', 'htmldjango', 'javascriptreact', 'typescriptreact', 'javascript']

"Emmet
let g:user_emmet_leader_key=','

"AirLine
let g:airline_theme='ayu_dark'

"AirLine Shorten statue
let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.linenr=' '
let g:airline_section_y = ''
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
let g:airline#extensions#nerdtree_statusline = 0 

"AirLine Section Z
au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['%3p%%', 'linenr', 'maxlinenr'])

"AirLine Section C 
au User AirLineAfterInit :let g:airline_section_c='%t' 

"NERDTree file explorer
nmap <D-1> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = '' "Hide status

"Hide NERDTree file path 
augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
  \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
  \ | setlocal concealcursor=n
augroup end

" ===== COC bye ALE for now :) =====

"GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" IndentLine {{
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = ' '
let g:indentLine_first_char = ' '
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }}

