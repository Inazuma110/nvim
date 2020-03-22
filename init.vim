" reset augroup
augroup MyAutoCmd
autocmd!
augroup END

if &compatible
  set nocompatible
endif

let s:HOME = expand('~')

" path/to/nvim_dir
let s:NVIM_HOME = s:HOME . '/.config/nvim/'

" install dein.vim
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:dein_rcfiles = split(glob(s:NVIM_HOME . './plugins/normal/*.toml'))
let s:lazydein_rcfiles = split(glob(s:NVIM_HOME . './plugins/lazy/*.toml'))
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(expand('~/.config/nvim/plugins/coc/coc.toml'))
  for s:file in s:dein_rcfiles
    call dein#load_toml(s:file, {'lazy': 0})
  endfor

  for s:file in s:lazydein_rcfiles
    call dein#load_toml(s:file, {'lazy': 1})
  endfor
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

let s:rc_files = split(glob(s:NVIM_HOME . 'rc/*.vim'))
for s:file in s:rc_files
  execute('source ' . s:file)
endfor
