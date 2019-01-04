
call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go'
Plug 'Shougo/deoplete-clangx'
Plug 'scrooloose/nerdtree'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/deoppet.nvim'

Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'

"System
Plug 'tweekmonster/startuptime.vim'

" Themes
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" added for language server, hides an open file that needs to be saved if a
" new file is opened
set hidden

"Vim settings
let mapleader="\<Space>"
set splitbelow "horizontal split open below
set splitright "vertical split open to the right 
set clipboard+=unnamedplus
set number

set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set laststatus=2

"Deoplete
let g:deoplete#enable_at_startup = 1

" call deoplete#custom#var('clangx', 'default_c_options', '')

let g:LanguageClient_serverCommands = {
    \ 'c': ['/usr/local/bin/clangd'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }


call deoplete#custom#var('clangx', 'default_c_options', '')


" UI
set termguicolors " enables true color
set background = "dark"
colorscheme happy_hacking

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

let g:airline_theme='minimalist'
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


map § :NERDTreeToggle<CR>

" Normal mode key remaps
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <CR> :noh<CR> 		"removes highlighting after a search


" Normal mode buffer stuff
" noremap <leader>bn :enew<CR>
" noremap <leader>l :bnext<CR>
" noremap <leader>h :bprev<CR>
noremap <leader>] :bn<CR>
noremap <leader>[ :bp<CR>
noremap <leader>bq :bp <BAR> bd #<CR>
noremap <leader>bl :ls<CR>
noremap <Leader>t :TagbarToggle<CR>

nmap <c-p> :Files<CR>
nmap <Leader>ft :Tags<CR>


"External Hosts
let g:python_host_prog = '/Users/richard/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/richard/.pyenv/versions/neovim3/bin/python'


"""""""" GOLANG """""""
nmap <Leader>p :GoDecls<CR>
nmap <Leader>pp :GoDeclsDir<CR>

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>e :cnext<CR>
au FileType go nmap <leader>ee :cprevious<CR>
au FileType go nnoremap <leader>ec :cclose<CR>

au FileType go set tabstop=3

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif










"libomp has the following notes:
"    To use this OpenMP library:
"     * For clang-3.8+, or clang-3.7 with +openmp variant:
"        add "-fopenmp" during compilation / linking.
"     * For clang-3.7 without +openmp variant, use:
"        "-I/opt/local/include/libomp -L/opt/local/lib/libomp -fopenmp"
"  python27 has the following notes:
"    To make this the default Python or Python 2 (i.e., the version run by the 'python' or 'python2' commands), run one or both of:

"        sudo port select --set python python27
"        sudo port select --set python2 python27
"
