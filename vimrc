set nocompatible
filetype off    

" Vundle package
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()            
filetype plugin indent on 

" Horizontal split alias
cnoreabbrev hs split

" Show matching brackets
set showmatch   

" Navigation between splits
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Automatically reload file if changed on disk
set autoread

" Resize current buffer by +/- 5
nnoremap <silent> <M-left> :vertical resize -5<cr>
nnoremap <silent> <M-down> :resize +5<cr>
nnoremap <silent> <M-up> :resize -5<cr>
nnoremap <silent> <M-right> :vertical resize +5<cr>

" Toggle NERDTree like Sublime's sidebar
map <silent> <C-n> :NERDTreeFocus<CR> " Switch focus to nerdtree shortcut

" Set line number
set nu

" Color schemes
set background=dark
colorscheme solarized

" Hide .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" CTRL + P to ingore specific folders and files
let g:ctrlp_custom_ignore = '\v[\/](venv|log|notebook|pretrain_model)|(\.(swp|ico|git|svn|npy))$'

" For syntax checker
let python_highlight_all=1
syntax on

" For PEP8 checker
autocmd BufWritePost *.py call Flake8()

" For YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

" For autoindentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

" For finding with capital letters
set ignorecase
set smartcase

" Set highlight search
set hlsearch

" For vim-airline
set laststatus=2
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
if has("terminfo")
   let &t_Co=16
   let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
   let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
else
   let &t_Co=16
   let &t_Sf="\<Esc>[3%dm"
   let &t_Sb="\<Esc>[4%dm"
endif

" For vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
