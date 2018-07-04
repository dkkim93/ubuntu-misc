set nocompatible
filetype off

" Vundle package
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe' 
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tmux-plugins/vim-tmux-focus-events'
call vundle#end()
filetype plugin indent on

" Remap <Leader> to comma
let mapleader=","

" Remap colon to semicolon for easier :w etc
nnoremap ; :

" Press F2 to switch to paste mode to avoid autoindents
syntax on
syntax enable
set hlsearch
set background=dark
colorscheme solarized

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0 " ctrlp search path should not change after initial vim launch

" NERD commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Automatically reload file if changed on disk
set autoread 

" au CursorHold * checktime  
au FocusGained,BufEnter * checktime
au CursorHold,CursorHoldI * checktime

" Syntax highlighting settings
autocmd BufNewFile,BufRead *.launch set syntax=xml
set cursorline

" set cursorcolumn
" Set relative line numbering
set relativenumber
set autoread    "If file updates, load automatically
set showmatch   "Show matching brackets

" Vim-airline
:set laststatus=2 " Enable by default
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" let g:airline_powerline_fonts = 1 " Adds nice powerline fonts to airline bar
" let g:Powerline_symbols = 'fancy'
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

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" comfortable-motion
" let g:comfortable_motion_interval=150.0/60
" let g:comfortable_motion_friction =20 
" let g:comfortable_motion_air_drag =5 
" call g:comfortable_motion#flick(1600)
" Open a NERDTree automatically when Vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Spellchecking 
set spell spelllang=en_us
set complete+=kspell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
set ignorecase " make searches case insensitive by default

" Toggle NERDTree like Sublime's sidebar
nmap <Leader>kb :NERDTreeToggle<CR>
" :nnoremap <C-Tab> :bnext<CR>
" :nnoremap <C-S-Tab> :bprevious<CR>
map <silent> <C-n> :NERDTreeFocus<CR> " Switch focus to nerdtree shortcut

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" configure editor with tabs and nice stuff...
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set softtabstop=4
" set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
" make backspaces more powerful
set backspace=indent,eol,start
" set ruler                           " show line and column number
syntax on               " syntax highlighting
"set showcmd             " show (partial) command in status line
" Default vim always loads PEP8 python style file, which sets tabs to size 4. So undo it here.
augroup python
    autocmd!
    " Real men always use real tabs, and I like it four spaces wide.
    autocmd FileType python setlocal ts=4 sts=4 sw=4
augroup end

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

" For ycm clang
let g:ycm_global_ycm_extra_conf = '/home/dongki/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Horizontal split alias
cnoreabbrev hs split

" resize current buffer by +/- 5 
nnoremap <M-left> :vertical resize -5<cr>
nnoremap <M-down> :resize +5<cr>
nnoremap <M-up> :resize -5<cr>
nnoremap <M-right> :vertical resize +5<cr>

set number

" To enable buffer history
" ref: https://stackoverflow.com/questions/2732267/vim-loses-undo-history-when-changing-buffers
set hidden

" For vim-pathogen
" ref: https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" For flake8
" ref: https://github.com/nvie/vim-flake8
autocmd BufWritePost *.py call Flake8()
