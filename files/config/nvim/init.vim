call plug#begin('~/.local/share/nvim/site/plugged')

" Plugins
Plug 'tpope/vim-sensible'                 " Set up some sensible defaults
Plug 'bling/vim-airline'                  " Sexy Powerline
Plug 'w0rp/ale'                           " Syntax checking
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy search
Plug 'tpope/vim-sleuth'                   " Automagically set tab/shiftwidth by inspecting the current buffer
Plug 'airblade/vim-gitgutter'             " Display changes to the file based on git
Plug 'dracula/vim', { 'as': 'dracula' }   " dracula color scheme
Plug 'airblade/vim-rooter'                " Automagically cd to the nearest git repository
Plug 'posva/vim-vue'                      " Support for .vue files
Plug 'junegunn/fzf.vim'                   " FuzzyFinder and dependencies
Plug 'junegunn/fzf', { 'dir': '~/.fzf/', 'do': './install --all' }
"
Plug 'dahu/vim-asciidoc'                  " AsciiDoc language support and it's dependencies
Plug 'dahu/vimple'
Plug 'dahu/Asif'
Plug 'Raimondi/VimRegStyle'
Plug 'vim-scripts/SyntaxRange'

Plug 'ervandew/supertab'                  " Use Tab for completion stuff
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black', { 'branch': 'stable' }
Plug 'AlessandroYorba/Despacio'           " Colorscheme

call plug#end()

" Hotkeys
let mapleader = " "
noremap <silent> <C-l> :bnext<CR>
noremap <silent> <C-h> :bprevious<CR>
nnoremap <silent> <leader>bn :enew<CR>
nnoremap <silent> <leader>bc :bp <BAR> bd #<CR>

" fzf bindings
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Detect filetypes, load filetype plugins and indent files
filetype plugin indent on

" Set default encoding
set encoding=utf-8

" Enable syntax highlighting
syntax on

" Display line numbers
set number

" Display cursor position & position in file
set ruler

" Allow modified buffers to be hidden
set hidden

" One tab equals 2 spaces
set tabstop=2
set expandtab

" Also shift by 2 when using < / >
set shiftwidth=2

" Let backspace behave like in different editors in insert mode
set backspace=indent,eol,start

" Always display at least 5 lines above/below the current line
set scrolloff=5

" Allow usage of mouse (don't hurt me!)
set mouse=a

" Ignore case in search operations per default
" except when search word is in uppercase
" Also, highlight found keywords
set smartcase
set ignorecase
set hlsearch

" c ... Continue search at the end of a match, not the next character
" e ... Automatically put <CR> when executing a register
" s ... Set buffer options when the buffer is entered for the first time
" displaying the line itself
set cpoptions=ces

" Always display status line
set laststatus=2

" Show command and mode in the last line
set showcmd
set showmode

" Keep command history
set history=200

" Set status line
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\/%L,\ col:\ %c%V\ (%P)%)

" Open files without folding anything
set foldlevelstart=20

" Save undo history to disk so it's available again after
" closing and reopening a file
set undodir=~/.vimdid
set undofile

" Colorscheme
set t_Co=256
set background=dark
color despacio
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Automatically remove trailing whitespace in C/C++/Python files on save
autocmd BufWritePre *.py,*.c,*.h,*.hpp,*.cpp,*.rs :%s/\s\+$//e

if has('nvim')
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
  set inccommand=nosplit
end

" Use ripgrep for searching
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" <leader><leader> to toggle between buffers
nnoremap <leader><leader> <c-^>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"--- Plugin Configuration ---"
" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%*

let g:ale_fix_on_save = 1
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\ }

" vim-airline
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" vimtex
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'

" vim-rooter
let g:rooter_patterns = ['Makefile', '.git', '.git/']

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Format with rustfmt on save
let g:rustfmt_autosave = 1

" Format with black on save
autocmd BufWritePre *.py execute ':Black'
