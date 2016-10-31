" Backups, undos, info and swap files
" original source: https://github.com/docwhat/dotfiles/blob/master/vimrc
"-----------------------------------------------------------------------------
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.

let g:my_vim_dir = expand('~/.vim')

if isdirectory(g:my_vim_dir . '/backup') == 0
  execute 'silent !mkdir -p ' . g:my_vim_dir . '/backup >/dev/null 2>&1'
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
execute 'set backupdir^=' . g:my_vim_dir . '/backup/'
set backupdir^=./.vim-backup/
set backup
" Prevent backups from overwriting each other. The naming is weird,
" since I'm using the 'backupext' variable to append the path.
" So the file '/home/docwhat/.vimrc' becomes '.vimrc%home%docwhat~'
if has('autocmd')
  autocmd BufWritePre * nested let &backupext = substitute(expand('%:p:h'), '/', '%', 'g') . '~'
endif

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory(g:my_vim_dir . '/swap') == 0
  execute 'silent !mkdir -p ' . g:my_vim_dir . '/swap >/dev/null 2>&1'
endif

set directory=./.vim-swap//
execute 'set directory+=' . g:my_vim_dir . '/swap//'
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
execute 'set viminfo+=n' . g:my_vim_dir . '/viminfo'
set viminfo^=!,h,f0,:100,/100,@100

if exists('+undofile')
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory(g:my_vim_dir . '/undo') == 0
    execute 'silent !mkdir -p ' . g:my_vim_dir . '/undo >/dev/null 2>&1'
  endif
  set undodir=./.vim-undo/
  execute 'set undodir+=' . g:my_vim_dir . '/undo/'
  set undofile
  set undolevels=1000         " maximum number of changes that can be undone
  set undoreload=10000        " maximum number lines to save for undo on a buffer reload
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
if has('autocmd')
  autocmd BufReadPost * nested
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

