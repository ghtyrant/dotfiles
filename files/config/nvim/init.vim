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
let g:despacio_Sunset = 1
color despacio
hi MatchParen cterm=none ctermbg=grey ctermfg=blue

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

""""""" coc.nvim recommendations
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "<C-n>" :
      \ <SID>check_back_space() ? "<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "<C-p>" : "<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "<C-y>" : "<C-g>u<CR>"
else
  imap <expr> <cr> pumvisible() ? "<C-y>" : "<C-g>u<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
