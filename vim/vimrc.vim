set nocompatible
set number
set showcmd
set textwidth=100
set expandtab
set tabstop=2 " indent is 2 spaces long
set shiftwidth=2 " indent is single tab
set laststatus=2 " Always show the status line
set cursorline " highlights the cursor line
set hlsearch " clear with C-L (vim-sensible)
set clipboard=unnamedplus " shared with the OS
set autowrite    " saves file on :next, : previus, :!, etc
set mouse=a

" plugin manager
execute pathogen#infect()
call pathogen#helptags()

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" ====  Appearance ====
colorscheme solarized
let g:solarized_termcolors=256

"set background=light
set background=dark

" ==== Mappings ====
map <F3> :NERDTreeToggle<CR>
map <F4> :UndotreeToggle<CR>
map <F5> :source %<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :!%:p<CR> " execute the this file
"map <F8>
map <F9> :set invpaste<CR>

" make tab in v mode indent code
vmap <tab> >gv
vmap <s-tab> <gv

