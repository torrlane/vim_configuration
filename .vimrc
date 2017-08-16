" Tab specific option
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

" fix backspace in windows
set backspace=2
set backspace=indent,eol,start

" code folding options
" use 'zc' to close and 'zo' to open. 'zM' to close all and 'zR' to open all
" lines with equal indent form a fold
set foldmethod=indent
set nofoldenable

" make Ctrl+n toggle the file browser
map <C-n> :NERDTreeToggle<CR>
" The default <leader> is backslash (\)
map <Leader>r :NERDTreeFind<CR>

" Set utf8 as standard encoding
set encoding=utf8
" Show matching brackets when text indicator is over them
set showmatch
set wildmenu

"No annoying sound on errors
set noerrorbells
set novisualbell
set vb t_vb=
set tm=500

" Always display the status line. 
set laststatus=2
" Always display the tab line
set showtabline=2

" Display line and column number in bottom ruler. Not needed as the Airline
" plugin provides this
"set ruler
" Display the line numbers
set number
" Activate syntax highlighting
syntax enable
" set a nice theme
colorscheme desert
if has("gui_running")
    " All of these commands can be temporarily modified by typing :set ...
    " Set a nicer font.
    set guifont=Consolas:h11:cDEFAULT
    " Hide the toolbar.
    set guioptions-=T
    " Hide the menubar
    set guioptions-=m
    " set the tab label
    " %M: + to indicate file was modified, - otherwise
    " %t file name
    set guitablabel=%M\ %t
endif

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt, *.hs, *.md :call CleanExtraSpaces()
endif

" This snippet installs the vim_plug plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/vimfiles/bundle')

" Make sure you use single quotes
" See https://github.com/junegunn/vim-plug for how this all works
" Could not get this to work for the life of me. (2016-10-26)
" Plug 'https://github.com/eagletmt/ghcmod-vim.git'
" Required in order for ghcmod-vim to work
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Installs a super useful file browser
" To see it in action type ':NERDTreeToggle'
Plug 'https://github.com/scrooloose/nerdtree'

" Snippets plugin
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/garbas/vim-snipmate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline_theme='alduin'
