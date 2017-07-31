call plug#begin('~/.local/share/nvim/site/plugged')

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction

" Plugins
Plug 'tpope/vim-sensible'                 " Set up some sensible defaults
Plug 'bling/vim-airline'                  " Sexy Powerline
Plug 'scrooloose/syntastic'               " Syntax checking
"Plug 'klen/python-mode'                   " Special Python stuff
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy search
Plug 'tpope/vim-sleuth'                   " Automagically set tab/shiftwidth by inspecting the current buffer
Plug 'airblade/vim-gitgutter'             " Display changes to the file based on git
Plug 'ghtyrant/vim-github-colorscheme'    " Github colors
Plug 'amiorin/vim-project'                " Project management
Plug 'arakashic/chromatica.nvim', {
  \ 'do': ':UpdateRemotePlugins' }        " clang based syntax coloring for c++
Plug 'rdnetto/YCM-Generator'
Plug 'Valloric/YouCompleteMe', {
  \ 'do': function('BuildYCM') }

" Unused plugins
"Plug 'vim-scripts/taglist.vim'
"Plug 'wting/rust.vim'
"Plug 'tpope/vim-vinegar'                  

call plug#end()

" Hotkeys
let mapleader = " "
noremap <silent> <C-l> :bnext<CR>
noremap <silent> <C-h> :bprevious<CR>
nnoremap <silent> <leader>bn :enew<CR>
nnoremap <silent> <leader>bc :bp <BAR> bd #<CR>

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

" Colorscheme
colorscheme github

" Automatically remove trailing whitespace in C/C++/Python files on save
autocmd BufWritePre *.py,*.c,*.h,*.hpp,*.cpp :%s/\s\+$//e

"--- Plugin Configuration ---"
let g:netrw_liststyle = 1

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-airline
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" ctrlp
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag', 'undo']

let g:ctrlp_working_path_mode = 'ra'

" vim-project
let g:project_enable_welcome = 1      " Display welcome screen (currently does not work?)

" Chromatica
let g:chromatica#enable_at_startup = 1
let g:chromatica#responsive_mode = 1    " Enable live syntax coloring

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_confirm_extra_conf = 0

"--- Other files ---"
source $HOME/.config/nvim/projects.vim
