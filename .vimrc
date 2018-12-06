"System Clipboard

set clipboard=unnamed

" Vim in shell

"set editing-mode vi

"UTF - 8 support 

set encoding=utf-8

set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" PEP 8 proper indentation

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Full stack development

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Support for virtualenv 

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" Plugin Place

Plugin 'tmhedberg/SimpylFold'

let g:SimpylFold_docstring_preview=1

" Auto identification

Plugin 'vim-scripts/indentpython.vim'

" Config

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Auto-Complete

Bundle 'Valloric/YouCompleteMe'

" Config

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntax Checking/Highlighting

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

" Config

let python_highlight_all=1
syntax on

" Color Schemes

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'


" Config 

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

" File Browser

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Config

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" Super Searching 

Plugin 'kien/ctrlp.vim'
" Ctrl + P search 
" Config

set nu

" Git integration
Plugin 'tpope/vim-fugitive'

" Powerline 

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
