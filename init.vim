" reset augroup
augroup MyAutoCmd
autocmd!
augroup END

if &compatible
  set nocompatible
endif

" install dein.vim
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein/dein.toml'
let s:toml_statusline = fnamemodify(expand('<sfile>'), ':h').'/dein/statusline.toml'
let s:toml_complete = fnamemodify(expand('<sfile>'), ':h').'/dein/complete.toml'
let s:toml_lazyfile = fnamemodify(expand('<sfile>'), ':h').'/dein/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#load_toml(s:toml_statusline)
  call dein#load_toml(s:toml_complete)
  call dein#load_toml(s:toml_lazyfile)
  call dein#end()
  call dein#save_state()
endif
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
let g:HOME = expand('~')

" path/to/nvim_dir
let g:NVIM_HOME = g:HOME . '/.config/nvim'

execute('source ' . g:NVIM_HOME . '/settings/path.vim')
execute('source ' . g:NVIM_HOME . '/settings/keymap.vim')
execute('source ' . g:NVIM_HOME . '/settings/option.vim')

