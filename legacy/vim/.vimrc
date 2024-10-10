" Keeping same indent as line you're already on unless filetype specific
" 	indenting is required
set autoindent

" Change the background to dark
set background=dark

" Keeps the syntax style consistent
set smartindent

" Display number on the left set number
set number

" Will show matching (), [], and {} set showmatch Vim will ignore auto completing (with TAB) with the following extensions
set wildignore=*.o,*.obj,*.exe

" Does not play a sound when you are at the top/bottom or complete 
"	left/right of a line
set noerrorbells

" Does incremental search, starts searching right away instead of waiting
"	until you press <enter>.
set incsearch

" Colors the column, for this setting, the 80th column of the terminal to
"	light grey
set colorcolumn=80

" Draws a signcolumn on the far left of the terminal when opening a file
set signcolumn=yes

" Show syntax coloring based on file extension
syntax on

" Load filetype specific indent files
filetype indent on

" Indentation settigs to have an indentation of 4 spaces
set shiftwidth=4
set tabstop=4

" To get the lightline plug in to work
set laststatus=2

" Compatibility command for vim-polyglot
set nocompatible

" When spliting windows (e.g. :sp) the new window will be opened below
" 	the current window
set splitbelow


" When spliting windows (e.g. :vsp) the new window will be opened to the
" 	right of the current window
set splitright

" Turn off vim's spell check to use kamykn/spelunker.vim's spellchecker
set nospell

" :PlugInstall to install plugins
" From https://github.com/junegunn/vim-plug
"
" When installing YouCompleMe (ycm) run the following linux commands to install
" 	requisites:
"
" 		sudo apt install build-essential cmake vim-nox mono-complete 
" 		sudo apt install golang nodejs default-jdk npm
"		cd .vim/plugged/YouCompleteMe/
"		python3 install.py --all --rust-completer
"
" 	If there is an error with npm run this command:
"		npm config set strict-ssl=false
call plug#begin('~/.vim/plugged')

Plug 'sjl/badwolf'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/everforest'
Plug 'sainnhe/edge'
Plug 'Xe/lolcode.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'vhdirk/vim-cmake'
Plug 'rust-lang/rust.vim'
Plug 'kamykn/spelunker.vim'

call plug#end()

" Just incase I want to use gruvbox
" let g:gruvbox_italic=1
" colorscheme gruvbox
" let g:lightline = { 'colorscheme' : 'gruvbox', }

" Edge coloscheme settings
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
colorscheme edge
let g:lightline = { 'colorscheme' : 'edge', }

" Everforest colorscheme settings
"let g:everforest_background = 'soft'
"colorscheme everforest
"let g:lightline = { 'colorscheme' : 'everforest' }

" Lightline settings using a default color scheme
"let g:lightline = { 'colorscheme' : 'wombat', }

" Key-remapping and custom commands
" The <leader> key is '\' by default, I want to remap it to space key
let mapleader = " "

" Instead of using ctrl+w twice to move between windows split by :vsp and :sp
" 	<C-h> means ctrl+h and so on
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>

" Rotates horizontally or vertically split windows
nnoremap <leader>r :wincmd r<CR>

" Neat personal commands
nnoremap <leader>p yyp
nnoremap <leader>Y y$
autocmd FileType python inoremap <C-p> print(f"")<left><left>
autocmd FileType rust inoremap <C-p> println!("");<left><left><left>

" Ultra pog remaps for moving text
" Visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Insert mode
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==

" Normal mode (pressing esc)
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Using ycm
" When searching forward, use ctrl+i (<C-i>) and ctrl+o (<C-o>) to go backwards
nnoremap <silent> <leader>gt :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>fi :YcmCompleter FixIt<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0

" Git fugitive remaps
" Equivalent to 'git status', can use 's' to stage (add) and 'u' to unstage
"   type ':bd' to leave
nmap <leader>gs :G<CR>

" Equivalent to 'git log'
nmap <leader>gl :G log<CR>

" Equivalent to 'git commit', will need to edit in vim. Meaning you must go 
"   into insert mode, type commit, then ':wq' to leave
nmap <leader>gc :G commit<CR>

" Pushes to git repo online
nmap <leader>gp :G push<CR>

" Runs 'git diff' on current file
nmap <leader>gd :G diff<CR>
