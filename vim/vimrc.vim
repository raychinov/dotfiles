set nocompatible
set number
set showcmd
set textwidth=100
set tabstop=4 " indent is 4 spaces long
set shiftwidth=4 " indent is single tab
set laststatus=2 " Always show the status line
set cursorline " highlights the cursor line
set hlsearch " clear whith C-L (vim-sensible)
set clipboard=unnamedplus " shared with the OS

" plugin manager
execute pathogen#infect()

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" ====  Appearance ====
colorscheme solarized

if has('gui_running')
    set background=light
else
    set background=dark
endif

if has('gui_running')
	set guioptions-=m " remove menu bar
	set guioptions-=T " remove toolbar
	set guioptions-=r " remove right-hand scroll bar
	set guioptions-=L " remove left-hand scroll bar
endif

" ==== Mappings ====
map <F2> :TagbarToggle<CR>
map <F3> :NERDTreeToggle<CR>
map <F4> :source ~/.vim/vimrc.vim<CR>
map <F5> :setlocal spell! spelllang=en_us<CR>

map <C-Tab> :bnext<CR>
map <C-S-Tab> :bprevious<CR>

" make tab in v mode indent code
vmap <tab> >gv
vmap <s-tab> <gv

" Disable arrow keys
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
