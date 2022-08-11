" Keeping same indent as line you're already on unless filetype specific
" 	indenting is required
set autoindent

" Change the background to dark
set background=dark

" Keeps the syntax style consistent
set smartindent

" Display number on the left
set number

" Will show matching (), [], and {}
set showmatch

" Vim will ignore auto completing (with TAB) with the following extensions
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
filetype plugin indent on

" Indentation settings to have an indentation of 4 spaces
set shiftwidth=4
set tabstop=4

" To get the lightline plug in to work
set laststatus=2

" Compatibility command for vim-polyglot
set nocompatible

" When splitting windows (e.g. :sp) the new window will be opened below
" 	the current window
set splitbelow

" When splitting windows (e.g. :vsp) the new window will be opened to the
" 	right of the current window
set splitright

" Turn off vim's spell check to use kamykn/spelunker.vim's spellchecker
set nospell

" :PlugInstall to install plugins
" From https://github.com/junegunn/vim-plugs

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'sjl/badwolf'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/everforest'
Plug 'sainnhe/edge'

" Autocomplete engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Status line extension
Plug 'itchyny/lightline.vim'
" Git integration for vim
Plug 'tpope/vim-fugitive'

" Syntax highlighting for practically all languages
Plug 'sheerun/vim-polyglot'

" Rust syntax plugin
Plug 'rust-lang/rust.vim'

" Spellcheck
Plug 'kamykn/spelunker.vim'

call plug#end()

" Just incase I want to use badwolf
" colorscheme badwolf

" Just incase I want to use gruvbox
" colorscheme gruvbox

" Edge colorscheme settings
if has('termguicolors')
	set termguicolors
endif
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
colorscheme edge
let g:lightline = { 'colorscheme' : 'edge', }

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

" Coc key updates
" Formatting selected code
" nmap <leader>f <Plug>(coc-format-selected)

" Enables use of <TAB> to navigate autocomplete
function! s:check_back_space() abort
 	let col = col('.') - 1
 	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enables <CR> (aka Enter key) to confirm selection for autocompletion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<CR>"

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
