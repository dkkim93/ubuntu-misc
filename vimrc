call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-pathogen'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim'
Plug 'nvie/vim-flake8'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'vim-scripts/indentpython.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
call plug#end()

" For PATHOGEN
execute pathogen#infect()
filetype plugin indent on
syntax on

" For material theme
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let g:material_theme_style = 'default'
colorscheme material

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

" Hide .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" CTRL + P to ingore specific folders and files
let g:ctrlp_custom_ignore='\v[\/](venv|log|notebook|pretrain_model)|(\.(swp|ico|git|svn|npy))$'

" For syntax checker
let python_highlight_all=1

" Set line number
set nu

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
hi Search ctermbg=Black
hi Search ctermfg=DarkRed

" For vim-airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

" For vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

" Whitespace highlight
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" For git Gutter
let g:gitgutter_set_sign_backgrounds = 0
set updatetime=100

" For PEP8 checker
autocmd BufWritePost *.py call Flake8()

" For deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
