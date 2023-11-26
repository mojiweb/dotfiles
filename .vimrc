" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" UI & Graphics 
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'mhinz/vim-startify'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'arcticicestudio/nord-vim'
Plugin 'rakr/vim-one'
Plugin 'rrethy/vim-illuminate'

" Git
Plugin 'tpope/vim-fugitive'

" Search
Plugin 'ctrlpvim/ctrlp.vim'

" Completion
Plugin 'majutsushi/tagbar'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'ctags.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable syntax highlighting
syntax on

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Syntastic Plugin Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Status bar
set laststatus=2

" Theme
set background=dark
colorscheme iceberg
let g:airline_theme='deus'
let g:solarized_termcolors=256
let g:airline_powerline_fonts = 1

" NERDTree
let g:NERDTreeShowHidden=0
"let g:NERDTreeWinPos = "right"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:airline#extensions#tabline#enabled = 1

"Set default font in mac vim and gvim
set guifont=Inconsolata\ for\ Powerline:h24
set cursorline    " highlight the current line

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Keymaps
nmap <Tab> >ap "indenter un paragraphe
nmap <S-Tab> <ap "desindenter un paragraphe

nmap <C-s> :w<CR>

nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>
nmap <C-t> :enew<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

map <F1> :e ~/.vimrc<CR>
map <F2> :NERDTreeToggle<CR>
"map <F3> :CtrlPMixed<CR>
map <F4> <C-]>
map <F11> :TagbarToggle<CR>
map <F12> :bel terminal ++rows=10<CR>

map <C-p> :CtrlPMixed <CR>
"map <C-h> :Replace 
